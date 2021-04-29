import 'package:flutter/material.dart';
import 'package:stream_app_poc/core/event_bus.dart';

class CountWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () => EventBus.get(context)
                    .sendEvent(Event('decrement', 'decrement')),
                icon: Icon(Icons.remove),
              ),
              SizedBox(width: 20),
              IconButton(
                onPressed: () => EventBus.get(context)
                    .sendEvent(Event('increment', 'increment')),
                icon: Icon(Icons.add),
              ),
            ],
          ),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (_) => Scaffold(
                    body: Container(
                      child: Text('Nova pagina'),
                    ),
                  ),
                ),
              );
            },
            icon: Icon(Icons.navigate_next),
            label: Text("Go to"),
          )
        ],
      ),
    );
  }
}
