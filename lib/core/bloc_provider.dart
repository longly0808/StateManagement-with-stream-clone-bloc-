import 'package:flutter/material.dart';

class BlocProvider<T> extends InheritedWidget {
  final T bloc;

  const BlocProvider({super.key, required this.bloc, required super.child});

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static T of<T>(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<BlocProvider<T>>();
    if (provider == null) {
      throw FlutterError('BlocProvider.of() called with a context that does not contain a Bloc of type $T.');
    }
    return provider.bloc;
  }
}