import 'package:flutter/material.dart';
import 'package:task_second_statemanagemet/View/task_view.dart';
import '../Controller/counter_controller.dart';

class CounterView extends StatefulWidget {
  const CounterView({super.key});

  @override
  _CounterViewState createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  late CounterController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CounterController(
      updateView: () {
        setState(() {});
      },
    );
    _controller.loadCounter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 125, 189, 243),
      appBar: AppBar(title: Center(child: Text("Counter Screen"))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Counter Value", style: TextStyle(fontSize: 20)),
            Text(
              "${_controller.counter.value}",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => _controller.updateCounter(-1),
                  child: Text("-"),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => _controller.updateCounter(1),
                  child: Text("+"),
                ),
              ],
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              child: const Text('Go to Home Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
