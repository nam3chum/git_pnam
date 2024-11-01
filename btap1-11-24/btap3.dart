// Yêu cầu: Viết một lớp Product có các thuộc tính như tên, loại, giá, và trọng lượng.
// Tạo một enum cho loại sản phẩm (ví dụ: Electronics, Groceries, Clothing).
// Sử dụng mixin để thêm phương thức tính thuế cho sản phẩm dựa trên loại của nó.
// Output: In ra thông tin sản phẩm và thuế tính theo loại sản phẩm.
enum ProductType { Electronics, Groceries, Clothing }

mixin TaxMixin {
  double calculateTax(ProductType type, double price) {
    switch (type) {
      case ProductType.Electronics:
        return price * 0.15;
      case ProductType.Groceries:
        return price * 0.05;
      case ProductType.Clothing:
        return price * 0.1;
      default:
        return 0;
    }
  }
}

class Product with TaxMixin {
  String name;
  ProductType type;
  double price;

  Product({required this.name, required this.type, required this.price});

  double tax() {
    return calculateTax(type, price);
  }

  @override
  String toString() {
    return "$name: Giá ${price.toStringAsFixed(2)}, Thuế: ${tax().toStringAsFixed(2)}";
  }
}

void main() {
  var product = Product(name: "Laptop", type: ProductType.Electronics, price: 1000.0);
  print(product);
}

