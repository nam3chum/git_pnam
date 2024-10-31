
//Tạo một lớp Person với các thuộc tính:
//
// name: tên của người.
// age: tuổi của người.
// Yêu cầu:
//
// Tạo phương thức describe() để in ra thông tin của người dưới dạng: "Name: [name], Age: [age]".
// Khởi tạo hai đối tượng từ lớp Person và gọi phương thức describe() cho cả hai đối tượng.
class Person{
  String? name;
  int? tuoi;

  Person(this.name, this.tuoi);
  void describe(){
    print('Name: $name ,Age: $tuoi');
  }
}

void main(){
  Person person1= Person('nam', 21);
  Person person2= Person('Đỗ Ngọc Giao', 21);
  person2.describe();
}