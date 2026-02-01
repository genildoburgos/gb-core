#!/bin/bash
set -e

# Cores para logs
GREEN='\033[0;32m'
RESET='\033[0m'

echo -e "${GREEN}--- Iniciando configuração de segurança do Banco de Dados ---${RESET}"

# Variáveis do ambiente (passadas pelo docker-compose)
# POSTGRES_USER é o superadmin (root)

# 1. Criar Usuário e Banco do n8n
echo -e "${GREEN}Criando usuário e banco do n8n...${RESET}"
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER $N8N_DB_USER WITH PASSWORD '$N8N_DB_PASSWORD';
    CREATE DATABASE $N8N_DB_NAME;
    GRANT ALL PRIVILEGES ON DATABASE $N8N_DB_NAME TO $N8N_DB_USER;
    -- No Postgres 15+ é preciso garantir permissão no schema public
    \c $N8N_DB_NAME
    GRANT ALL ON SCHEMA public TO $N8N_DB_USER;
EOSQL

# 2. Criar Usuário e Banco da API
echo -e "${GREEN}Criando usuário e banco da API...${RESET}"
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER $API_DB_USER WITH PASSWORD '$API_DB_PASSWORD';
    CREATE DATABASE $API_DB_NAME;
    GRANT ALL PRIVILEGES ON DATABASE $API_DB_NAME TO $API_DB_USER;
    \c $API_DB_NAME
    GRANT ALL ON SCHEMA public TO $API_DB_USER;
EOSQL

# 3. Aplicar Isolamento (Segurança)
# Impede que um usuário conecte no banco do outro
echo -e "${GREEN}Aplicando regras de isolamento...${RESET}"
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    -- Revoga permissão de conexão cruzada
    REVOKE CONNECT ON DATABASE $N8N_DB_NAME FROM $API_DB_USER;
    REVOKE CONNECT ON DATABASE $API_DB_NAME FROM $N8N_DB_USER;
    
    -- Opcional: Remover acesso publico (Hardening)
    REVOKE CONNECT ON DATABASE $N8N_DB_NAME FROM PUBLIC;
    REVOKE CONNECT ON DATABASE $API_DB_NAME FROM PUBLIC;
EOSQL

echo -e "${GREEN}--- Configuração do Banco Concluída com Sucesso ---${RESET}"
