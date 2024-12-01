import 'dart:async';

import 'bloc.dart';

class BaseBloc {
  final StreamController<dynamic> _eventController = StreamController<dynamic>();
  final StreamController<BaseState> _stateController = StreamController<BaseState>.broadcast();

  BaseState? _currentState;

  Stream<BaseState> get stateStream => _stateController.stream;

  BaseState? get currentState => _currentState;

  BaseBloc() {
    emit(InitialState());
    _eventController.stream.listen((event) {
      mapEvent(event);
    });
  }


  void add(dynamic event) {
    _eventController.sink.add(event);
  }

  Future<void> mapEvent(dynamic event) async{
  }

  void emit(BaseState state) {
    _currentState = state;
    _stateController.sink.add(state);
  }

  void resetState() => emit(InitialState());

  void reloadState() {
    if (_currentState != null) {
      _stateController.sink.add(_currentState!);
    }
  }

  void dispose() {
    _eventController.close();
    _stateController.close();
  }
}