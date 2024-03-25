import 'dart:io';

abstract class Shape {
  double calculateArea();
}

class Rectangle implements Shape {
  double width;
  double height;

  Rectangle(this.width, this.height);

  @override
  double calculateArea() {
    return width * height;
  }
}

class Square extends Rectangle {
  Square(double sideLength) : super(sideLength, sideLength);

  @override
  double calculateArea() {
    return width * width;
  }
}

Square createSquareFromFile(String filename) {
  var file = File(filename);
  List<String> lines = file.readAsLinesSync();
  double sideLength = double.parse(lines[0]);
  return Square(sideLength);
}

void printAreas(List<Shape> shapes) {
  for (var shape in shapes) {
    double area = shape.calculateArea();
    print('Area: $area');
  }
}

void main() {
  var rectangle = Rectangle(5, 10);
  var square = Square(7);

  var squareFromFile = createSquareFromFile('square_data.txt');

  var shapes = [rectangle, square, squareFromFile];
  printAreas(shapes);
}