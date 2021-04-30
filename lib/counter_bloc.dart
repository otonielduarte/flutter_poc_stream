import 'package:provider/provider.dart';

import 'package:stream_app_poc/core/generic_bloc.dart';

import 'counter_state.dart';

class CounterBloc extends GenericBloc<CounterState> {
  late CounterState state;
  CounterBloc() : state = CounterInit();

  Future<void> increment() async {
    //int newValue = state.count;
    final int newValue = state.count + 1;
    if (newValue == 5) {
      print('>>>>>>> newValue $newValue');
      state = CounterReached(newValue);
    } else {
      state = CounterIncremented(newValue);
    }
    add(state);
  }

  void decrement() {
    int newValue = state.count - 1;
    if (newValue == 5) {
      print('>>>>>>> newValue $newValue');
      state = CounterReached(newValue);
    } else {
      state = CounterDecrement(newValue);
    }
    add(state);
  }

  void error(Object err) {
    addError(err);
  }

  static get<CounterBloc>(context) {
    Provider.of<CounterBloc>(context, listen: false);
  }
}
