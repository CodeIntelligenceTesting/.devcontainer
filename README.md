# Dev-Container

Dev-Container example for CI Fuzz. Build on Ubuntu 22.04.

## Requirements
- docker
- VS Code
- Dev Container extension for VS Code: ```ms-vscode-remote.remote-containers```
- "CIFUZZ_CREDENTIALS" exported as environment variable (f.e. like `export CIFUZZ_CREDENTIALS=[my_token]`).
- Optional: LLM API token exported as environment variable (f.e. like `export CIFUZZ_LLM_API_TOKEN=[my_token]`).