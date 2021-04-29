import 'package:provider/provider.dart';
import 'package:stream_app_poc/core/generic_bloc.dart';

class Event {
  String event;
  String action;
  Event(this.event, this.action);
}

class EventBus extends GenericBloc<Event> {
  late Event _currentEvent;

  sendEvent(Event event) {
    _currentEvent = event;
    add(_currentEvent);
  }

  static EventBus get(context) {
    return Provider.of<EventBus>(context, listen: false);
  }
}
