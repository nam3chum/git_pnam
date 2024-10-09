import 'package:demo/User.dart';
import 'Book.dart';

class Library {
  List<Book> bookList = [];
  List<User> userList = [];

  //voi thêm sach vào thư viện
  void addBook(Book book) {
    bookList.add(book);
    print("đã thêm thành công sách ${book.title} vao thư viện");
  }

//xoá sách khỏi thư viện (xoá theo mã sách
  void removeBook(String bookId) {
    bookList.removeWhere((book) => book.id == bookId);
    print("removed book with ID $bookId from the library");
  }

//tìm kiếm sách theo tiêu đề
  Book? searchBook(String title) {
    for (var book in bookList) {
      if (book.title.toLowerCase() == title.toLowerCase()) {
        return book;
      }
    }
    print('sách $title không có');
    return null;
  }

  Future<void> borrowBook(User user, String Id) async {
    Book? book = bookList.firstWhere((book) => book.id == Id,
        orElse: () => null as Book);
    //kiem tra xem book co ton tai k va da duoc muon hay chua
    if (Id != null && book.isAvailable )  {
      await user.borrowBook(book);
    }
    else {
      print('sách đã được mượn hoặc không tồn tại');
    }
  }

  Future<void> returnBook(User user, String bookId) async {
    Book? book = bookList.firstWhere((book) => bookId == bookId,
        orElse: () => null as Book);
    if (book != null) {
      await user.returnBook(book);
    }
    else
      ('không có sách ');
  }

}