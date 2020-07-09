FROM centos

RUN yum install wget -y
RUN yum install sudo -y
RUN wget https://dl.grafana.com/oss/release/grafana-7.0.5-1.x86_64.rpm
RUN sudo yum install grafana-7.0.5-1.x86_64.rpm -y

WORKDIR /usr/share/grafana/


EXPOSE 3000

CMD /usr/sbin/grafana-server start && /usr/sbin/grafana-server enable

