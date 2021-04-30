import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:stream_app_poc/core/event_bus.dart';
import 'package:stream_app_poc/counter_bloc.dart';
import 'package:stream_app_poc/counter_page.dart';
import 'package:stream_app_poc/empty_screen.dart';

void main() {
  late CounterBloc bloc;

  setUp(() {
    bloc = CounterBloc();
  });

  Future<void> loadPager(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: MultiProvider(
          providers: [
            Provider<EventBus>(
              create: (context) => EventBus(),
              dispose: (context, eventBus) => eventBus.dispose(),
            )
          ],
          child: Provider<CounterBloc>(
            create: (context) => bloc,
            child: CounterPage(),
          ),
        ),
      ),
    );
  }

  testWidgets("Should not be print counter in cart", (tester) async {
    await loadPager(tester);
    expect(find.byIcon(Icons.shopping_cart), findsOneWidget);
    expect(find.text('0'), findsNothing);
  });

  testWidgets("Should be print value 1 in circle about shopping cart",
      (tester) async {
    await loadPager(tester);
    bloc.increment();

    await tester.pump();

    expect(find.byIcon(Icons.shopping_cart), findsOneWidget);
    expect(find.text('1'), findsOneWidget);
  });

  testWidgets("Should be print value -1 in circle about shopping cart",
      (tester) async {
    await loadPager(tester);
    bloc.decrement();

    await tester.pump();

    expect(find.byIcon(Icons.shopping_cart), findsOneWidget);
    expect(find.text('-1'), findsOneWidget);
  });

  testWidgets("Should be print Is Reached in circle about shopping cart",
      (tester) async {
    await loadPager(tester);
    bloc.increment();
    bloc.increment();
    bloc.increment();
    bloc.increment();
    bloc.increment();

    await tester.pump();

    expect(find.byIcon(Icons.shopping_cart), findsOneWidget);
    expect(find.text('Is Reached'), findsOneWidget);
  });

  testWidgets("Should navigate when button has clicked", (tester) async {
    await loadPager(tester);

    final buttonFinder = find.text('Go to');
    await tester.tap(buttonFinder);

    await tester.pumpAndSettle();

    expect(find.byType(EmptyScreen), findsOneWidget);
  });
}
