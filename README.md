# MkAbSport

Application Flutter pour la promotion du sport.

## Objectif

MkAbSport vise à promouvoir diverses disciplines sportives et à informer les utilisateurs sur les événements sportifs à venir.

## Plateformes supportées

- Android
- iOS
- Web

## Fonctionnalités

- **Découverte de disciplines** : Explorez différents sports tels que le Football, le Basketball, le Tennis, la Natation, l'Athlétisme et le Cyclisme.
- **Événements** : Restez informé des tournois et galas sportifs locaux.
- **Interface Moderne** : Design épuré utilisant Material 3.

## Déploiement

Le projet utilise GitHub Actions pour l'intégration et le déploiement continus (CI/CD). À chaque push sur la branche `main`, les tests sont exécutés et les versions Web et Android sont automatiquement générées.

L'application web est déployée sur Netlify.

## Installation et Lancement

### Prérequis

- [Flutter SDK](https://docs.flutter.dev/get-started/install)

### Exécution

Pour lancer l'application en mode debug :

```bash
flutter run
```

Pour lancer sur le web spécifiquement :

```bash
flutter run -d chrome
```

## Tests

Pour exécuter les tests unitaires et de widgets :

```bash
flutter test
```
