import 'dart:convert';
import 'dart:io';
import 'dart:math';
void main(){
  //chạy 1 chuương trình yêu cầu người dùng njaap 1 số và sau đó
  //in ra dánh sahc tắt cả các ước của số đó

  //UocCuaso();
  //phantuChung();
  //chuoiPalindrome();
  //dauvacuoi();
  hamtaomatkhau();
}
void UocCuaso(){
  print("chọn 1 số bất kỳ: ");
  int number = int.parse(stdin.readLineSync()!);
  for(var i=1;i<=number;i++)
    {
      if( number%i == 0)
        print(i);
    }
}

void phantuChung(){
  // a = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89]
  // b = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
  //in ra những ptu giống nhau cua 2 manảng
    List<int> a= [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89];
    List<int> b = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];

    Set<int> c={};

    for(var i in a){
      for(var j in b)
        {
          if(i==j)
            c.add(i);
        }
    }
    //xuất phần tử của c
    print(c.toList());

    // toán tử sử dụng 1 hàng
    print(Set.from(a).intersection(Set.from(b)).toList());
}
void chuoiPalindrome(){
  //Yêu cầu người dùng cung cấp một chuỗi và in ra xem chuỗi này có phải là một chuỗi Palindrome hay không.
  // Palindrome là một chuỗi đọc xuôi và ngược giống nhau.
    print("mời nhập từ: ");

    String? chuoi= stdin.readLineSync()?.toLowerCase();

    String? rvchuoi= chuoi?.split("").reversed.join("");

    rvchuoi==chuoi ? print("đây là chuỗi palindrome") : print("đây không phải là chuỗi palindrome");

}
void dauvacuoi(){
  //khoi tao bien random
  final random = Random();

  //random 10 phan tu cua list
  List<int> randList = List.generate(10,(_)=> random.nextInt(100));

  print(randList);

  print(newList(randList));
}

List<int> newList(List<int> initialList)
{
  return [initialList.first,initialList.last];
}

//Viết trình tạo mật khẩu trong Dart trong ngôn ngữa Dart.
// Bao gồm mã thời gian chạy của bạn trong một phương thức chính.
// Hỏi người dùng xem họ muốn mật khẩu của họ mạnh đến mức nào.
// Đối với mật khẩu yếu, hãy chọn một hoặc hai từ trong danh sách.

void shufferGenerator(int strength){

  //khoi tao gia tri random
  Random random = new Random();
  random =Random.secure();
  //tạo random List với độ lớn danh sách là strength và random từ 0 -> 255
  List<int> ranList= List.generate(strength,(_) => random.nextInt(255));
  //loại trừ các ký tự đặc biệt bằng base64URL và join nó lại

  List charList = base64UrlEncode(ranList).split("").toList() as List;

  //hoán vị thêm lần nx
  charList.shuffle();
  print("mật khẩu là: ${charList.join("")} \n" );
}
void hamtaomatkhau(){
  String? strength;
  print("mời nhập độ mạng mặt khẩu: weak - middle - strong");
  strength= stdin.readLineSync()?.toLowerCase();

  switch(strength) {
    case "weak":
      shufferGenerator(5);
      break;
    case "middle":
      shufferGenerator(15);
      break;
    case "strong":
      shufferGenerator(25);
      break;
    default:
      print("không có giá trị này");
  }

}

