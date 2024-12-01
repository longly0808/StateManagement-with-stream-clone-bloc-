import 'package:flutter/material.dart';
import 'package:state_management_with_stream/core/bloc.dart';


class ToggleThemeEvent extends BaseEvent {
  bool isLight;

  ToggleThemeEvent({required this.isLight});
}

class ThemeState extends BaseState{
  final ThemeData themeData;

  ThemeState(this.themeData);
}


class MainBloc extends BaseBloc{
  @override
  Future<void> mapEvent(event) {
    if(event is ToggleThemeEvent){
      emit(ThemeState(event.isLight ? ThemeData.light(): ThemeData.dark()));
    }
    return super.mapEvent(event);
  }
}