# vbeauty_web — Agent guidance

## Project

Flutter web app for **Velmique Beauty**, a beauty products marketplace marketing site.

- Dart 3.11+, Flutter 3.41+
- Web only (no `android/` or `ios/`)
- `lib/main.dart` → `VelmiqueBeautyApp` → `MaterialApp.router`

## Dependencies

| Package | Usage |
|---|---|
| `go_router` | Routing (5 routes: `/`, `/download`, `/contact`, `/privacy-policy`, `/terms-of-use`) |
| `google_fonts` | Playfair Display (headings) + Inter (body) |
| `responsive_framework` | Breakpoints via `ResponsiveBreakpoints.builder` |
| `flutter_animate` | Entrance animations, section fades |
| `url_launcher` | Email, phone, Google Play links |
| `visibility_detector` | Scroll-triggered animation triggers |

## Commands

| Action | Command |
|---|---|
| Dev server | `flutter run -d chrome` |
| All tests | `flutter test` |
| Single test | `flutter test test/widget_test.dart` |
| Static analysis | `flutter analyze` |
| Format | `dart format .` |
| Build prod | `flutter build web` |
| Check deps | `flutter pub outdated` |
| Upgrade | `flutter pub upgrade` |

Always `flutter pub get` after `pubspec.yaml` changes.

## Architecture

- **Entrypoint:** `lib/main.dart` → `VelmiqueBeautyApp`
- **App shell:** `lib/app/app.dart` + `lib/app/router.dart`
- **Theme:** `lib/core/theme/app_theme.dart` (brand colors `#570177` / `#B01EE5`)
- **Constants:** `app_colors.dart`, `app_strings.dart`, `app_links.dart`
- **Screens:** `screens/home/download/contact/privacy/terms/`
- **Widgets:** `navigation/app_header.dart` (sticky scroll-hide/show), `footer/app_footer.dart`, `sections/` (hero, trust, how-it-works, buyer/seller benefits, download-cta), `common/` (PrimaryButton, SectionTitle, AppContainer, ScreenshotCard)
- **Routing:** 5 `GoRoute` entries in `router.dart`

## Web / SEO

- Meta description, OG tags, Twitter Cards, JSON-LD structured data in `web/index.html`
- `web/manifest.json` — brand colors `#570177`
- `web/robots.txt` + `web/sitemap.xml` present

## Layout

- All screens use `Column` + `Expanded` layout: `Column(children: [AppHeader, Expanded(child: scrollableContent)])`
- AppHeader is a sticky nav that hides on scroll-down, reappears on scroll-up via `ClipRect` + `AnimatedAlign(heightFactor:)`

## Testing quirks

- `visibility_detector` creates a pending 500ms timer during paint → `pumpAndSettle` never settles
- Use explicit `pump(Duration(seconds: 3))` to flush animation timers before assertions
- Network images (Unsplash) will return 400 in test environment — test only for widget presence, not image content

## Style conventions

- No comments in production code
- No emoji in code or commits
- Static const strings in `app_strings.dart`, not inline
- PrimaryButton has three variants: `filled`, `outlined`, `white`
- Max content width: 1000px via `AppContainer` widget
- Breakpoints: 0–449 MOBILE, 450–1199 TABLET, 1200+ DESKTOP

## Assets

- **Do NOT use `assets/` prefix in paths** — Flutter 3.41+ web engine auto-prepends `assets/` to asset URLs, causing double-prefix (`assets/assets/...`)
- Local assets stored under `static/` directory (bypassed the `assets/` name):
  - `static/icons/logo.png`
  - `static/images/screenshots/` (promo1, screen_1..4)
- Registered in `pubspec.yaml` as `static/icons/` and `static/images/screenshots/`
- Referenced in code without `assets/` prefix, e.g. `Image.asset('static/icons/logo.png')`
- Unsplash/Pexels URLs still used as placeholder images in buyer/seller benefit sections

## Deployment (GitHub Pages)

- Workflow: `.github/workflows/deploy.yml` — triggers on push to `main`
- Build: `flutter build web --release --base-href "/vbeauty_web/" --web-renderer html`
- SPA routing: `web/404.html` redirects unknown paths → root via `sessionStorage`, `lib/main.dart` restores the route on startup
- `lib/main.dart` uses `dart:html` (web-only) to read `sessionStorage['redirect']`

## Notes

- `.dart_tool/` and `build/` are gitignored
- Package manager is `pub` (lockfile: `pubspec.lock`)
