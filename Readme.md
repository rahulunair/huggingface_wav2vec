## Huggingface Wav2vec2

A dockerized version of wav2vec2 for automatic speech recognition and transcribing.

## Build image

```bash
make build
```
## Run image

```bash
make run
```

## Running tests

Once inside the container run:

### Evaluate score:

```bash
python3 scripts/evaluate.py
```

### Transcribe audio

```python
python3 scripts/transcribe.py
```

## TODO

- API layer to access the service over http

## More details

Official model card from huggingface: https://huggingface.co/facebook/wav2vec2-base-960h

