FROM ghcr.io/berriai/litellm:main-stable

COPY litellm_config.yaml /app/config.yaml

EXPOSE 8084

CMD ["--config", "/app/config.yaml", "--port", "8084", "--num_workers", "4"]
