# GB Core 🚀

<p align="center">
	<img src="https://gb-core-imagens.s3.us-east-2.amazonaws.com/images/ea94b5fe-dbc5-4af3-9ced-dcb63b80c971/7aad0d8a-f433-4146-9f9c-64aa5ecfd68e.jpg" alt="GB Core Banner" style="max-width:100%; width:450px;">
</p>

Welcome to GB Core — my personal Hub Lab. This repository acts as the "core" to centralize experiments, proofs of concept, utilities, and prototypes I'm developing. Think of it as the digital lab where I try ideas, assemble small services and organize personal projects.

🇧🇷 For the Portuguese version of readme, click here: [Portuguese README](README.pt.md)

## Vision

The goal of this hub is to create a single, evolving place to:

- Rapid experimentation (microservices, scripts, infra-as-code).
- Centralize reusable tools and libraries.
- Prototype features before moving them to larger projects.

## Ideas to explore

- Microservices with hot-reload for fast feedback.
- Lightweight CI pipelines to validate prototypes automatically.
- Shared components for personal automation.

## Contributing

This is primarily a personal workspace — contributions are welcome. Please open an issue or send a PR describing the change and purpose. Prefer small, focused commits with descriptive messages.

## Contact

If you want to discuss any idea here: open an issue or find me via the contact in my profile.

## Terraform setup

This repository includes Terraform code used to provision a small personal infrastructure for experiments and small prototypes. A few important notes about the current configuration:

- This bucket is intentionally public-read-only and hardened against public writes. Objects can be read via public URLs, but public write access is prevented.
- The Terraform configuration was created with cost-awareness in mind: resources and defaults were chosen to avoid exceeding the AWS Free Tier where possible.
- The setup was initially configured to be a personal infrastructure (for experimentation and learning), not a production-grade environment. Review and tighten policies before using in production.

Notas em Português:

- Este repositório contém código Terraform usado para provisionar uma pequena infraestrutura pessoal para experimentos e protótipos.
- O bucket foi intencionalmente configurado como public-read-only e hardened contra gravações públicas. Objetos podem ser lidos por URLs públicas, mas gravação pública é evitada.
- A configuração do Terraform foi feita com atenção a custos: recursos e padrões foram escolhidos para, sempre que possível, não ultrapassar os limites do AWS Free Tier.
- Inicialmente este setup foi pensado como infraestrutura pessoal (experimentação e aprendizado). Revise e endureça as políticas antes de usar em produção.


