// Abstract Shape class
abstract class Shape {
  void revealMe();
}

// Concrete Shape classes
class Circle implements Shape {
  @override
  void revealMe() {
    print("You chose to print circle");
  }
}

class Rectangle implements Shape {
  @override
  void revealMe() {
    print("You chose to print rectangle");
  }
}

class Square implements Shape {
  @override
  void revealMe() {
    print("You chose to print square");
  }
}

// Shape Factory
class ShapeFactory {
  Shape getShape(String shapeType) {
    switch (shapeType.toLowerCase()) {
      case 'circle':
        return Circle();
      case 'rectangle':
        return Rectangle();
      case 'square':
        return Square();
      default:
        throw ArgumentError('Unknown shape type: $shapeType');
    }
  }
}

// Demo class to use the ShapeFactory
class RandomShape {
  final ShapeFactory factory;

  RandomShape(this.factory);

  void printShape(String shapeType) {
    try {
      Shape shape = factory.getShape(shapeType);
      shape.revealMe();
    } catch (e) {
      print('Error: $e');
    }
  }
}

// Example usage
void main() {
  ShapeFactory factory = ShapeFactory();
  RandomShape demo = RandomShape(factory);

  // Testing different shapes
  demo.printShape('Circle');
  demo.printShape('Rectangle');
  demo.printShape('Square');
  
  // Testing invalid shape
  demo.printShape('Triangle'); // Will print error message
}