import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.weight, this.height});
  int weight;
  int height;
  double _bmi;
  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(2);
  }

  List getResult() {
    if (_bmi >= 25) {
      return [
        'Overweight',
        'You have a higher than normal body weight. Try to exercise more'
      ];
    } else if (_bmi > 18.5) {
      return ['Normal', 'You have a normal body Weight. Good job, keep it Up!'];
    } else {
      return [
        'Underweight',
        'You have a lower than normal body weight. You can eat a bit more. '
      ];
    }
  }
}
