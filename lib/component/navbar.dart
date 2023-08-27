import 'dart:ui';
import 'package:flutter/material.dart';

class MyNavBar extends StatefulWidget implements PreferredSizeWidget {
  final Widget content;

  const MyNavBar({super.key, required this.content});
  @override
  State<MyNavBar> createState() => _MyNavBarState();
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _MyNavBarState extends State<MyNavBar> {
  ScrollNotificationObserverState? _scrollNotificationObserver;
  bool _scrolledUnder = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _scrollNotificationObserver?.removeListener(_handleScrollNotification);
    _scrollNotificationObserver = ScrollNotificationObserver.maybeOf(context);
    _scrollNotificationObserver?.addListener(_handleScrollNotification);
  }

  @override
  void dispose() {
    if (_scrollNotificationObserver != null) {
      _scrollNotificationObserver!.removeListener(_handleScrollNotification);
      _scrollNotificationObserver = null;
    }
    super.dispose();
  }

  void _handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollUpdateNotification) {
      final bool oldScrolledUnder = _scrolledUnder;
      final ScrollMetrics metrics = notification.metrics;
      switch (metrics.axisDirection) {
        case AxisDirection.up:
          _scrolledUnder = metrics.extentAfter > 0;
        case AxisDirection.down:
          _scrolledUnder = metrics.extentBefore > 0;
        case AxisDirection.right:
        case AxisDirection.left:
          break;
      }

      if (_scrolledUnder != oldScrolledUnder) {
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget navBarContent = widget.content;

    navBarContent = ClipRRect(
      child: BackdropFilter(
        child: Container(
          color: Theme.of(context).colorScheme.background.withOpacity(0.65),
          child: navBarContent,
        ),
        filter: ImageFilter.blur(
          sigmaY: 10,
          sigmaX: 10,
        ),
      ),
    );
    return navBarContent;
  }
}
