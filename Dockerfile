FROM mcr.microsoft.com/devcontainers/cpp:1-ubuntu-24.04

# Optionally if a packet inspection solution causes invalid certificate errors.
# For example ZScaler solutions, etc.
# your_certificate.crt needs to be in the .devcontainer directory.
#
#RUN apt-get update && apt-get install -y ca-certificates
#COPY your_certificate.crt /usr/local/share/ca-certificates/
#RUN update-ca-certificates

#ARG REINSTALL_CMAKE_VERSION_FROM_SOURCE="3.22.2"

# Optionally install the cmake for vcpkg
#COPY ./reinstall-cmake.sh /tmp/

#RUN if [ "${REINSTALL_CMAKE_VERSION_FROM_SOURCE}" != "none" ]; then \
#        chmod +x /tmp/reinstall-cmake.sh && /tmp/reinstall-cmake.sh ${REINSTALL_CMAKE_VERSION_FROM_SOURCE}; \
#    fi \
#    && rm -f /tmp/reinstall-cmake.sh

# [Optional] Uncomment this section to install additional vcpkg ports.
# RUN su vscode -c "${VCPKG_ROOT}/vcpkg install <your-port-name-here>"

# Fuzzing dependencies
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    \
    cmake \
    clang \
    llvm \
    lcov \
    libclang-rt-dev

# Installing cifuzz and adding autocompletion
RUN --mount=type=secret,id=CIFUZZ_CREDENTIALS,required sh -c "$(curl -fsSL http://downloads.code-intelligence.com/assets/install-cifuzz.sh)" $(cat /run/secrets/CIFUZZ_CREDENTIALS) latest  
RUN cifuzz completion bash > /etc/bash_completion.d/cifuzz
