import 'Book.dart';

class User{
  String id;
  String ten;
  String email;
  List<Book> borrowedBook = [];

  User({required this.id, required this.ten, required this.email});

  //void hiển thị người dùng đã dc mượn sách
  void hienThi(){
    print('User ID: $id | Name: $ten | Email: $email');
    print('Borowed Book: ${borrowedBook.map((book) => book.title).toList()}');
  }

  //mượn sách
Future<void> borrowBook(Book book) async{
    await Future.delayed(Duration(seconds: 2));//gia lap độ trễ 2 giây
    if(book.isAvailable && book.id !=null){
      borrowedBook.add(book);
      book.borrow();
    }
    else{
      print("title ${book.title} is not available for following");
    }
}

Future<void> returnBook(Book book) async{
  await Future.delayed(Duration(seconds: 2));//gia lap độ trễ 2 giây
  borrowedBook.remove(book);
  book.returnBook();
}
}