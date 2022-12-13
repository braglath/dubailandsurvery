import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum Transition { FadeTransition, SlideTransition }

class AppRoutes {
  static GoRoute page(
          {required String path,
          required String name,
          List<RouteBase>? subRoutes,
          required Widget child,
          required Transition transition}) =>
      GoRoute(
        path: path,
        name: name,
        routes: subRoutes ?? [],
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: child,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              // Change the opacity of the screen using a Curve based on the the animation's
              // value
              return FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              );
            },
          );
        },
      );
}
