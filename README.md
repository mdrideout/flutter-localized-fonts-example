# Localized Fonts Example
A sample Flutter project to demonstrate dynamic font swapping based on locale with different fonts (including on web).

**Features that now work in Flutter by default _(at least as of v2.2.2)_**

- Flutter canvaskit web will re-render text using system fonts if the current language is not compatible with the MaterialApp font. (previously, Flutter Web canvaskit could not use system fonts).
- Two packaged fonts have been included for testing. 

# Tests with Flutter Web
- Flutter: 2.2.2
- easy_localization: ^2.3.3+1 / ^ 3.0.0
- flutter run --no-sound-null-safety
- flutter run

The latest version of Flutter is capable of using system fonts to re-render foreign characters on
Flutter Web in the Web Browsers. This has been tested with and without sound null safety, with
easy_localization 2.3.3+1 (pre null-safety) and 3.0.0 (null-safety implemented).