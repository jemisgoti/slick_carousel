import 'dart:async';

import 'package:flutter/animation.dart';
import 'package:slick_carousel/features/slick/controllers/controller_state.dart';

///This controller will extend SlicView controlls to your app
class SlickController {
  ///staream controller for slick viee
  StreamController<SlickState> streamController =
      StreamController<SlickState>.broadcast();
///return stream of [SlickState]
  Stream<SlickState> get stream => streamController.stream;
  ///it will dispose the controller
  void dispose() {
    streamController.close();
  }

  ///Animates the controlled [SlickView] from the current page to the next page.
  ///
  /// The animation lasts for the given duration and follows the given curve.
  /// The returned [Future] resolves when the animation completes.
  ///
  /// The `duration` and `curve` arguments must not be null.
  Future<void> next({
    Duration? duration,
    Curve? curve,
  }) async {
    streamController.sink.add(SlickNext(duration: duration, curve: curve));
  }

  ///Animates the controlled [SlickView] from the current page
  /// to the previous page.
  ///
  /// The animation lasts for the given duration and follows the given curve.
  /// The returned [Future] resolves when the animation completes.
  ///
  /// The `duration` and `curve` arguments must not be null.
  Future<void> previous({
    Duration? duration,
    Curve? curve,
  }) async {
    streamController.sink.add(SlickPrevious(duration: duration, curve: curve));
  }
}
