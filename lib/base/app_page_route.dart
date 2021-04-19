import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//
// App 打开新页面的 Route
// 定义使用 iOS 侧滑风格
//

class AppPageRoute<T> extends PageRoute<T> with AppPageTransitionMixin<T> {
  AppPageRoute({
    required this.builder,
    RouteSettings? settings,
    this.maintainState = true,
    bool fullscreenDialog = false,
  }) : super(settings: settings, fullscreenDialog: fullscreenDialog) {
    assert(opaque);
  }

  final WidgetBuilder builder;

  @override
  Widget buildContent(BuildContext context) => builder(context);

  @override
  final bool maintainState;

  @override
  String get debugLabel => '${super.debugLabel}(${settings.name})';
}

mixin AppPageTransitionMixin<T> on PageRoute<T> {
  @protected
  Widget buildContent(BuildContext context);

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  @override
  bool canTransitionTo(TransitionRoute<dynamic> nextRoute) {
    return (nextRoute is CupertinoRouteTransitionMixin &&
        !nextRoute.fullscreenDialog);
  }

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    final Widget result = buildContent(context);

    return Semantics(
      scopesRoute: true,
      explicitChildNodes: true,
      child: result,
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return CupertinoPageTransitionsBuilder().buildTransitions<T>(
        this, context, animation, secondaryAnimation, child);
  }
}
