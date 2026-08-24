import 'dart:math';

abstract class Shape {
  String get name;

  double calculateArea();
  double calculatePerimeter();

  void displayInfo() {
    print('--- $name ---');
    print('Area: ${calculateArea().toStringAsFixed(2)}');
    print('Perimeter: ${calculatePerimeter().toStringAsFixed(2)}');
    print('');
  }
}

class Circle extends Shape {
  double radius;

  Circle(this.radius);

  @override
  String get name => 'Circle';

  @override
  double calculateArea() => pi * radius * radius;

  @override
  double calculatePerimeter() => 2 * pi * radius;
}

class Rectangle extends Shape {
  double width;
  double height;

  Rectangle(this.width, this.height);

  @override
  String get name => 'Rectangle';

  @override
  double calculateArea() => width * height;

  @override
  double calculatePerimeter() => 2 * (width + height);
}

class Square extends Rectangle {
  Square(double side) : super(side, side);

  @override
  String get name => 'Square';
}

void main() {
  List<Shape> shapes = [Circle(5), Rectangle(4, 6), Square(4)];

  for (var shape in shapes) {
    shape.displayInfo();
  }
}
