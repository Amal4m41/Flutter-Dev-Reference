void main() {
  final a = 'hello world';
  const b = 'hello world';

  final x = MyConstClass(5, a, [1, 2, 3]);
  final c = const MyConstClass(6, 'sfsd', [1, 2, 3]);

  print(x.hashCode);
  print(c.hashCode);
}

class MyConstClass {
  final int intValue;
  final String stringValue;
  final List<int> listValue;

  const MyConstClass(
    this.intValue,
    this.stringValue,
    this.listValue,
  );
}
