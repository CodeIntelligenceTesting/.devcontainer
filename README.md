# Dev-Container

Dev-Container example for CI Fuzz. Built on Ubuntu 24.04. The files need to be stored in a .devcontainer folder directly under the project root. Fore easy integration you can also use it as a git submodule in the project you want to test.

## Requirements
- docker
- VS Code
- Dev Container extension for VS Code: ```ms-vscode-remote.remote-containers```
- "CIFUZZ_CREDENTIALS" exported as environment variable (f.e. like `export CIFUZZ_CREDENTIALS=[my_token]`).
- Optional: LLM variables exported as environment variable (f.e. like `export CIFUZZ_LLM_API_TOKEN=[my_token]`). Look at the [devcontainer.json](devcontainer.json#L11) "remoteEnv" variables to get a list of all available variables.


## Submodule Infos
If you have added this project as submodule you could set ```git config submodule.recurse true``` to automatically update the devcontainer setup on pull requests as well. This is an option every user has to set.