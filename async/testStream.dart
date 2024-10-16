import 'dart:async';
import 'package:async/async.dart';
Future<void> readFile() async{

}
void main() async {
 // Stream<int> stream = Stream.periodic(Duration(seconds: 1),(count)=>count).take(10);
 // stream.listen((value){
 //  print('value: $value');
 // });

// Tạo hai streams đơn giản
 Stream<int> stream1 = Stream.fromIterable([1, 2, 3]);
 Stream<int> stream2 = Stream.fromIterable([4, 5, 6]);

 // Tạo StreamGroup
 var group = StreamGroup<int>();

 // Thêm các stream vào nhóm
 group.add(stream1);
 group.add(stream2);

 // Đóng nhóm (không thể thêm thêm stream nào nữa)
 group.close();

 // Lắng nghe stream tổng hợp
 await for (var value in group.stream) {
  print(value);
 }
}
