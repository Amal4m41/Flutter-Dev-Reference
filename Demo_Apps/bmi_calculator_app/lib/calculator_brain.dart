import 'dart:math';

double calculateBMI({required int height, required int weight}) {
  double bmi = weight / pow(height / 100, 2);
  return bmi;
}

String getResult({required double bmi}) {
  if (bmi >= 25) {
    return 'Overweight';
  } else if (bmi > 18.5) {
    return 'Normal';
  } else {
    return 'Underweight';
  }
}

String getDescription({required double bmi}) {
  if (bmi >= 25) {
    return 'You have a higher than normal body weight. Try to exercise more.';
  } else if (bmi >= 18.5) {
    return 'You have a normal body weight. Good job!';
  } else {
    return 'You have a lower than normal body weight. You can eat a bit more.';
  }
}

//OR
// class CalculatorBrain {
//   CalculatorBrain({this.height, this.weight});
//
//   final int height;
//   final int weight;
//
//   double _bmi;
//
//   String calculateBMI() {
//     _bmi = weight / pow(height / 100, 2);
//     return _bmi.toStringAsFixed(1);
//   }
//
//   String getResult() {
//     if (_bmi >= 25) {
//       return 'Overweight';
//     } else if (_bmi > 18.5) {
//       return 'Normal';
//     } else {
//       return 'Underweight';
//     }
//   }
//
//   String getDescription() {
//     if (_bmi >= 25) {
//       return 'You have a higher than normal body weight. Try to exercise more.';
//     } else if (_bmi >= 18.5) {
//       return 'You have a normal body weight. Good job!';
//     } else {
//       return 'You have a lower than normal body weight. You can eat a bit more.';
//     }
//   }
// }
