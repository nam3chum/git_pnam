import 'dart:convert';
import 'dart:io';
import 'dart:math';

const List<int> MENH_GIA = [500000, 200000, 100000, 50000, 20000, 10000, 5000, 2000, 1000];

void main() async{


  //

  bool check = true;

  while(check == true){

    print('''menu
    ----Bài 1------
    1.Khai báo, nhập tên và năm sinh của một người từ bàn phím và tính in ra tuổi của người đó. 
    2.Tính cos, sin của hàm 45° bằng functions trong Dart
    ----Bai 2------
    3.Sử dụng kiến thức đã học viết chương trình giúp cho các quầy thu ngân thối tiền lại cho khách hàng sao cho số tờ tiền là ít nhất.
      Input: Số tiền khách đưa và số tiền khách trả
      Output: Số tờ tiền cho từng mệnh giá cần đưa cho khách (VNĐ).
    4.Viết chương trình xoá các từ lặp liên tiếp trong câu. “Chào bạn bạn Hoa, mình là là là là là Dev Flutter.”
    ----Bài 3-----
    5.tiến hành đọc file convert thành kiểu List<int> 
    tìm kiếm số ở trên bằng thuật toán tìm kiếm nhị phân svà trả về kết quả cho người dùng.
    
    0.thoát chương trình
    ''');
    print('chọn số cho bài toán');
    try{
      int choice;
    choice = int.parse(stdin.readLineSync()!);

    switch(choice){
      case 1:
    print("Nhập tên của bạn:");
    String? name = stdin.readLineSync();
    // Nhập năm sinh từ bàn phím
    print("Nhập năm sinh của bạn:");
    int? yearOfBirth = int.parse(stdin.readLineSync()!);
    int tuoi = DateTime.now().year - yearOfBirth;
    print('$name năm nay $tuoi tuổi');
          break;
      case 2:
        tinhLuongGiac();
        break;
      case 3:
        thoiTien();
        break;
      case 4:
        xoaLapLienTiep();
        break;
      case 5:
        await for(var value in readFileAsStream('E:\\Android_NC\\demo\\lib\\doc1.txt')){
          print('dữ liệu đọc được là: $value');
        }
        break;
      case 0:
        print('thoát chương trình');
        check = false;
      default:
        print('không hợp lệ mới nhập lại:');
        break;
    }
    }catch(e){
      print('vui lòng nhập vào chữ số');
    }

  }
}
void tinhLuongGiac(){
  //chuyển từ 45 độ sang radian
  double radian = 45*pi/180;

  //tính sin cos
  double sinValue= sin(radian);
  double cosValue= cos(radian);

  print('giá trị của sin45 là: $sinValue');
  print("giá trị của cos45 là: $cosValue");
}

void thoiTien(){
  print("nhập tiền khách đưa: ");
  int? tien=int.parse(stdin.readLineSync() ?? '0');
  print("nhập tiền khách phải trả: ");
  int? tienKhachTra= int.parse(stdin.readLineSync() ?? "0");
  int tienThoi = tien-tienKhachTra;
  if(tienThoi<0)
  {
    print("khách đưa k đủ");
    return;
  }
  //tinh so to it nhất
  Map<int,int> ketqua={};
  for(int menhGia in MENH_GIA){
    int soTo = tienThoi! ~/ menhGia;
    if(soTo>0)
    {
      ketqua[menhGia] = soTo; //lưu số tờ tiền tương ứng với
      tienThoi -= soTo*menhGia;
    }
  }
  print("số tờ trả khách : ");
  ketqua.forEach((menhGia,soTo){
    print("menh gia: $menhGia VND - so to: $soTo");
  });

}
void xoaLapLienTiep(){
  String cau="Chào bạn bạn Hoa, mình là là là là là Dev Flutter";
  print("câu cũ : $cau");

  List<String> words = cau.split(' ');
//danh sach mơi để lưu các từ không lặp liên tiếp
  List<String> newWords = [words[0]];
  for(int i= 1;i<words.length;i++){
    if(words[i] !=words[i-1])//so sánh : nếu khác với tu phía trước thì add vào list mới
      newWords.add(words[i]);
  }
  String result= newWords.join(' ');
  print("câu mới: $result");


}

Stream<String> readFileAsStream(String filePath) async* {
  final file = File(filePath);
  Stream<String> lines= file.openRead()
      .transform(utf8.decoder)   //chuyển bye thành chuỗi
      .transform(LineSplitter()); //chuyển file thành từng dòng

  //mõi dòng đọc được sẽ gửi ra Stream
  await for(var line in lines)
  {
    await Future.delayed(Duration(milliseconds: 500));// đợi mỗi 1 giây r mới trả về từng dòng dữ liệu
    yield line; //gửi ra
  }
}
