# =========================
# Builder Stage
# =========================
FROM python:3.5.2-slim AS builder

WORKDIR /app

# Auf Archiv-Mirror umleiten (Debian Jessie ist EOL)
RUN echo "deb http://archive.debian.org/debian/ jessie main" > /etc/apt/sources.list && \
    echo "deb http://archive.debian.org/debian-security jessie/updates main" >> /etc/apt/sources.list && \
    echo 'Acquire::Check-Valid-Until "false";' > /etc/apt/apt.conf.d/99no-check-valid

# System dependencies (nur Build)
RUN apt-get update && apt-get install -y --force-yes \
    build-essential \
    libpq-dev \
 && rm -rf /var/lib/apt/lists/*

# Python dependencies
COPY requirements.txt .
RUN pip install --upgrade pip==20.3.4 \
 && pip install --no-cache-dir -r requirements.txt


# =========================
# Runtime Stage
# =========================
FROM python:3.5.2-slim

WORKDIR /app

# Auf Archiv-Mirror umleiten (Debian Jessie ist EOL)
RUN echo "deb http://archive.debian.org/debian/ jessie main" > /etc/apt/sources.list && \
    echo "deb http://archive.debian.org/debian-security jessie/updates main" >> /etc/apt/sources.list && \
    echo 'Acquire::Check-Valid-Until "false";' > /etc/apt/apt.conf.d/99no-check-valid

# System dependencies (wie vorher im final image)
RUN apt-get update && apt-get install -y --force-yes \
    build-essential \
    libpq-dev \
 && rm -rf /var/lib/apt/lists/*

# Python dependencies aus Builder übernehmen
COPY --from=builder /usr/local /usr/local

# App code + EntryPoint
COPY . .
RUN chmod +x entrypoint.sh

# Non-root user
RUN useradd --no-create-home appuser \
 && chown -R appuser /app
USER appuser

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

ENTRYPOINT ["./entrypoint.sh"]
CMD ["gunicorn", "conduit.wsgi:application", "--bind", "0.0.0.0:8000", "--workers", "3"]
