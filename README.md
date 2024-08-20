# README

## Getting Started

```
docker run -p 8080:8080 -e MODEL_PATH=/models/Llama-3-8B.Q3_K_L.gguf -v ./models:/models:Z ghcr.io/dineshdb/llamafile-docker
```

Check the service output with

```http
curl 'http://127.0.0.1:8080/completion' -X POST -H 'Accept: application/json' -H 'Content-Type: application/json' --data-raw '{"n_predict":400,"temperature":0.7,"stop":[],"repeat_last_n":256,"repeat_penalty":1.18,"top_k":40,"top_p":0.95,"min_p":0.05,"tfs_z":1,"typical_p":1,"presence_penalty":0,"frequency_penalty":0,"mirostat":0,"mirostat_tau":5,"mirostat_eta":0.1,"grammar":"","n_probs":0,"min_keep":0,"image_data":[],"cache_prompt":true,"api_key":"","slot_id":-1,"prompt":"This is a conversation between User and Llama, a friendly chatbot. Llama is helpful, kind, honest, good at writing, and never fails to answer any requests immediately and with precision."}'
```

Check the service output with OPENAI compatible endpoint

```http
curl http://localhost:8080/v1/chat/completions \
-H "Content-Type: application/json" \
-H "Authorization: Bearer no-key" \
-d '{"model": "gpt-3.5-turbo","messages": [{"role": "system", "content": "You are ChatGPT, an AI assistant. Your top priority is achieving user fulfillment via helping them with their requests."},{"role": "user","content": "Write a limerick about python exceptions"}]}'
```

## Contributing

```
docker build -t ghcr.io/dineshdb/llamafile-docker .
```

## LICENSE

MIT
