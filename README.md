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
venv\\\\Scripts\\\\activate  # Windows

# Установить зависимости
pip install -r app/requirements.txt

# Настроить переменные окружения
export DB\\\_HOST=localhost
export DB\\\_PORT=5432
export DB\\\_NAME=testdb
export DB\\\_USER=postgres
export DB\\\_PASSWORD=secret

# Запустить приложение
python app/app.py

'''



## 🐳 Запуск через Docker



\### Требования



\- Docker

\- Docker Compose



\### Установка и запуск



Скопируйте файл с примером переменных окружения:



```bash

cp .env.example .env

```



При необходимости отредактируйте `.env`:



```bash

nano .env

```



Запустите приложение:



```bash

docker compose up -d --build

```



Проверьте состояние контейнеров:



```bash

docker compose ps

```



Проверьте работоспособность приложения:



```bash

curl http://localhost/health

```



> \*\*Важно:\*\* при запуске через Docker в `.env` должно быть указано `DB\_HOST=db`, где `db` — имя сервиса PostgreSQL из `docker-compose.yml`. Не используйте `localhost`.



\---



\## 💾 Проверка сохранности данных



Получите текущее количество записей:



```bash

curl http://localhost/data

```



Остановите контейнеры:



```bash

docker compose down

```



Запустите их снова:



```bash

docker compose up -d

```



Снова проверьте данные:



```bash

curl http://localhost/data

```



Счётчик `total\_records` продолжает расти после перезапуска, так как данные PostgreSQL хранятся в Docker volume `pgdata`.



\---



\## 🛑 Остановка



```bash

docker compose down

```



> \*\*Важно:\*\* не используйте `docker compose down -v`, если хотите сохранить данные. Флаг `-v` удаляет Docker volumes вместе с их содержимым.





