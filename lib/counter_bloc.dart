import 'package:provider/provider.dart';
import 'package:stream_app_poc/core/generic_bloc.dart';
import 'counter_state.dart';

class CounterBloc extends GenericBloc<CounterState> {
  late CounterState state;

  init() {
    state = CounterState(count: 0);
  }

  Future<void> increment() async {
    state.count++;
    add(state);
  }

  void decrement() {
    state.count--;
    add(state);
  }

  void error(Object err) {
    addError(err);
  }

  static get(context) {
    Provider.of<CounterBloc>(context, listen: false);
  }
}
