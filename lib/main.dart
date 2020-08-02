import 'package:counter_rxdart_bloc/counter_bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterScreen(),
    );
  }
}

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counterBloc = CounterBloc();
    return StreamBuilder(
      stream: counterBloc.count,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        int count;
        if (snapshot.data == null) {
          counterBloc.changeCount(0);
        }
        count = snapshot.data;

        return Scaffold(
          appBar: AppBar(
            title: Text('Counter Screen'),
          ),
          floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                counterBloc.changeCount(count + 1);
              }),
          body: Center(
            child: Text('$count'),
          ),
        );
      },
    );
  }
}
