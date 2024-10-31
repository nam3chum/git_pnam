import 'dart:async';
import 'dart:math';

Stream<double> donhietdo() async* {
  final random = Random();//tạo 1 biến random để random + vào nhiệt độ
  while (true) {
    await Future.delayed(Duration(seconds: 1));
    yield 20 + random.nextDouble() * 15; // Nhiệt độ từ 20 đến 35 độ
  }
}

void main() async {
  //tạo ra 1 vòng lặp để nhận dữ liệu từ Stream và thoong báo ra nó
  //nếu mà nhiệt độ quá 32 độ c thì sẽ cảnh báo nhiệt độ

  await for(var i in donhietdo())
    {
      print('nhiệt độ gần nhât: ${i.toStringAsFixed(2)} độ C');
      if(i>=32)
        {
          print('nhiệt độ bị quá tải');
          break;
        }
    }
    print('dừng ghi lại nhiệt độ');
}
