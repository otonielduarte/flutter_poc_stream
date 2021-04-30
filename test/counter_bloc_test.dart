import 'package:flutter_test/flutter_test.dart';
import 'package:stream_app_poc/counter_bloc.dart';
import 'package:stream_app_poc/counter_state.dart';

void main() {
  late CounterBloc bloc;

  setUp(() {
    bloc = CounterBloc();
  });
  test('Should be initialize state', () {
    expect(bloc.state, CounterInit());
  });

  test('Should be incremented when increment called', () {
    bloc.increment();
    expect(bloc.state, CounterIncremented(1));
  });

  test('Should be decremenet when decrement called', () {
    bloc.decrement();
    expect(bloc.state, CounterDecrement(-1));
  });

  test('Should be reached when incremented called 5 times', () {
    bloc.increment();
    bloc.increment();
    bloc.increment();
    bloc.increment();
    bloc.increment();
    expect(bloc.state, CounterReached(5));
  });
}
