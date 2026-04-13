FROM ghcr.io/berriai/litellm:main-latest

COPY litellm_config.yaml /app/config.yaml

ENV PORT=8080

ENTRYPOINT ["litellm"]
CMD ["--config", "/app/config.yaml", "--port", "8080", "--host", "0.0.0.0"]
