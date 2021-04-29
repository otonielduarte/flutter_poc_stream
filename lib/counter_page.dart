import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stream_app_poc/core/event_bus.dart';

import 'counter_bloc.dart';
import 'counter_state.dart';
import 'counter_widget.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  late StreamSubscription<Event> subscription;

  final _bloc = CounterBloc();

  @override
  void initState() {
    _bloc.init();
    subscription = EventBus.get(context).stream.listen((Event e) {
      if (e.event == 'increment') {
        _bloc.increment();
      } else if (e.event == 'decrement') {
        _bloc.decrement();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('>>>>>>>>>>>>>>>>>>> print');
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Center(
              child: Stack(
                children: [
                  Icon(
                    Icons.shopping_cart,
                    size: 32,
                  ),
                  Positioned(
                    right: 0,
                    child: Center(
                      child: StreamBuilder<CounterState>(
                        stream: _bloc.stream,
                        builder:
                            (context, AsyncSnapshot<CounterState> snapshot) {
                          if (!snapshot.hasData) return Container();
                          return Container(
                            alignment: AlignmentDirectional.topStart,
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.orange),
                            child: Text(
                              '${snapshot.data!.count}',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
        centerTitle: true,
        title: Text('Checkout'),
      ),
      body: CountWidget(),
    );
  }

  @override
  void dispose() {
    print('dispose and cancel subscription');
    _bloc.dispose();
    subscription.cancel();
    super.dispose();
  }
}
