import 'package:flutter/material.dart';

class RouteAnimation {
  static Route fadeRoute(Widget widget) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => widget,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }

  // static Route scaleRoute(Widget widget) {
  //   return AnimatedSwitcher(duration: duration);
  // }

  // static Route scaleRoute(Widget widget) {
  //   return PageRouteBuilder(
  //     pageBuilder: (context, animation, secondaryAnimation) => widget,
  //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
  //       return AnimatedSwitcher(
  //         duration: const Duration(milliseconds: 500),
  //         transitionBuilder: (Widget child, Animation<double> animation) {
  //             return ScaleTransition(scale: animation, child: child);
  //           },
  //       );
  //     },
  //   );
  // }
}
