
class Calculator {
  final String title;
  final Function function;
  
  const Calculator({
    this.title = 'Evenly',
    this.function = blankFunction,
  });
}

void blankFunction() {}

List divideby = [
  const Calculator(title: 'Evenly', function: blankFunction),
  const Calculator(title: 'Manually', function: blankFunction),
];

