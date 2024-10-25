import 'package:async/async.dart';

// chạy tu 1-100 mỗi nửa giây, từ 20 trở đi thì chaạy list[a,b,c,d]
List<String> a= ['a','b','c','d'];

// void main() async{
//   Stream.periodic(Duration(milliseconds: 500),(count){
//     if(count>=20){
//       int n = a.length;
//       return a[count%n];
//     }else {
//       return count;
//     }
//   }).take(100).listen((value){
//     print(value);
//   });
// }
//cách 2:

Stream<dynamic> dulieu() async*{
  for(int i =1;i<=100;i++){
    await Future.delayed(Duration(milliseconds: 500));
      if(i<20){
         yield i;
      }
    else {
        for (var init in a) {
          await Future.delayed(Duration(milliseconds: 500));
          yield init;
        }
      }
  }

}

//in 1-50, số nào chia hết cho 3 in ra fizz, 5 thì in ra buzz, cả 2 thì thì fizzbuzz
Stream<String> printNum() async*{
  for(int i = 1;i<=50;i++)
    {
      await Future.delayed(Duration(milliseconds: 500));
      if(i%3==0 &&i%5==0)
        {
          yield 'fizzbuzz';
        }
      else if(i%3==0)
        {
          yield 'fizz';
        }
      else if(i%5==0)
        {
          yield 'buzz';
        }
      else{
        yield i.toString();
      }
    }
}
void main() async{
  // await for(var item in dulieu()){
  //   print(item);
  // }
  await for(var item in printNum())
    {
      print(item);
    }
}