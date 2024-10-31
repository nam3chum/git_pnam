// Tạo một Stream
import 'dart:async';
import 'package:async/async.dart';
void soNguyenTangDan(){
  //Tạo một Stream sử dụng Stream.periodic(), phát ra một số nguyên tăng dần mỗi giây.
  // Tạo một stream phát ra số từ 0 đến 9 với độ trễ 1 giây.
  // In ra mỗi giá trị khi nó được phát ra.
  // Lắng nghe Stream
  Stream<int> periodic = Stream.periodic(Duration(seconds: 1),(count) => count).take(10);//giới hạn 10 lần count
  periodic.listen((value){
    print('dữ liệu được nhận : $value');
  });
}

void streamcontroller(){
  //Tạo một StreamController để quản lý một stream mà bạn có thể phát hành dữ liệu thủ công
  //Lắng nghe và in ra dữ liệu khi stream phát hành.
  StreamController<int> controller= StreamController<int>();
  controller.stream.listen((data){
   print('dữ liệu đã nhận: $data');
  });

  controller.add(1);
  controller.add(2);

  controller.close();

}
void kethopStream(){
  //kết hợp 2 stream bằng cách sử dụng stream.zip()
  Stream<int> streamA = Stream.periodic(Duration(seconds: 1),(count) => count+1).take(5);
  Stream<String> streamB= Stream.fromIterable(['a','b','c','d']);
  StreamZip([streamA,streamB]).listen((value){
    print('đã nhận được dữ liệu streamA: ${value[0]} và ${value[1]}');
  });
}
Stream<int> asyncStream() async*{
  for(int i =0;i<5;i++){
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}

//tạo 1 Stream xử lý lỗi

void StreamError(){
  Stream<int> numberstream= Stream<int>.fromIterable([1, 2, 3, 0, 4, 5]);
  numberstream.listen((value){
    if(value == 0)
      {
        throw Exception('Error: number is 0');
      }
    else {
      print('number is: $value');
    }
  },
    onError: (error){
    print('error catch: $error');
    }
  );
}
void transform(){
  StreamTransformer<int, String> transformer =
  StreamTransformer.fromHandlers(handleData: (int data, sink) {
    sink.add('Number: $data');
  });

  Stream<int> countStream = Stream.fromIterable([1, 2, 3]);

    countStream.transform(transformer).listen((data) => print(data));


}
void main() async {
  //soNguyenTangDan();
  //streamcontroller();
  //kethopStream();
  // await for(var value in asyncStream()){
  //   print('value: $value');
  // }
  transform();
  //StreamError();
}