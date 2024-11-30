# Dev-Container

Dev-Container example for CI Fuzz. Built on Ubuntu 24.04.

## Requirements
- docker
- VS Code
- Dev Container extension for VS Code: ```ms-vscode-remote.remote-containers```
- "CIFUZZ_CREDENTIALS" exported as environment variable (f.e. like `export CIFUZZ_CREDENTIALS=[my_token]`).
- Optional: LLM variables exported as environment variable (f.e. like `export CIFUZZ_LLM_API_TOKEN=[my_token]`).