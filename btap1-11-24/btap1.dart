//Bài 1: Phân Tích và Xử Lý JSON
// Yêu cầu: Viết một hàm phân tích một chuỗi JSON chứa danh sách người dùng.
// Tính tuổi trung bình và trả về một danh sách những người dùng từ 18 tuổi trở lên.
import 'dart:convert';
import 'dart:math';
String jsonString = '''
  [
    {"name": "Alice", "age": 17}, 
    {"name": "Bob", "age": 25},
    {"name": "Charlie", "age": 19}
  ]
''';

void tbTuoi(){
  List<dynamic> list= jsonDecode(jsonString);
  List<Map<String, dynamic>> filter= [];
  int totalAge=0;
  for(var i in list)
    {
      int age= i['age'];
      totalAge+=age;
      if(i['age']>18) 
        filter.add(i);
    }
  double tb= totalAge/list.length;
  print(filter);
  print(tb);
  print(list);
}
//Yêu cầu: Tạo một Stream phát các số ngẫu nhiên từ 1 đến 100 và tính trung bình của các số đã phát sau mỗi 5 số.
// Input: Stream của các số ngẫu nhiên.
// Output: Trung bình sau mỗi 5 số, ví dụ: "Trung bình 5 số đầu tiên là: ...".

Stream<int> tb5so() async*{
  int tong = 0 ;
  Stream<int> stream=Stream.periodic(Duration(milliseconds: 500),(value){
   return value+1;
  });
  stream.take(20).listen((data){
    print(data);
    tong+=data;
    if(data%5==0)
      {
        var tb=tong/5;
        print('trung binh 5 so dau tien: $tb');
        tong=0;
      }

  });
}
void main() async{
   await for(var i in tb5so())
   {
      print(i);
   }
}