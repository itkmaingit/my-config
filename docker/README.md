## Overview

Dockerfileを使用する際に、頻出する操作を記述しておく。

### sudo userのセットアップ
```
ARG USERNAME=node
RUN apt update && \
    apt upgrade -y && \
    apt install -y sudo curl bash && \
    curl -sSfL https://raw.githubusercontent.com/itkmaingit/my-config/main/docker/setup_user.sh | bash -s $USERNAME
```
