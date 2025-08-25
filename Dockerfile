FROM python:3.8-slim
LABEL maintainer="GUENDERGUE Malloum David"

ADD student_age.py /
COPY requirements.txt /

RUN apt-get update -y && apt-get install -y \
    python3-dev \
    libsasl2-dev \
    libldap2-dev \
    libssl-dev \
    gcc \
    build-essential \
    --no-install-recommends && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN pip3 install -r /requirements.txt

VOLUME ["/data"]
EXPOSE 5000

CMD ["python3", "./student_age.py"]