# solyric_app

Social music applicacion.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## Generating the code to local database with Moor(SQLite)

Moor integrates with Dart’s build system, so you can generate all the code needed with 

```flutter packages pub run build_runner build```

If you want to continuously rebuild the generated code where you change your code, run

```flutter packages pub run build_runner watch``` 

instead. After running either command once, the moor generator will have created a class for your database and data classes for your entities.

Reference: https://moor.simonbinder.eu/docs/getting-started/#generating-the-code