import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:scrollview_observer/scrollview_observer.dart';
import 'package:slick_carousel/features/slick/controllers/controller_state.dart';
import 'package:slick_carousel/features/slick/controllers/slick_controller.dart';
import 'package:slick_carousel/features/slick/presentation/widgets/action_button.dart';

///Prvoide dynamic slick functionality to your app
class SlickView extends StatefulWidget {
  /// initialize the slickview
  const SlickView(
      {required this.slickController,
      required this.itemBuilder,
      required this.itemCount,
      this.nextWidget,
      this.previousWidget,
      this.showPrevious = true,
      this.showNext = true,
      this.infiniteScroll = false,
      this.fixedWidth = false,
      this.itemWidth,
      this.duration = const Duration(milliseconds: 300),
      this.curve = Curves.linear,
      this.initialPage = 0,
      this.itemSpace = 16,
      this.actionWidgetWith = 45,
      this.actionSpace = 16,
      this.viewportFraction = 1,
      this.keepPage = true,
      super.key});

  ///initialize the view with builder
  const SlickView.builder(
      {required this.slickController,
      required this.itemBuilder,
      required this.itemCount,
      this.nextWidget,
      this.previousWidget,
      this.showPrevious = true,
      this.showNext = true,
      this.infiniteScroll = false,
      this.fixedWidth = false,
      this.itemWidth,
      this.duration = const Duration(milliseconds: 300),
      this.curve = Curves.linear,
      this.initialPage = 0,
      this.itemSpace = 16,
      this.actionWidgetWith = 45,
      this.actionSpace = 16,
      this.viewportFraction = 1,
      this.keepPage = true,
      super.key})
      : assert(fixedWidth == true && itemWidth == null);

  /// The page to show when first creating the [PageView].
  final int initialPage;

  /// Save the current [page] with [PageStorage] and restore it if
  /// this controller's scrollable is recreated.
  ///
  /// If this property is set to false, the current [page] is never saved
  /// and [initialPage] is always used to initialize the scroll offset.
  /// If true (the default), the initial page is used the first time the
  /// controller's scrollable is created, since there's isn't a page to
  /// restore yet. Subsequently the saved page is restored and
  /// [initialPage] is ignored.
  ///
  /// See also:
  ///
  ///  * [PageStorageKey], which should be used when more than one
  ///    scrollable appears in the same route, to distinguish the [PageStorage]
  ///    locations used to save scroll offsets.
  final bool keepPage;

  /// {@template flutter.widgets.pageview.viewportFraction}
  /// The fraction of the viewport that each page should occupy.
  ///
  /// Defaults to 1.0, which means each page fills the viewport in the scrolling
  /// direction.
  /// {@endtemplate}
  final double viewportFraction;

  ///SlickController for the view
  final SlickController slickController;

  ///Item builder for the [SlickView]
  final IndexedWidgetBuilder itemBuilder;

  /// Providing a non-null [itemCount] lets the [PageView] compute the maximum
  /// scroll extent.
  ///
  /// [itemBuilder] will be called only with indices greater than or equal to
  /// zero and less than [itemCount].
  final int itemCount;

  /// The `duration` and `curve` arguments must not be null.
  final Duration duration;

  ///[Curve] for the slide animationj
  final Curve curve;

  ///[Widget] for the next button
  final Widget? nextWidget;

  ///[Widget] for the previous button
  final Widget? previousWidget;

  /// controll visibility for the previous button
  final bool showPrevious;

  /// controll visibility for the next button
  final bool showNext;

  ///width of the action button
  final double actionWidgetWith;

  /// space between main view and action widget like next and previous button
  final double actionSpace;

  /// space between two item
  final double itemSpace;

  /// width of the item if each item have fix width
  final double? itemWidth;

  /// Provide true if your carousal has infinite scroll
  final bool infiniteScroll;

  /// Provide true if your carousal item has fixed width for each element
  final bool fixedWidth;
  @override
  State<SlickView> createState() => _SlickViewState();
}

class _SlickViewState extends State<SlickView> {
  final ItemScrollController itemScrollController = ItemScrollController();
  final ScrollController scrollController = ScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
  late ListObserverController observerController;

  final PageController pageController = PageController();

  @override
  void initState() {
    observerController = ListObserverController(controller: scrollController);

    _listenState();

    super.initState();
  }

  int page = 0;
  @override
  Widget build(BuildContext context) => Row(
        children: <Widget>[
          !widget.showPrevious
              ? const SizedBox.shrink()
              : SizedBox(
                  width: widget.actionWidgetWith,
                  child: IconButton(
                      splashRadius: 1,
                      onPressed: () {
                        widget.slickController.previous();
                      },
                      icon: widget.previousWidget ??
                          const ActionWidget(icon: Icons.arrow_back_ios))),
          !widget.showPrevious
              ? const SizedBox.shrink()
              : SizedBox(
                  width: widget.actionSpace,
                ),
          Expanded(
            child: Builder(builder: (BuildContext context) {
              if (widget.infiniteScroll) {
                return ListWheelScrollView.useDelegate(
                  itemExtent: 100,

                  onSelectedItemChanged: (int value) {
                    log(value.toString());
                  },
                  physics: const FixedExtentScrollPhysics(),
                  childDelegate: ListWheelChildLoopingListDelegate(
                    children: List<Widget>.generate(
                      widget.itemCount,
                      (int index) => widget.itemBuilder(context, index),
                    ),
                  ),

                  // diameterRatio: 1.6,
                  // offAxisFraction: -0.4,
                  // squeeze: 0.8,

                  // DEPRECATED : clipToSize does not exist anymore.
                  // USe clipBehaviour instead.

                  // clipToSize: true,
                );
              } else if (widget.fixedWidth) {
                return PageView.builder(
                  controller: pageController,
                  itemCount: widget.itemCount,
                  itemBuilder: (BuildContext context, int index) =>
                      widget.itemBuilder(context, index),
                );
              } else {
                return NotificationListener<ScrollNotification>(
                  onNotification: (ScrollNotification notification) {
                    if (notification is ScrollEndNotification) {}
                    return true;
                  },
                  child: ListViewObserver(
                    controller: observerController,
                    onObserve: (ListViewObserveModel p0) {
                      log(p0.displayingChildIndexList.toString());
                    },
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      controller: scrollController,
                      itemCount: widget.itemCount,
                      itemBuilder: (BuildContext context, int index) =>
                          widget.itemBuilder(context, index),
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(
                        width: widget.itemSpace,
                      ),
                    ),
                  ),
                );
              }
            }),
          ),
          !widget.showNext
              ? const SizedBox.shrink()
              : SizedBox(
                  width: widget.actionSpace,
                ),
          !widget.showNext
              ? const SizedBox.shrink()
              : SizedBox(
                  width: widget.actionWidgetWith,
                  child: IconButton(
                      splashRadius: 1,
                      onPressed: () {
                        widget.slickController.next();
                      },
                      icon: widget.nextWidget ??
                          const ActionWidget(icon: Icons.arrow_forward_ios)))
        ],
      );

  void _listenState() {
    widget.slickController.stream.listen((SlickState event) {
      if (event is SlickNext) {
        page++;
        _animateTo(
            index: page,
            duration: event.duration ?? widget.duration,
            curve: event.curve ?? widget.curve);
      } else if (event is SlickPrevious) {
        if (page > 0) {
          page--;
          _animateTo(
              index: page,
              duration: event.duration ?? widget.duration,
              curve: event.curve ?? widget.curve);
        }
      }
    });
  }

  void _animateTo(
      {required int index, required Duration duration, required Curve curve}) {
    observerController.animateTo(index: page, duration: duration, curve: curve);
  }
}
