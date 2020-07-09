FROM centos

RUN yum install tar-2:1.30-4.el8.x86_64 -y
RUN yum install wget -y
RUN wget https://github.com/prometheus/prometheus/releases/download/v2.19.2/prometheus-2.19.2.linux-amd64.tar.gz
RUN tar -xzf /prometheus-2.19.2.linux-amd64.tar.gz -C /
RUN rm -rf  prometheus-2.19.2.linux-amd64.tar.gz
RUN mkdir /etc/prometheus
RUN mkdir /var/lib/prometheus

RUN cp prometheus-2.19.2.linux-amd64/prometheus /usr/local/bin/
RUN cp prometheus-2.19.2.linux-amd64/promtool /usr/local/bin/
RUN cp prometheus-2.19.2.linux-amd64/prometheus.yml /etc/prometheus/
RUN cp -r prometheus-2.19.2.linux-amd64/consoles /etc/prometheus
RUN cp -r prometheus-2.19.2.linux-amd64/console_libraries /etc/prometheus

COPY node_exporter-1.0.0-rc.1.linux-amd64 /
EXPOSE 9090

CMD [ "/usr/local/bin/prometheus", "--config.file=/etc/prometheus/prometheus.yml", "--storage.tsdb.path=/prometheus" ]

