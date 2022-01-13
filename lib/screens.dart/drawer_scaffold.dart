import 'package:flutter/material.dart';

class DrawerScaffold extends StatefulWidget {
  Widget child;
  Widget drawer;
  double width;

  DrawerScaffold({Key key, this.child, this.drawer, this.width = 300})
      : super(key: key);

  @override
  DrawerScaffoldState createState() => DrawerScaffoldState();
}

class DrawerScaffoldState extends State<DrawerScaffold>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
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
        animation: _controller,
        builder: (context, animation) {
          return Stack(
            children: [
              Positioned(
                  left: _controller.value * widget.width,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: widget.child),
              Positioned(
                left: -widget.width * (1 - _controller.value),
                width: widget.width,
                height: MediaQuery.of(context).size.height,
                child: widget.drawer,
              ),
            ],
          );
        });
  }

  void openCloseDrawer() {
    _controller.isCompleted ? _controller.reverse() : _controller.forward();
  }
}
