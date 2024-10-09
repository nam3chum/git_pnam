import 'dart:io';

import 'package:demo/Book.dart';
import 'package:demo/Library.dart';
import 'package:demo/User.dart';

void main() async{
/*xây dựng một hệ thống quản lý thư viện số cho phép người dùng:
Thêm, xóa, tìm kiếm sách.
Xem thông tin sách và tình trạng mượn sách.
Mượn và trả sách.
Quản lý tài khoản của người dùng.
Thực hiện xử lý bất đồng bộ khi truy cập dữ liệu từ server giả lập (simulated server).*/


//tao thu vien
Library library = Library();

//theme sach vao thu vien
 Book book1 = Book(id: "001",title: 'Dart Programing',author: "author A",namSX: 2020);
 Book book2 = Book(id: "002",title: 'flutter tutorial',author: "author B",namSX: 2021);
 library.addBook(book1);
 library.addBook(book2);

 //taoj nguoi dung
 User user1 = User(id: 'u001',ten: 'nam',email: "nam3chum@gmail.com");

 //hien thi menu
 bool running = true;

 while(running){
  print('\n----- Library Menu -----');
  print('1. Hiển thị thông tin sách');
  print('2. Mượn sách');
  print('3. Trả sách');
  print('4. Thêm sách vào thư viện');
  print('5. Xóa sách khỏi thư viện');
  print('6. Hiển thị thông tin người dùng');
  print('7. Thoát');
  print('------------------------');
  stdout.write('Chọn một tùy chọn: ');

  String? choice = stdin.readLineSync();
  switch(choice) {
   case '1':
    print('\ndanh sach sach trong thu vien:');
    for (var book in library.bookList) {
     book.displayInfo();
    }
    break;

   case '2':
    print('nhap id sach muon muon: ');
    String? bookIdtoBorrow = stdin.readLineSync();
    if (bookIdtoBorrow != null && bookIdtoBorrow.isNotEmpty) {
     await library.borrowBook(user1, bookIdtoBorrow);
    } else {
     print("ID sach k hop le");
    }
    break;

   case '3':
    print('nhap id sach muon tra');
    String? bookIdtoReturn = stdin.readLineSync();
    if(bookIdtoReturn !=null &&bookIdtoReturn.isNotEmpty)
     {
      await library.returnBook(user1, bookIdtoReturn);
     }
    else{
     print('id sach k hop le');
    }
    break;
    
   case '4':
    stdout.write('Nhập ID sách: ');
    String? newBookId = stdin.readLineSync();
    stdout.write('Nhập tiêu đề sách: ');
    String? newTitle = stdin.readLineSync();
    stdout.write('Nhập tác giả: ');
    String? newAuthor = stdin.readLineSync();
    print('nhap nam san xuat: ');
    String? namSx= stdin.readLineSync();
    int newYear = int.tryParse(namSx ?? '') ?? 0;

    if(newBookId != null && newTitle != null && newAuthor != null && newYear > 0 )
    {
     Book newBook = Book(
      id: newBookId,
      title: newTitle,
      author: newAuthor,
      namSX: newYear);

     library.addBook(newBook);
    }else{
     print('thoong tin sach k hop lys');
     break;
    }

   case '5':
    print('nhap id can xoa: ');
    String? bookIdToRemove = stdin.readLineSync();
    if(bookIdToRemove!= null && bookIdToRemove.isNotEmpty)
     {
      library.removeBook(bookIdToRemove);
     }else{
     print(('sach k hop le'));
    }
     break;

   case '6':
    user1.hienThi();
    break;

   case '7':
    running = false;
    print('thoat chuong trinh...');
     break;


     default:
      print('lua chon k hop le , vui long chon lai');
    }
    
  }
  
 }

