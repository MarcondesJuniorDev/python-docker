FROM python:3.13.9-alpine3.22
LABEL maintainer="mncjdev@gmail.com"

ENV PYTHONDONTWRITEBYTECODE 1

ENV PYTHONUNBUFFERED 1

COPY ./djangoapp /djangoapp
COPY ./scripts /scripts

WORKDIR /djangoapp

EXPOSE 8000

RUN python -m venv /venv && \
    /venv/bin/pip install --upgrade pip && \
    /venv/bin/pip install -r /djangoapp/requirements.txt && \
    # Criar usuário duser com UID/GID 1000 (mesmo do host) para evitar problemas de permissão
    adduser -D -H -u 1000 duser && \
    mkdir -p /data/web/static /data/web/media && \
    # Ajustar permissões e propriedade
    chown -R duser:duser /venv /data/web/static /data/web/media && \
    chmod -R 755 /data/web/static /data/web/media && \
    chmod -R +x /scripts

# Colocar scripts e venv no PATH
ENV PATH="/scripts:/venv/bin:$PATH"

# Usar usuário não-root com mesmo UID do host
USER duser

# Executar o script de inicialização do container (arquivo em /scripts/commands.sh)
CMD ["/scripts/commands.sh"]