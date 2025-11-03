abstract class StateApp<T> {
  const StateApp();
}

class StartState<T> extends StateApp<T> {}

class LoadingState<T> extends StateApp<T> {}

class SuccessState<T> extends StateApp<T> {
  final T data;
  SuccessState(this.data);
}

class ErrorState<T> extends StateApp<T> {
  final String message;
  ErrorState(this.message);
}
