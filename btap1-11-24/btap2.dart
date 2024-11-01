// Yêu cầu: Viết một chương trình mô phỏng một hàng chờ tự động,
// trong đó mỗi khách hàng có một yêu cầu riêng (ví dụ: nạp tiền, chuyển tiền).
// Khi xử lý xong một yêu cầu, hiển thị yêu cầu đã xử lý và thời gian chờ.
// Input: Danh sách yêu cầu, mỗi yêu cầu là một Map gồm id, type, amount.
// Output: In ra từng yêu cầu đã xử lý kèm thời gian xử lý.

import 'dart:collection';
import 'dart:math';

void tuDong() async{
  Queue<Map<String,dynamic>> queue = Queue.from(
    [
      {"id": 1, "type": "nạp tiền", "amount": 100},
      {"id": 2, "type": "chuyển tiền", "amount": 250},
      {"id": 3, "type": "xem số dư", "amount": 50},
    ]
  );
  while (queue.isNotEmpty) {
    int delayTime= Random().nextInt(4);
    var request = queue.removeFirst();
    print("Đang xử lý yêu cầu: ${request["id"]}");
    await Future.delayed(Duration(seconds: delayTime));
    print("Loại: ${request["type"]}, Số tiền: ${request["amount"]}, time xử lý: $delayTime giây");
  }
}

//Yêu cầu: Viết một chương trình thực hiện một công việc bất đồng bộ,
// nhưng nếu công việc này không hoàn thành trong 3 giây thì tự động dừng lại và trả về thông báo “Hết thời gian”.
// Output: Nếu công việc hoàn thành trước 3 giây, trả về kết quả. Nếu không, trả về "Hết thời gian".
void xuLyCviec() async{
  Queue<Map<String,dynamic>> queue = Queue.from(
      [
        {"id": 1, "type": "nạp tiền", "amount": 100},
        {"id": 2, "type": "chuyển tiền", "amount": 250},
        {"id": 3, "type": "xem số dư", "amount": 50},
      ]
  );
  while (queue.isNotEmpty) {
    int delayTime= Random().nextInt(10);
    var request = queue.removeFirst();
    print("Đang xử lý yêu cầu: ${request["id"]}");
    await Future.delayed(Duration(seconds: delayTime));
    if(delayTime >=3 ){
      print('time out!');
      continue;
    }
    print("Loại: ${request["type"]}, Số tiền: ${request["amount"]}, time xử lý: $delayTime giây");
  }
}

Future<String> xuLy2() async{
  await Future.delayed(Duration(seconds: 2));
  return 'kết quả';
}
void main() async{
 //tuDong();
  //xuLyCviec();
  try{
    String kqua= await xuLy2().timeout(Duration(seconds: 3));
    print(kqua);
  }catch(e){
    print('hết thời gian');
  }
}