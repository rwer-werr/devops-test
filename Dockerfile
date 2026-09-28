FROM python:3.11-slim AS builder
WORKDIR /build
COPY app/requirements.txt .
RUN pip install --no-cache-dir --prefix=/install -r requirements.txt

FROM python:3.11-slim
RUN useradd --create-home --uid 1000 appuser
WORKDIR /app
COPY --from=builder /install /usr/local
COPY app/ .
USER appuser
EXPOSE 5000
CMD ["python", "app.py"]