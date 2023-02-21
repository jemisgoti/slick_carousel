<img src="https://github.com/jemisgoti/slick_carousel/raw/main/readme_assets/banner.png"/>

#
[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: BSD][license_badge]][license_link]

Fully functional slick slider implimentation for the flutter app

## Roadmap

- SlickView with fix width

- Infinite slickview
## Installation 💻

**❗ In order to start using Slick you must have the [Flutter SDK][flutter_install_link] installed on your machine.**

Add `slick` to your `pubspec.yaml`:

```yaml
dependencies:
  slick:
```

Install it:

```sh
flutter packages get
```

Import package:

```dart
import 'package:slick/slick.dart';
```

## integration
Initialize the controller:

```dart
SlickController slickController = SlickController();
```
 Wrap `Widget` with `RippleAnimation` and assign needed parameter.

```dart
    SizedBox(
              height: 45,
              child: SlickView.builder(
                slickController: slickController,
                itemCount: newsType.length,
                itemBuilder: (context, index) {
                  return Center(
                    child: Container(
                      height: 30,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                          color: index == 0
                              ? Colors.black
                              : Colors.grey.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(6)),
                      child: Center(
                          child: Text(
                        newsType[index],
                        style: TextStyle(
                            color: index == 0 ? Colors.white : Colors.black),
                      )),
                    ),
                  );
                },
              ),
            ),
```
## controll
Slide to previous item:

```dart
slickController.previous();
```
slide to next item:

```dart
slickController.next();
```
# Features

This package support following parameter and methods.

## Parameter
`SlickView`widget provide follwoing parameter to config your slick slider effect.

Parameter defined for `SlickView` widget:

| Name | Type | Description |
|------|------------|-------------|
| slickController | SlickController | Provide controller to controll your slider. |
| itemCount | int | Number of item in the slider. |
| previousWidget | Widget | Widget for the previous button. |
| showPrevious | bool | if provide false then it will hide previous button, Default is true |
| nextWidget | Widget | Widget for the next button. |
| showNext | bool | if provide false then it will hide next button, Default is true |
| itemSpace | double | Space between two item |
| actionSpace | double | Space between main item and action button |
 



# Preview

## Screenshot
TODO: Here is the few screenshot for the preview. This will be remove in new verison becuase pub.dev now support screenshot.
<table>
 <tr>
       <td align="center"> <img src="https://github.com/jemisgoti/slick_carousel/raw/main/readme_assets/desktop.png"   alt=""/><br /><sub><b>Desktop</b></sub> </td>     
         <td align="center"> <img src="https://github.com/jemisgoti/slick_carousel/raw/main/readme_assets/desktop.png"   alt=""/><br /><sub><b>Web</b></sub> </td>  </tr> 
      
</table>

## Main Contributors
<table>
  <tr>
       <td align="center"><a href="https://github.com/jemisgoti"><img src="https://avatars.githubusercontent.com/u/46031164" width="100px;" alt=""/><br /><sub><b>Jemis Goti</b></sub></a></td>
 
</tr>
</table>
<br/>

## Authors

- [@jemisgoti](https://www.github.com/jemisgoti)


## Thanks

Thank you for using this package and keep supporting opensource community.

[flutter_install_link]: https://docs.flutter.dev/get-started/install
[github_actions_link]: https://docs.github.com/en/actions/learn-github-actions
[license_badge]: https://img.shields.io/badge/license-BSD-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[logo_black]: https://raw.githubusercontent.com/VGVentures/very_good_brand/main/styles/README/vgv_logo_black.png#gh-light-mode-only
[logo_white]: https://raw.githubusercontent.com/VGVentures/very_good_brand/main/styles/README/vgv_logo_white.png#gh-dark-mode-only
[mason_link]: https://github.com/felangel/mason
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[very_good_cli_link]: https://pub.dev/packages/very_good_cli
[very_good_coverage_link]: https://github.com/marketplace/actions/very-good-coverage
[very_good_ventures_link]: https://verygood.ventures
[very_good_ventures_link_light]: https://verygood.ventures#gh-light-mode-only
[very_good_ventures_link_dark]: https://verygood.ventures#gh-dark-mode-only
[very_good_workflows_link]: https://github.com/VeryGoodOpenSource/very_good_workflows
