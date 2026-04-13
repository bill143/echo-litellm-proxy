FROM ghcr.io/berriai/litellm:main-latest

COPY litellm_config.yaml /app/config.yaml

EXPOSE 8084

ENTRYPOINT ["litellm"]
CMD ["--config", "/app/config.yaml", "--port", "8084"]
