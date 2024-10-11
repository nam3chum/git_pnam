// Tạo lớp Student với các thuộc tính:
//
// name: tên sinh viên.
// age: tuổi sinh viên (dùng thuộc tính private _age).
// Yêu cầu:
//
// Tạo phương thức getter và setter để truy cập và cập nhật giá trị của thuộc tính _age.
// Tạo một đối tượng từ lớp Student, thay đổi giá trị của tuổi và in ra thông tin sinh viên.

class Student {
  String name;
  int _age;

  Student(this.name, this._age);

  int get age => _age;
  set age(int value) {
    if (value >= 0) {
      _age = value;
    } else {
      print('tuôi kh âm');
    }
  }
}

void main() {
  var student = Student('Giao', 20);

  print('tên: ${student.name}, tuoi: ${student.age}');

  student.age = 21;
  print('cập nhật tuổi: ${student.age}');

  student.age = -5;
}
