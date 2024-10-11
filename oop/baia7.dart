abstract class Item {
  String title;
  String author;
  int year;
  Item(this.title, this.author, this.year);
  void displayInfo();
}

class Book extends Item {
  String genre;
  Book(String title, String author, int year, this.genre) : super(title, author, year);
  @override
  void displayInfo() {
    print('Tên: $title, Tác giả: $author, Năm xuất bản: $year, Thể loại: $genre');
  }
}
class Member {
  String name;
  String membershipId;
  List<Book> borrowedBooks = [];

  Member(this.name, this.membershipId);

  void borrowBook(Book book) {
    borrowedBooks.add(book);
    print('$name đã mượn sách "${book.title}"');
  }
  void returnBook(Book book) {
    borrowedBooks.remove(book);
    print('$name đã trả sách "${book.title}"');
  }
  void displayBorrowedBooks() {
    print('$name đã mượn:');
    for (var book in borrowedBooks) {
      print('- ${book.title}');
    }
  }
}

class Library {
  List<Book> books = [];
  List<Member> members = [];

  void addBook(Book book) {
    books.add(book);
    print('Đã thêm sách: "${book.title}" vào thư viện.');
  }
  void registerMember(Member member) {
    members.add(member);
    print('Đã đăng ký thành viên: ${member.name}');
  }
  void displayBooks() {
    print('Sách trong thư viện:');
    for (var book in books) {
      book.displayInfo();
    }
  }
  void displayMembers() {
    print('Thành viên thư viện:');
    for (var member in members) {
      print('- ${member.name} (ID: ${member.membershipId})');
    }
  }
}

void main() {
  var library = Library();
  var book1 = Book('1984', 'George Orwell', 1949, 'Dystopian');
  var book2 = Book('To Kill a Mockingbird', 'Harper Lee', 1960, 'Fiction');
  library.addBook(book1);
  library.addBook(book2);
  var member1 = Member('Alice', 'M001');
  var member2 = Member('Bob', 'M002');
  library.registerMember(member1);
  library.registerMember(member2);

  library.displayBooks();
  library.displayMembers();

  member1.borrowBook(book1);
  member1.displayBorrowedBooks();

  member1.returnBook(book1);
  member1.displayBorrowedBooks();
}
