# Technical Test (Mobile Engineer) - BUMA

# 🛠 Technical Resources

- Clean Architecture
- Modularization Approach with mono-repo
- Mono-repo management with `Melos CLI`
- Dependency Injection in multiple modules with `GetIt` and `Injectable`
- Design System for UI
- Navigation system with `Auto Route`

# 🍴 Requirements

- Flutter SDK Version: `>= 3.16.9`
- Dart SDK Version: `>= 3.2.6`

# 📦 Getting started

### Setup Melos

To set up Melos, run the following command to install [`Melos`][melos_link] as a global package, or skip this step if already installed.

```base
dart pub global activate melos
```

Once [`Melos`][melos_link] is activated, run the following command to bootstrap it:

```base
melos bootstrap
```

This command will download and install all the required dependencies for [`Melos`][melos_link].

### Run the App

To run the app, navigate to the app directory `buma_hris`.

```base
cd apps/buma_hris/
```

This app uses flavors to run different environments. The flavor `production` is for production environment, you can also use flavor `development` for development environment and flavor `staging` for staging environment.

To run the app, use the following command:

**Production**

```base
flutter run --flavor production -t lib/main_prod.dart
```

**Development**

```base
flutter run --flavor development -t lib/main_dev.dart
```

**Staging**

```base
flutter run --flavor staging -t lib/main_staging.dart
```

[melos_link]: https://github.com/invertase/melos
