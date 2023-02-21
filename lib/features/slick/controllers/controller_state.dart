import 'package:flutter/material.dart';

///state of the [SlickController]
class SlickState {}

/// emit when user start auto play
class SlickStartAutoPlay {}

///emit when user wan to stop auto play
class SlickStopAutoPlay {}

///emit when user wan to slide to next item
class SlickNext extends SlickState {
  ///initialize the item
  SlickNext({this.duration, this.curve});

  /// The `duration` and `curve` arguments must not be null.
  final Duration? duration;

  ///[Curve] for the slide animationj
  final Curve? curve;
}

///emit when user wan to slide to previous item
class SlickPrevious extends SlickState {
  ///initialize the state
  SlickPrevious({this.duration, this.curve});

  /// The `duration` and `curve` arguments must not be null.
  final Duration? duration;

  ///[Curve] for the slide animationj
  final Curve? curve;
}
