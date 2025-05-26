import 'package:shared_preferences/shared_preferences.dart';
import '../Model/counter_model.dart';

class CounterController {
  Counter counter = Counter(value: 0);
  Function? updateView; // Callback for UI refresh

  CounterController({this.updateView});

  void loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    counter = Counter(value: prefs.getInt('counter') ?? 0);
    updateView?.call(); // Refreshes View when data is loaded
  }

  void updateCounter(int increment) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    counter.value += increment;
    prefs.setInt('counter', counter.value);
    updateView?.call(); // Refreshes View after update
  }
}
