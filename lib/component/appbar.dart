import 'dart:ui';
import 'package:flutter/material.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Widget content;

  const MyAppBar({super.key, required this.content});
  @override
  State<MyAppBar> createState() => _MyAppBarState();
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _MyAppBarState extends State<MyAppBar> {
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
    Widget appBarContent = widget.content;

    GestureDetector(
      onTap: () {},
      child: Container(
        color: _scrolledUnder
            ? Theme.of(context).colorScheme.background.withOpacity(0.1)
            : Theme.of(context).colorScheme.background,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Daarul Ukhuwwah Putra 1",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.arrow_drop_down_rounded,
                  size: 30,
                )
              ],
            )
          ],
        ),
      ),
    );
    if (_scrolledUnder)
      appBarContent = ClipRRect(
        child: BackdropFilter(
          child: Container(
            color: Theme.of(context).colorScheme.background.withOpacity(0.4),
            child: appBarContent,
          ),
          filter: ImageFilter.blur(
            sigmaY: 10,
            sigmaX: 10,
          ),
        ),
      );
    return appBarContent;
  }
}
