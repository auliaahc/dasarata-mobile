# Dasarata Mobile

> Skipping or ignoring any step in the process can lead to missing files or misconfiguration, which may prevent the project from running properly.

## Requirement

- Flutter SDK 3.24.3 or higher
- Dart SDK 3.x.x (>=3.5.3 <4.0.0)

## Setup

1. Clone the repository and navigate to the project directory

```shell
git clone https://github.com/auliaahc/dasarata-mobile
cd dasarata-mobile
```

2. Install dependencies

```shell
flutter pub get
```

3. Create a `.env` file from `.env.example` and set each variable with its respective API Key or base URL

```shell
cp .env.example .env
```

4. This project uses `envied` package to manage environment variables. Generate the `env.g.dart` file by running:

```shell
dart run build_runner build
```

5. Navigate to directory `\dasarata_mobile\android\app\src\main\res\values` and you will find `api-keys.example.xml` file. Make a copy of this file and rename it to `api-keys.xml`. Then, update the string name to `GoogleMapsKey` and add your Google Maps Key. The updated file should look like this:

```xml
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="GoogleMapsKey">YOUR_GOOGLE_MAPS_KEY</string>
</resources>
```

6. Run the project

```shell
flutter run
```
