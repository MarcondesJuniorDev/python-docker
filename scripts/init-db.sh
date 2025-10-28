#!/bin/bash
set -e

# Script executado automaticamente pelo Postgres na inicialização
# Cria o database "blog_user" se não existir, evitando logs FATAL

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    -- Criar database blog_user se não existir
    SELECT 'CREATE DATABASE blog_user OWNER blog_user'
    WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'blog_user')\gexec
    
    -- Garantir que o usuário blog_user tem todas as permissões
    GRANT ALL PRIVILEGES ON DATABASE blog_user TO blog_user;
EOSQL

echo "✅ Database 'blog_user' criado/verificado com sucesso"
