abstract class BaseState {}

class InitialState extends BaseState {}
class LoadingState extends BaseState {}

class LoadedState<T> extends BaseState {
  final T data;
  LoadedState(this.data);
}
class ErrorState extends BaseState {
  final String message;
  ErrorState(this.message);
}