import 'package:flutter/material.dart';

class CustomFadingLoadingWidgetList extends StatefulWidget {
  const CustomFadingLoadingWidgetList({
    super.key,
    required this.scrollDirc,
    required this.widget,
    this.isNeverScroll = false,
  });

  final Axis scrollDirc;
  final Widget widget;
  final bool isNeverScroll;

  @override
  State<CustomFadingLoadingWidgetList> createState() =>
      _CustomFadingLoadingWidgetListState();
}

class _CustomFadingLoadingWidgetListState
    extends State<CustomFadingLoadingWidgetList>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> opacity;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    opacity = Tween(begin: .4, end: 1.0).animate(_controller);
    _controller
      ..forward()
      ..repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (context, child) {
        return Opacity(
          opacity: opacity.value,
          child: ListView.builder(
            itemCount: 2,
            shrinkWrap: true,
            scrollDirection: widget.scrollDirc,
            physics: widget.isNeverScroll
                ? const NeverScrollableScrollPhysics()
                : const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: widget.widget,
              );
            },
          ),
        );
      },
      animation: _controller,
    );
  }
}
