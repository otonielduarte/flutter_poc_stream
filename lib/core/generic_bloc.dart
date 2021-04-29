import 'dart:async';

abstract class GenericBloc<T> {
  final _controller = StreamController<T>.broadcast();

  get stream => _controller.stream;

  void add(T object) {
    if (!_controller.isClosed) {
      _controller.add(object);
    }
  }

  void addError(Object err) {
    if (!_controller.isClosed) {
      _controller.addError(err);
    }
  }

  void dispose() {
    if (!_controller.isClosed) {
      _controller.close();
    }
  }
}
