# Dev-Container

Dev-Container example for CI Fuzz. Built on Ubuntu 24.04. The files need to be stored in a .devcontainer folder directly under the project root you want to use it for. For easy integration you can also use it as a git submodule in the project you want to test.

Always start the dev-container from the root of the project you use this for and not in the .devconatiner folder.

## Requirements
- docker or podman
- VS Code or other IDEs that support devcontainers
- IF you use VS Code: Dev Container extension for VS Code: ```ms-vscode-remote.remote-containers```
- "CIFUZZ_CREDENTIALS" exported as environment variable (f.e. like `export CIFUZZ_CREDENTIALS=[my_token]`).
- IF you run it on a Windows OS: Docker Desktop container mode switched to Linux.
- Optional: LLM variables exported as environment variable (f.e. like `export CIFUZZ_LLM_API_TOKEN=[my_token]`). Look at the [devcontainer.json](devcontainer.json#L11) "remoteEnv" variables to get a list of all available variables.


## Submodule Infos
If you have added this project as submodule you could set ```git config submodule.recurse true``` to automatically update the devcontainer setup on pull requests as well. This is an option every user has to set.

## Additional Information

### ARM Architectures
The Dockerfile currently enforces amd64 architecture, meaning that running this docker container on an ARM64 CPU will trigger emulation and therefor have reduced performance in comparison to amd64 powered systems. 

### Docker / Podman Installation Information

Podman and Docker are two different possibilities to run the dev-containers. They both support the same standard Container Runtime Interface for Open Container Initiative Images and Runtimes (CRI-O).

Docker is proprietary software from the Docker Inc. that may require you to have a license. Podman is an open source tool backed up by Redhat that tackled the architecture security flaws of Docker.

#### Podman Installation
Podman can be installed on Windows, MacOS and Linux based distributions. The instructions are linked [here](https://podman.io/docs/installation).

To use VS Code with Podman you also need to link docker calls to podman. An example for all operating systems can be found [here](https://hackernoon.com/empowering-your-devcontainer-with-podman-in-vs-code).

#### Docker
Docker exists of two programs, the Docker Desktop, a gui programm that is available for Windows, MacOS and major Linux based OS and Docker Engine, the underlying heavy lifting program. Docker Engine is always already included in the Docker Desktop programm. It is only possible to install Docker Engine directly on a Linux based OS.

##### Docker Desktop
Information about Docker Desktop and installation instructions can be found [here](https://docs.docker.com/desktop/).

##### Docker Engine
The Docker Engine installation instruction for Linux based OS can be found [here](https://docs.docker.com/desktop/).
As of 10th of January 2025 it is released under the Apache License, Version 2.0.

##### Windows
If you are using Docker on Windows, please make sure Docker Desktop container mode is switched to Linux.