import 'package:flutter/material.dart';
import 'package:login_bloc/src/blocs/bloc.dart';

class Provider extends InheritedWidget {
  final bloc = Bloc();

  Provider({super.key, required super.child});

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static Bloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<Provider>())!.bloc;
  }
}
