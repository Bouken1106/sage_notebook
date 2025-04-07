FROM sagemath/sagemath:latest

# ルート権限に切り替え
USER root

# 非対話モードを指定してtzdataを静かにインストールする
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Tokyo

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    locales \
    tzdata \
    && rm -rf /var/lib/apt/lists/*

# ユーザーを戻す
USER sage

RUN sage -pip install notebook

WORKDIR /home/sage/work

CMD ["/usr/bin/sage", "-n", "jupyter", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
