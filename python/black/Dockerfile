# This image is for Black - the opinionated formatter for Python
# Inspired by https://github.com/cytopia/docker-pylint
# Run locally after building: docker run -it -v $(pwd):/data/ blackit:latest black --check .
FROM alpine:3.15 as builder

RUN set -x \
    && apk add --no-cache \
	   bc \
	   gcc \
	   libffi-dev \
	   make \
	   musl-dev \
	   openssl-dev \
	   py3-pip \
	   python3 \
	   python3-dev

RUN set -x \
    && pip3 install --no-cache-dir --no-compile black \
    && find /usr/lib/ -name '__pycache__' -print0 | xargs -0 -n1 rm -rf \
    && find /usr/lib/ -name '*.pyc' -print0 | xargs -0 -n1 rm -rf


FROM alpine:3.15 as production

RUN set -x \
    && apk add --no-cache python3 py3-pip \
    && ln -sf /usr/bin/python3 /usr/bin/python \
    && ln -sf /usr/bin/pip3 /usr/bin/pip \
    && find /usr/lib/ -name '__pycache__' -print0 | xargs -0 -n1 rm -rf \
    && find /usr/lib/ -name '*.pyc' -print0 | xargs -0 -n1 rm -rf

COPY --from=builder /usr/lib/python3.9/site-packages/ /usr/lib/python3.9/site-packages/
COPY --from=builder /usr/bin/black /usr/bin/black
ENV PATH=/usr/bin:$PATH
WORKDIR /data

CMD ["python3"]
