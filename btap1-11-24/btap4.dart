  // Yêu cầu: Viết chương trình để điểm danh sinh viên trong một lớp học.
  // Khi sinh viên nhập tên của mình, chương trình sẽ kiểm tra xem tên có trong danh sách không.
  // Nếu có, chương trình hiển thị "Đã điểm danh". Nếu không, hiển thị "Tên không tồn tại trong danh sách".
  // Input: Danh sách sinh viên và tên sinh viên điểm danh.
  // Output: "Đã điểm danh" hoặc "Tên không tồn tại trong danh sách".
  import 'dart:io';
  class Student {
    String name;
    Student(this.name);
  }
  class Classroom {
    List<Student> students = [];
    void addSV(Student student) {
      students.add(student);
    }
    void diemDanh(String studentName) {
      //check điểm danh
      bool check =false;
      //su dụng any để kiểm tra các phần tử trong List
      check= students.any((student) => student.name == studentName);
      if(check)
        {
          print('đã điểm danh');
        }
      else{
        print('tên không tồn tại trong danh sách');
      }
    }
  }

  void main() {
    Classroom classroom = Classroom();

    classroom.addSV(Student("A"));
    classroom.addSV(Student("B"));
    classroom.addSV(Student("C"));

    print("Nhập tên sinh viên để điểm danh:");
    String studentName = stdin.readLineSync()!;

    classroom.diemDanh(studentName);
  }
