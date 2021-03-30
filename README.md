# sample_project

Sample flutter project SimpleApps

## Getting Started

Для запуска проекта вам необходимо настроить файл окружения `.env` (пример `.env.example`)

Для корректной работы еще следует создать проект `firebase` и подключить его

Для скачивания схемы graphql нужно использовать `download_schema.sh` в аргументы принимает токен пользователя.

Для генирации методов запросов `graphql` используется `appolo` клиент, вызывается командой `flutter pub run build_runner build --delete-conflicting-outputs`

Для генерации моделуей проекта использовать `get_cli`. Подробнее в `GET_CLI.md`
