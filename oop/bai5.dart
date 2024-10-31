//Tạo một lớp trừu tượng Shape:
//
// Có phương thức trừu tượng area() và perimeter().
// Sau đó tạo hai lớp kế thừa từ Shape:
//
// Rectangle: Có các thuộc tính chiều dài (length) và chiều rộng (width).
// Tính toán diện tích và chu vi hình chữ nhật.
// Circle: Có thuộc tính bán kính (radius).
// Tính toán diện tích và chu vi hình tròn.
// Yêu cầu:
//
// Tạo đối tượng của cả hai lớp Rectangle và Circle.
// Gọi phương thức area() và perimeter() cho cả hai đối tượng.

abstract class Shape {
  double area();
  double perimeter();
}

class Rectangle extends Shape {
  double length;
  double width;

  Rectangle(this.length, this.width);

  @override
  double area() {
    return length * width;
  }

  @override
  double perimeter() {
    return 2 * (length + width);
  }
}

class Circle extends Shape {
  double radius;

  Circle(this.radius);

  @override
  double area() {
    return 3.14 * radius * radius;
  }

  @override
  double perimeter() {
    return 2 * 3.14 * radius;
  }
}

void main() {
  var rectangle = Rectangle(10, 5);
  var circle = Circle(7);

  print('Rectangle Area: ${rectangle.area()}');
  print('Rectangle Perimeter: ${rectangle.perimeter()}');
  print('Circle Area: ${circle.area()}');
  print('Circle Perimeter: ${circle.perimeter()}');
}
