import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(PApp());
}

class Counter extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }

  void reset() {
    _count = 0;
    notifyListeners();
  }
}

class PApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (_) => Counter(),
        child: CounterApp(),
      ),
    );
  }
}

class CounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App - Provider'),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 200,
          color: Colors.yellow.shade300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Count: ${counter.count}',
                style: TextStyle(fontSize: 24.0),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: counter.increment,
                    child: Text('+'),
                  ),
                  ElevatedButton(
                    onPressed: counter.decrement,
                    child: Text('-'),
                  ),
                  ElevatedButton(
                    onPressed: counter.reset,
                    child: Text('Reset'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
