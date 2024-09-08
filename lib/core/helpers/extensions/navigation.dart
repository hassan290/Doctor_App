import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {

  Future<dynamic> pushNamed(String routeName, {Object? arguments}) => Navigator.of(this).pushNamed(routeName, arguments: arguments);

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) => Navigator.of(this).pushReplacementNamed(routeName, arguments: arguments);

  Future<dynamic> pushAndRemoveUntil(String routeName, {Object? arguments, required RoutePredicate predicate}) => Navigator.of(this).pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);

  void pop() => Navigator.of(this).pop();
}