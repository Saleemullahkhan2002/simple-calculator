import 'dart:html';

void main() {
  // Get the input elements and result span
  var num1Input =      querySelector('#num1') as InputElement;
  var num2Input =      querySelector('#num2') as InputElement;
  var addButton =      querySelector('#add') as ButtonElement;
  var subtractButton = querySelector('#subtract') as ButtonElement;
  var multiplyButton = querySelector('#multiply') as ButtonElement;
  var divideButton =   querySelector('#divide') as ButtonElement;
  var resultSpan =     querySelector('#result') as SpanElement;

  // Add event listeners to the buttons
  addButton.onClick.listen((_) {
    calculate(num1Input.value, num2Input.value, (a, b) => a + b, resultSpan);
  });

  subtractButton.onClick.listen((_) {
    calculate(num1Input.value, num2Input.value, (a, b) => a - b, resultSpan);
  });

  multiplyButton.onClick.listen((_) {
    calculate(num1Input.value, num2Input.value, (a, b) => a * b, resultSpan);
  });

  divideButton.onClick.listen((_) {
    calculate(num1Input.value, num2Input.value, (a, b) => a / b, resultSpan);
  });
}

void calculate(String? num1, String? num2, num Function(num, num) operation, SpanElement result) {
  // Check if inputs are not null or empty
  if (num1 != null && num2 != null && num1.isNotEmpty && num2.isNotEmpty) {
    try {
      num num1Value = num.parse(num1);
      num num2Value = num.parse(num2);
      num res = operation(num1Value, num2Value);
      result.text = 'Result: $res';
    } catch (e) {
      result.text = 'Invalid input';
    }
  } else {
    result.text = 'Please enter both numbers';
  }
}
