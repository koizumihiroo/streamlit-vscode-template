FROM python:3.8.7-slim as builder

WORKDIR /work/src
RUN pip install --upgrade pip && pip install poetry==1.1.4
COPY pyproject.toml poetry.lock ./
RUN poetry export --without-hashes -f requirements.txt > requirements.txt
RUN poetry export --without-hashes --dev -f requirements.txt > requirements-dev.txt
RUN pip install -r requirements.txt

### for dev. 
FROM python:3.8.7-slim as dev
ENV PYTHONUNBUFFERED=1
WORKDIR /work/src
COPY --from=builder /usr/local/lib/python3.8/site-packages /usr/local/lib/python3.8/site-packages
# need to copy if python package is installed in /usr/local/bin
COPY --from=builder /usr/local/bin/streamlit /usr/local/bin/streamlit
COPY src/ ./
# for dev packages
COPY --from=builder /work/src/requirements-dev.txt requirements-dev.txt
RUN pip install -r requirements-dev.txt
EXPOSE 8501  
CMD ["streamlit", "run", "main.py"]

### for prod
FROM python:3.8.7-slim as prod
ENV PYTHONUNBUFFERED=1
WORKDIR /work/src
COPY --from=builder /usr/local/lib/python3.8/site-packages /usr/local/lib/python3.8/site-packages
# need to copy if python package is installed in /usr/local/bin
COPY --from=builder /usr/local/bin/streamlit /usr/local/bin/streamlit
COPY src/ ./
EXPOSE 8501  
CMD ["streamlit", "run", "main.py"]
