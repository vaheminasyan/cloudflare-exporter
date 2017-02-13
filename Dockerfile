FROM wehkamp/alpine:3.4

ENTRYPOINT ["python", "-m", "exporter"]
EXPOSE 9199
ENV FLASK_APP=/exporter/exporter/app.py \
    SERVICE_PORT=9199

RUN LAYER=build \
  && apk add -U python py-pip \
  && pip install prometheus_client requests apscheduler Flask \
  && rm -rf /var/cache/apk/* \
  && rm -rf ~/.cache/pip

ADD ./exporter /exporter

LABEL container.name=wehkamp/prometheus-cloudflare-exporter:1.0
