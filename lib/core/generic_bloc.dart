import 'dart:async';

abstract class GenericBloc<T> {
  final _controller = StreamController<T>.broadcast();
  T? lastObject;

  get stream => _controller.stream;

  void add(T object) {
    if (!_controller.isClosed && lastObject != object) {
      print('${lastObject.runtimeType} - ${object.runtimeType}');
      lastObject = object;
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
