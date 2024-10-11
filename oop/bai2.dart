//Tạo hai lớp Animal và Dog:
//
// Lớp Animal có các thuộc tính:
// name: tên của động vật.
// age: tuổi của động vật.
// Phương thức makeSound(): in ra một chuỗi "Animal makes a sound".
// Lớp Dog kế thừa từ Animal, có thêm phương thức:
// makeSound(): in ra chuỗi "Dog barks".
// Yêu cầu:
//
// Tạo một đối tượng từ lớp Animal và một đối tượng từ lớp Dog.
// Gọi phương thức makeSound() trên cả hai đối tượng và kiểm tra tính đa hình

class Animal{

  String? name;
  int? age;
  void makeSound(){
    print('Animal makes a sound');
  }
}
class Dog extends Animal{

  void makeSound(){
    print('Dog barks');
    super.makeSound();
  }
}

void main(){
  Animal animal1= Animal();
  Dog dog1 = Dog();
  animal1.makeSound();
  dog1.makeSound();
}