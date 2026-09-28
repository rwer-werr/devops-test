# DevOps Test Project

Простое веб-приложение на Flask с подключением к PostgreSQL для тестирования DevOps навыков.

## 📋 Описание

Приложение предоставляет следующие endpoints:

* `GET /` - Главная страница (статус приложения)
* `GET /health` - Health check (проверка подключения к БД)
* `GET /data` - Тестовый endpoint для работы с БД

## 🚀 Локальный запуск (без Docker)

### Требования:

* Python 3.8+
* PostgreSQL 13+

### Установка:

```bash
# Создать виртуальное окружение
python -m venv venv
source venv/bin/activate  # Linux/Mac
# или
venv\\Scripts\\activate  # Windows

# Установить зависимости
pip install -r app/requirements.txt

# Настроить переменные окружения
export DB\_HOST=localhost
export DB\_PORT=5432
export DB\_NAME=testdb
export DB\_USER=postgres
export DB\_PASSWORD=secret

# Запустить приложение
python app/app.py

'''



\## 🐳 Запуск через Docker



\### Требования:

\- Docker

\- Docker Compose



\### Установка и запуск:



cp .env.example .env

nano .env

docker compose up -d --build

docker compose ps

curl http://localhost/health

В `.env должно быть DB\_HOST=db (имя сервиса из docker-compose.yml), а не localhost.



\### Проверка сохранности данных:



``bash

curl http://localhost/data

docker compose down

docker compose up -d

curl http://localhost/data



Счётчик `total\_records` продолжает расти после перезапуска, так как данные PostgreSQL хранятся в volume `pgdata`.



\### Остановка:



bash

docker compose down

`



Не используйте `docker compose down -v`: флаг `-v` удаляет volume вместе с данными.

