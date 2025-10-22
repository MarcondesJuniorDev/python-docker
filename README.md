# Projeto Django com Docker e Postgres

Este repositório contém o esboço de um projeto web em Python usando Django, com toda a stack executada em contêineres Docker.

Objetivo
--------
Criar uma aplicação Django produtiva e reproduzível, empacotada com Docker e orquestrada via Docker Compose, usando PostgreSQL como banco de dados.

Stack principal
---------------
- Python (Django)
- PostgreSQL
- Docker (containers por serviço)
- Docker Compose (orquestração local)

Visão arquitetural
------------------
Cada componente principal roda em seu próprio contêiner: um contêiner para a aplicação Django (Gunicorn em produção), outro para o banco de dados PostgreSQL e, opcionalmente, um contêiner para proxy reverso (Nginx). A comunicação entre serviços é feita pela rede do Compose. Dados persistentes do banco ficam em volumes Docker.

Estrutura prevista
------------------
- Dockerfile (app Django)
- docker-compose.yml (definição de serviços: web, db, possivelmente proxy)
- app/ (código Django: projetos e apps)
- config/ (configurações, envs, entrypoint)

Próximos passos
---------------
1. Inicializar o projeto Django e o repositório Git.
2. Escrever o Dockerfile para a aplicação e o docker-compose.yml definindo `web` e `db`.
3. Configurar as variáveis de ambiente e a conexão com o PostgreSQL.
4. Implementar migrations, testes básicos e documentação mínima de deploy.

Notas
-----
Este README é uma visão geral inicial — sem comandos ou trechos de código conforme solicitado. Posso expandir com um guia de setup, exemplos de Dockerfile/docker-compose e instruções de deploy quando você quiser.

