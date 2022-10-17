FROM debian:buster-slim

RUN addgroup --gid 10001 app \
&& adduser --system --home /app --uid 10001 --gid 10001 app \
&& mkdir /app/.config

RUN apt-get update \
&& apt-get install -y curl ca-certificates xorg libgtk-3-0 libnss3 libasound2  \
&& rm -rf /var/lib/apt/lists/*

ARG REPOCKET_URL="https://repocket-production.s3.fr-par.scw.cloud/repocket-desktop/updates/Repocket-1.0.4.AppImage"

RUN curl -o/app/repocket "$REPOCKET_URL" \
&& chown -R app:app /app \
&& chmod +x /app/repocket

WORKDIR /app
USER app

ENTRYPOINT ["./repocket", "--appimage-extract-and-run", "--no-sandbox"]
