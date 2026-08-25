# Transition Journal

Private, offline-first hormone replacement therapy diary for transgender and gender-diverse people. Built with Flutter for iOS first, with Android-ready platform abstractions.

## Product principles

- Affirming, calm, non-assumptive language
- Local-only by default — **no accounts, cloud sync, analytics, ads, or remote logging**
- Does **not** provide medical advice, dose guidance, clinical interpretation, or emergency help
- Discreet local notification copy by default

## Tech stack

| Layer | Choice |
| --- | --- |
| Framework | Flutter 3.47 + Dart 3.13 |
| Architecture | Feature-first + repository |
| DI / state | `flutter_riverpod` |
| Navigation | `go_router` |
| Database | Drift + SQLite |
| Secrets | `flutter_secure_storage` (Keychain / Keystore) |
| App lock | `local_auth` |
| Reminders | `flutter_local_notifications` + `timezone` + `flutter_timezone` |
| Photos | `image_picker` (system picker / camera) |
| Export | JSON / CSV via `share_plus` |
| UI | Custom `ThemeExtension` + Fraunces / Source Sans 3 |

**Avoided:** Firebase, Auth SDKs, push backends, Hive/Isar as primary store, facial recognition / photo analysis.

Platform interfaces for later Android work: `NotificationScheduler`, `BiometricGate`, `ProtectedFileStore`.

## Features

1. Hormone regimen tracking (multi-regimen, inclusive categories, archive)
2. Dose logging (taken / skipped / missed)
3. Local medication reminders (daily, weekdays, month days, interval days)
4. Photo transition diary with optional journey-day labels
5. Daily feelings diary (one entry per date)
6. Blood-test / medical record log with optional attachments
7. Privacy controls: optional app lock, export, confirmed deletion

## Project layout

```text
lib/
  app/           # bootstrap, router, providers
  core/          # theme, shared widgets, scheduling helpers
  domain/        # enums + models
  data/          # Drift DB, repositories, services
  features/      # onboarding, home, regimens, journal, records, settings, lock
```

## Setup

```bash
# Flutter stable 3.47+
flutter pub get
dart run build_runner build
flutter run -d <ios-device-or-simulator>   # macOS + Xcode required for iOS
```

### iOS notes

- Usage strings are in `ios/Runner/Info.plist` (camera, photos, Face ID)
- Reminders use `UNUserNotificationCenter` via `flutter_local_notifications` (not Apple Reminders / EventKit)
- Permission for notifications is requested only when enabling a reminder
- Full `flutter build ios` / Xcode archive must be run on macOS

### Android (phase 2 ready)

- Android project is generated with permissions stubs
- Same repositories/services power the UI; wire platform implementations as needed

## Privacy decisions

- SQLite + sandboxed media files only
- App-lock preference stored in secure storage (Keychain on iOS)
- iOS media files get `NSFileProtectionCompleteUntilFirstUserAuthentication` via MethodChannel `com.transitionjournal/file_protection`
- Default notification: “It’s time for your reminder.”
- Detailed notifications are opt-in with a lock-screen sensitivity warning
- Deleting a photo/attachment record deletes the local file
- Never print private health data to logs

## Tests & quality

```bash
dart format .
flutter analyze
flutter test
```

## Known limitations

- Local notification delivery is **best-effort**; schedules are refreshed on app resume and reminder changes
- Biometrics depend on device support
- This Cloud Agent Linux environment cannot run Xcode; verify iOS builds on a Mac
- `google_fonts` may fetch fonts on first launch if not cached (no health data leaves the device)

## Medical disclaimer

Laboratory reference ranges vary. Results should be discussed with a qualified clinician. Transition Journal never labels results normal/abnormal and never suggests treatment changes.
