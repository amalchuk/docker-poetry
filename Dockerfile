ARG PYTHON_VERSION
ARG POETRY_VERSION

FROM python:${PYTHON_VERSION}-buster
COPY ["docker-poetry.sh", "/usr/local/bin/"]

RUN ["docker-poetry.sh"]
CMD ["poetry"]
