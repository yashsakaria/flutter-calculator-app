import 'package:flutter/cupertino.dart';

class CalculatorData extends ChangeNotifier {
  String _calcText = '0';
  bool isPointEntered = false;
  bool isErrorGenerated = false;
  bool isResultCalculated = false;
  bool isLastOpcode = false;
  final _operand = <String>[];
  final _opcode = <String>[];

  String get answer => _calcText;

  void updateText(String newText) {
    if (_calcText == '0' ||
        isLastOpcode ||
        isResultCalculated ||
        isErrorGenerated) {
      if (isErrorGenerated) {
        clearText();
      }
      isResultCalculated = false;
      isLastOpcode = false;
      _calcText = newText;
    } else if (_calcText.length < 8) {
      _calcText = _calcText + newText;
    }
    notifyListeners();
  }

  void addPoint() {
    if (!isPointEntered) {
      if (isLastOpcode || isResultCalculated) {
        isResultCalculated = false;
        isLastOpcode = false;
        _calcText = '0.';
      } else {
        _calcText = _calcText + '.';
      }
      isPointEntered = true;
      notifyListeners();
    }
  }

  void clearText() {
    _calcText = '0';
    isLastOpcode = false;
    isPointEntered = false;
    isErrorGenerated = false;
    isResultCalculated = false;
    _operand.clear();
    _opcode.clear();
    notifyListeners();
  }

  void negate() {
    if (_calcText != '0' && _calcText != 'Error') {
      var x = num.tryParse(_calcText)?.toDouble();
      x = x! * (-1);
      _calcText = doubleParser(x).toString();
      notifyListeners();
    }
  }

  void doOperation() {
    var x = num.tryParse(_operand.removeLast())?.toDouble();
    var y = num.tryParse(_operand.removeLast())?.toDouble();
    String op = _opcode.removeLast();
    String ans = calculate(x!, op, y!);
    if (ans == 'Error') {
      isErrorGenerated = true;
      _calcText = 'Error';
      notifyListeners();
    } else {
      _operand.add(ans);
    }
  }

  void updateCodes(String opcode) {
    if (!isLastOpcode) {
      _operand.add(_calcText);
      isLastOpcode = true;
      isResultCalculated = false;
      isPointEntered = false;
      while (_opcode.isNotEmpty &&
          getPriority(_opcode.last) >= getPriority(opcode)) {
        doOperation();
      }
      _opcode.add(opcode);
      _calcText = _operand.last;
      notifyListeners();
    } else {
      _opcode.removeLast();
      _opcode.add(opcode);
    }
  }

  void getResult() {
    if (_opcode.isNotEmpty) {
      _operand.add(_calcText);
      while (_opcode.isNotEmpty) {
        doOperation();
      }
      isResultCalculated = true;
      isPointEntered = false;
      if (_calcText != 'Error') {
        _calcText = _operand.removeLast();
      }
      notifyListeners();
    }
  }

  String calculate(double x, String op, double y) {
    if (op == '+') {
      return doubleParser(y + x);
    } else if (op == '-') {
      return doubleParser(y - x);
    } else if (op == '*') {
      return doubleParser(y * x);
    } else {
      if (x == 0) {
        clearText();
        return 'Error';
      } else {
        return doubleParser(y / x);
      }
    }
  }

  int getPriority(String opcode) {
    if (opcode == '+' || opcode == '-') {
      return 1;
    } else if (opcode == '*' || opcode == '/') {
      return 2;
    } else {
      return 0;
    }
  }

  String doubleParser(double value) {
    if (value.toString().length > 8) {
      return value.toStringAsPrecision(3);
    } else {
      final hasDecimalPlaces = value.truncateToDouble() != value;
      if (hasDecimalPlaces) {
        return value.toString();
      } else {
        return value.toInt().toString();
      }
    }
  }
}
