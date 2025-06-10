FROM mcr.microsoft.com/devcontainers/cpp:1-ubuntu-24.04

# Optionally if a packet inspection solution causes invalid certificate errors.
# For example ZScaler solutions, etc.
# your_certificate.crt needs to be in the .devcontainer directory.
#
#RUN apt-get update && apt-get install -y ca-certificates
#COPY your_certificate.crt /usr/local/share/ca-certificates/
#RUN update-ca-certificates

# Fuzzing dependencies
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    \
    cmake \
    clang \
    llvm \
    lcov \
    libclang-rt-dev \ 
    ninja-build

# Installing cifuzz and adding autocompletion
RUN --mount=type=secret,id=CIFUZZ_CREDENTIALS,required sh -c "$(curl -fsSL http://downloads.code-intelligence.com/assets/install-cifuzz.sh)" $(cat /run/secrets/CIFUZZ_CREDENTIALS) latest  
RUN cifuzz completion bash > /etc/bash_completion.d/cifuzz
