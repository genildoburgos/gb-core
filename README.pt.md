# GB Core 🚀
<p align="center">
	<img src="https://gb-core-imagens.s3.us-east-2.amazonaws.com/images/ea94b5fe-dbc5-4af3-9ced-dcb63b80c971/7aad0d8a-f433-4146-9f9c-64aa5ecfd68e.jpg" alt="Banner GB Core" style="max-width:100%; width:450px;">
</p>

Bem-vindo ao GB Core — meu Hub Lab pessoal. Este repositório funciona como o "core" para centralizar experimentos, provas de conceito, utilitários e protótipos que estou desenvolvendo. Pense nele como o laboratório digital onde testo ideias, componho pequenos serviços e organizo projetos pessoais.

## 🚀 Visão

O objetivo deste hub é criar um ponto único e evolutivo para:

- Experimentação rápida (microserviços, scripts, infra-as-code).
- Centralizar ferramentas e bibliotecas reutilizáveis.
- Prototipagem de features antes de levar para projetos maiores.

## Ideias para experimentar

- Microsserviços com hot-reload.
- Pipelines leves de CI para validação automática.
- Componentes compartilháveis para automação pessoal.

## Contribuições

Espaço pessoal — contribuições são bem-vindas. Abra uma issue ou envie um PR com a descrição da mudança. Prefira commits pequenos e claros.

## Contato

Abra uma issue ou use o contato do meu perfil para conversar sobre alguma ideia.


## Configuração do Terraform

Este repositório contém código Terraform usado para provisionar uma pequena infraestrutura pessoal para experimentos e protótipos. Algumas observações importantes sobre a configuração atual:

- Este bucket foi intencionalmente configurado como public-read-only e hardenizado contra gravações públicas. Objetos podem ser lidos por URLs públicas, mas gravação pública é evitada.
- A configuração do Terraform foi feita com atenção a custos: recursos e padrões foram escolhidos para, sempre que possível, não ultrapassar os limites do AWS Free Tier.
- O setup foi inicialmente pensado como infraestrutura pessoal (para experimentação e aprendizado), e não como um ambiente de produção. Revise e endur e as políticas antes de usar em produção.
