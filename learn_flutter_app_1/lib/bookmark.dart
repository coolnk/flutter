import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Bookmark extends StatefulWidget {
  const Bookmark({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark>
    with SingleTickerProviderStateMixin {
  //controller to control the animation
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  bool bookmarked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: GestureDetector(
      onTap: () {
        if (bookmarked == false) {
          bookmarked = true;
          _animationController.forward();
        } else {
          bookmarked = false;
          _animationController.reverse();
        }
      },
      child: Lottie.network(
          "https://assets3.lottiefiles.com/packages/lf20_puamkgsu.json",
          controller: _animationController),
    )));
  }
}
