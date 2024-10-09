class Book{
 String id;
 String title;
 String author;
 int namSX;
 bool isAvailable;

 Book({required this.id, required this.title, required this.author, required this.namSX, this.isAvailable = true});

 //void hiển thị thong tin sách
  void displayInfo(){
    print(
      'ID: $id | TITLE: $title | AUTHOR: $author | NAMSX: $namSX | Available: ${isAvailable ? true: false}'
    );
  }
  //void hiện mượn sách hay chưa
  void borrow(){
    if(isAvailable)
      {
        isAvailable = false;
        print("bạn vừa mượn thành công sách: $title");
      }
    else
      print("sách $title đã đươc mượn rôi");
  }
  //void hiện thị trả sách
  //kiểm tra isVailabel = true(true là đã mượn , false là chưa)
  void returnBook(){
    // khi sách đã đươc mượn (false) thì lúc trả sách sẽ là true
    isAvailable = true;
    print("sách $title đã được trả");
  }
}