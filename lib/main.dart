import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stream_app_poc/core/event_bus.dart';
import 'package:stream_app_poc/counter_bloc.dart';

import 'counter_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(
        providers: [
          Provider<EventBus>(
            create: (context) => EventBus(),
            dispose: (context, eventBus) => eventBus.dispose(),
          )
        ],
        child: Provider<CounterBloc>(
          create: (context) => CounterBloc(),
          child: CounterPage(),
        ),
      ),
    );
  }
}
