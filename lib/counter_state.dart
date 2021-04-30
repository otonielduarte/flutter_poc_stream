import 'package:equatable/equatable.dart';

abstract class CounterState extends Equatable {
  final int count;
  CounterState(this.count);
  @override
  List<Object?> get props => [];
}

class CounterIncremented extends CounterState {
  final int counter;

  CounterIncremented(this.counter) : super(counter);

  @override
  List<Object?> get props => [counter];
}

class CounterInit extends CounterState {
  CounterInit() : super(0);
}

class CounterDecrement extends CounterState {
  final int counter;
  CounterDecrement(this.counter) : super(counter);

  @override
  List<Object?> get props => [counter];
}

class CounterReached extends CounterState {
  CounterReached(int count) : super(count);
}
