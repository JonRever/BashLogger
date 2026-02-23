# BashLoger

Простой Bash-логгер для скриптов с поддержкой уровней логирования (`DEBUG`, `INFO`, `WARNING`, `ERROR`) и записью в файл.

Основная документация на английском: `README.md`.

## Возможности

- Единая функция `Log()` для сообщений разных уровней.
- Фильтрация по минимальному уровню логирования через `LogLevel`.
- Формат записи с таймстампом и меткой сервиса.
- Опциональный вывод в консоль через `--print`.

## Требования

- Bash 4+
- Linux/macOS (или совместимая среда Bash)

## Быстрый старт

Подключите скрипт в вашем проекте:

```bash
source "./BashLoger.sh" "/var/log/myapp/app.log" "[MY_APP]" "INFO"
```

После этого можно вызывать:

```bash
Log -i --print "Application started"
Log -w "Low disk space"
Log -e --print "Cannot connect to database"
Log -d "Detailed debug message"
```

## Параметры при подключении

Скрипт ожидает три аргумента:

1. `logpath` - путь до файла лога.
2. `mark` - префикс (метка) для лог-записей.
3. `LogLevel` - минимальный уровень логирования (`DEBUG`, `INFO`, `WARNING`, `ERROR`).

Пример:

```bash
source "./BashLoger.sh" "/tmp/example.log" "[EXAMPLE]" "DEBUG"
```

## Формат логов

Пример строки:

```text
23.02.2026 14:30 [MY_APP] INFO: Application started
```

## Уровни логирования

- `DEBUG` - пишет все (`DEBUG`, `INFO`, `WARNING`, `ERROR`)
- `INFO` - пишет `INFO`, `WARNING`, `ERROR`
- `WARNING` - пишет `WARNING`, `ERROR`
- `ERROR` - пишет только `ERROR`

## Структура репозитория

- `BashLoger.sh` - основной скрипт логгера
- `VERSION` - текущая версия проекта
- `CHANGELOG.md` - история изменений
- `CONTRIBUTING.md` - рекомендации для контрибьюторов
- `LICENSE` - лицензия проекта

## Лицензия

Проект распространяется под лицензией MIT. См. файл `LICENSE`.
