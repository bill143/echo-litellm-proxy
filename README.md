# ECHO LiteLLM Proxy — O'Neill Contractors

Production LLM routing proxy for the ECHO middleware.
Deployed on Railway, consumed by Vercel serverless functions.

## Architecture

```
Vercel (nexus-est-app.vercel.app)
  └─ POST /api/echo/chat
       └─ OpenAI SDK → https://echo-litellm.up.railway.app/v1
            └─ LiteLLM Proxy (this repo)
                 ├─ claude-opus-4-6    → Anthropic Claude Sonnet 4
                 ├─ gemini-pro-long    → Google Gemini 2.5 Flash
                 ├─ gpt5-strategy      → OpenAI GPT-4o
                 ├─ deepseek-bulk      → DeepSeek Chat
                 ├─ gpt-5.4-pro       → OpenAI GPT-4o
                 ├─ claude-3-7-sonnet  → Anthropic Claude 3.7
                 ├─ gemini-3.1-pro     → Google Gemini 2.5 Flash
                 ├─ kimi-k2.5         → Moonshot Kimi
                 └─ grok-3            → xAI Grok 3
```

## Environment Variables (set on Railway)

| Variable | Description |
|----------|-------------|
| LITELLM_MASTER_KEY | Master API key for proxy auth |
| ANTHROPIC_API_KEY | Anthropic (Tier 1 Compliance) |
| GOOGLE_AI_API_KEY | Google AI (Tier 2 Long Doc) |
| OPENAI_API_KEY | OpenAI (Tier 3 Strategy) |
| DEEPSEEK_API_KEY | DeepSeek (Tier 4 Bulk) |
| OPENAI_API_KEY_2 | OpenAI (gpt-5.4-pro alias) |
| ANTHROPIC_API_KEY_2 | Anthropic (Claude 3.7 Sonnet) |
| GOOGLE_AI_API_KEY_2 | Google AI (gemini-3.1-pro alias) |
| MOONSHOT_API_KEY | Moonshot (Kimi K2.5) |
| XAI_API_KEY | xAI (Grok 3) |
