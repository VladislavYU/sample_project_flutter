# sample_project

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

Для запуска проекта вам необходимо настроить файл окружения `.env` (пример `.env.example`)

Для корректной работы еще следует создать проект `firebase` и подключить его

Для скачивания схемы graphql нужно использовать download_schema.sh в аргументы принимает токен пользователя.

Для генирации методов запросов graphql используется appolo клиент, вызывается командой flutter pub run build_runner build --delete-conflicting-outputs

Для генерации моделуей проекта использовать get_cli. Подробнее в GET_CLI.md
