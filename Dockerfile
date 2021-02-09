FROM python:3.8

LABEL maintainer="phuocbaohuynh@gmail.com"

ENV PYTHONUNBUFFERED=1

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    # Needed for GPG
    dirmngr \
    gnupg2 \
    # Needed for fetching stuff
    ca-certificates \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Fetch trusted keys
RUN for key in \
    # Node - gpg keys listed at https://github.com/nodejs/node
    94AE36675C464D64BAFA68DD7434390BDBE9B9C5 \
    FD3A5288F042B6850C66B31F09FE44734EB7990E \
    71DCFD284A79C3B38668286BC97EC7A07EDE3FC1 \
    DD8F2338BAE7501E3DD5AC78C273792F7D83545D \
    C4F0DFFF4E8C1A8236409D08E73BC641CC11F4C8 \
    B9AE9905FFD7803F25714661B63B535A4C206CA9 \
    77984A986EBC2AA786BC0F66B01FBB92821C587A \
    8FCCA13FEF1D0C2E91008E09770F7A9A5AE15600 \
    4ED778F539E3634C779C87C6D7062848A1AB005C \
    A48C2BEE680E841632CD4E44F07496B3EB3C1762 \
    B9E2F5981AA6E0CD28160D9FF13993A75599653C \
    ; do \
    # Let's try several servers to ensure we get all the keys
    for server in \
    keys.openpgp.org \
    keyserver.ubuntu.com \
    hkps.pool.sks-keyservers.net \
    ; do \
    gpg2 --batch --keyserver "$server" --recv-keys "$key"; \
    done \
    done

# Get and set up Node for front-end asset building
COPY .nvmrc /app/

RUN cd /app \
    && export NODE_VERSION="$(cat .nvmrc)" \
    && wget "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz" \
    && wget "https://nodejs.org/dist/v$NODE_VERSION/SHASUMS256.txt.asc" \
    && gpg --batch --verify SHASUMS256.txt.asc \
    && grep " node-v$NODE_VERSION-linux-x64.tar.gz\$" SHASUMS256.txt.asc | sha256sum -c - \
    && tar -xzf "node-v$NODE_VERSION-linux-x64.tar.gz" -C /usr/local --strip-components=1 \
    && rm -f "node-v$NODE_VERSION-linux-x64.tar.gz" SHASUMS256.txt.asc

# Install yarn
RUN npm install -g yarn

# Install Poetry
RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | POETRY_HOME=/opt/poetry python && \
    cd /usr/local/bin && \
    ln -s /opt/poetry/bin/poetry && \
    poetry config virtualenvs.create false

COPY pyproject.toml poetry.lock /app/

RUN poetry install

COPY . /app/
