# ============================================================================
# ECHO LiteLLM Proxy — hardened image (phase-2)
#
# Hardening:
#   - Base image pinned to an immutable version tag + digest (never :latest).
#     v1.88.1 resolves to the same digest as main-stable (verified 2026-06-11).
#   - Runs as the Wolfi base image's built-in non-root user (uid 65532).
#   - Single stage, minimal layers, WORKDIR /app.
#   - Binds ${PORT:-4000}: defaults to 4000 for docker-compose, honors the
#     PORT injected by Railway in production.
#   - Config lives at /app/config.yaml (the path the entrypoint loads).
# ============================================================================
FROM ghcr.io/berriai/litellm:v1.88.1@sha256:c98c9395c56a35b7abacff8269d43ff99aabacb62bbf42a04cc1514fcb9bde4a

WORKDIR /app

# Copy proxy config to the path the entrypoint reads.
COPY litellm_config.yaml /app/config.yaml

# The Wolfi base ships a built-in unprivileged user "nonroot" (uid 65532).
# Hand it ownership of the app dir, then drop root.
RUN chown -R 65532:65532 /app

USER 65532

# Documentation only; the published port is decided by compose / Railway.
EXPOSE 4000

# Honor $PORT (Railway) with a 4000 default (compose / local). sh -c expands the
# variable while keeping the LiteLLM entrypoint working.
ENTRYPOINT ["sh", "-c", "litellm --config /app/config.yaml --host 0.0.0.0 --port ${PORT:-4000}"]
