FROM debian:bullseye-slim

ENV DEBIAN_FRONTEND=noninteractive
# 🟢 Add /usr/games to PATH so cowsay & fortune are found
ENV PATH="/usr/games:${PATH}"

RUN apt-get update && \
    apt-get install -y fortune-mod cowsay netcat-openbsd && \
    rm -rf /var/lib/apt/lists/*


WORKDIR /app
COPY wisecow.sh .
RUN chmod +x wisecow.sh

EXPOSE 4499
CMD ["./wisecow.sh"]

