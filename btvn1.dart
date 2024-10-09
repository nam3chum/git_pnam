import 'dart:async';
import 'dart:io';
import 'dart:math';
void bai1(){
//đếm từ 1 - 100 , từ 20 trở đi thay thế các phần tử in ra thành a b c d;
  // Tạo danh sách các phần tử thay thế từ 20 trở đi
  List<String> elements = ['a', 'b', 'c', 'd'];
  int index = 0;
  Stream.periodic(Duration(milliseconds: 500),(a){

    if(a+1>20){
      String element = elements[index % elements.length];
      index++;
      return element;
    }
    else{
      return a+1;
    }
  }).take(100).listen((onData){
    print(onData);
  });
}
void bai2() {
//Đếm số chẵn và lẻ xen kẽ từ 1 đến 50.
// Yêu cầu: In ra các số chẵn từ 1 đến 50, cứ sau 1 giây in ra một số.
// Nếu số đó là số lẻ, thay vì in ra số, in chữ "odd".

  Stream.periodic((Duration(seconds: 1)), (count) {
    if((count+1)%2!=0){
      return 'ood';
    }
    else{
      return count+1;
    }

  }).take(50).listen((value){
    print(value);
  });
}
void bai3() async{
  //Chuỗi Fibonacci có thời gian chờ tăng dần.
  // Yêu cầu: Tạo chuỗi Fibonacci với điều kiện
  // mỗi số tiếp theo sẽ xuất hiện sau một khoảng thời gian tăng dần
  // (ví dụ: số thứ nhất sau 0.5 giây, số thứ hai sau 1 giây, số thứ ba sau 1.5 giây,...).
  //khoi tao day fibonacci
  List<int> fibonacci = [0, 1];
  int index = 2;
  Duration delay = Duration(milliseconds: 500);
  void generateNext() {
    int nextValue = fibonacci[index - 1] + fibonacci[index - 2];
    fibonacci.add(nextValue);
    print(nextValue);
    index++;
  }
  void printFibonacci(Duration timer) async {
    await Future.delayed(timer);
    generateNext();
    printFibonacci(timer + Duration(milliseconds: 500));
  }
 printFibonacci(delay);
}
void bai4(){
  //Đếm ngược từ 100 với điều kiện đặc biệt
  // Yêu cầu: Đếm ngược từ 100 xuống 1, cứ mỗi 0.5 giây in ra một số.
  // Nếu số đó chia hết cho 7 thì thay vì in số, in ra "Lucky!".

  int count = 100;

  Stream.periodic(Duration(milliseconds: 300), (index) {
    if (count < 1) {
      exit(0);
    } else {
      if (count % 7 == 0) {
        print('Lucky!');
      } else {
        print(count);
      }
      count--;
    }
  }).take(count).listen((value){});
}
void bai5(){
//Đếm số theo nhóm và thay đổi nhóm sau mỗi 10 lần
// Yêu cầu: In các số từ 1 đến 100, mỗi 0.3 giây in ra một số.
// Sau mỗi nhóm 10 số, thay vì in ra số tiếp theo, in ra một câu thông báo như: "Next group" rồi tiếp tục đếm số.
  int count = 1;
  Stream.periodic(Duration(milliseconds: 300), (index) {
    if (count > 100) {
      exit(0);
    } else {
      if (count % 10 == 1 && count != 1) {
        print('Next group');
      }
      print(count);
      count++;
    }
  }).take(100).listen((value){});
}
void bai6(){// Chọn phần tử ngẫu nhiên từ danh sách
// Yêu cầu: Bạn có một danh sách các từ ['apple', 'banana', 'cherry', 'date'].
// Cứ mỗi 0.7 giây, chọn ngẫu nhiên một từ từ danh sách và in ra.
// Nếu tổng số lần in ra đạt đến 15, chương trình sẽ dừng.

List<String> fruits = ['apple', 'banana', 'cherry', 'date'];
int count=0;
Random random= Random();

Stream.periodic(Duration(milliseconds: 700),(index){
  if(count>=15){
    exit(0);
  }
  else{
    String randomFruit = fruits[random.nextInt(fruits.length)];
    print(randomFruit);
    count++;
  }

}).take(15).listen((onData){});

}

void main() {
 // bai1();
  //bai2();
 // bai3();
  //bai4();
  //bai5();
  bai6();

}

