FROM ubuntu:18.04

RUN apt-get update && apt-get install -y \
  software-properties-common

RUN add-apt-repository universe

RUN apt-get update && apt-get install -y \
  git \
  curl \
  python3.7 \
  python3-pip

RUN echo "alias python=python3.7" >> ~/.bashrc
RUN echo "alias pip=pip3" >> ~/.bashrc

WORKDIR /pipeline

ENV SLUGIFY_USES_TEXT_UNIDECODE=yes

RUN pip3 --no-cache-dir install \
    'wheel==0.33.1' \
    'psycopg2==2.7.7' \
    'Cython==0.29.6' \
    'pytz==2018.9' \
    'pyOpenSSL==19.0.0' \
    'ndg-httpsclient==0.5.1' \
    'pyasn1==0.4.5' \
    'psutil==5.6.1' \
    'apache-airflow[postgres]==1.10.2'
