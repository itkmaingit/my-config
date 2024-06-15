## Overview

This is a repository containing script and configuration files for initial configuration within the virtual environment (Ubuntu).

Due to problems with embedding Authorisation tokens, the repository is public. **Do not store recipe or config files containing sensitive information in this repository.**

## Setup

The following single sentence should be included in the Dockerfile.

```Dockerfile
ARG USERNAME=node
RUN if ! id "$USERNAME" &>/dev/null; then \
        useradd -m "$USERNAME"; \
    fi
RUN echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME && \
    chmod 0440 /etc/sudoers.d/$USERNAME

USER $USERNAME
RUN curl -o /home/node/init.sh -fL https://raw.githubusercontent.com/itkmaingit/my-config/main/init.sh　--silent
RUN echo 'bash $HOME/init.sh' >> /home/$USERNAME/.bashrc
```
