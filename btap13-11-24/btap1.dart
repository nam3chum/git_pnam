// // dọc dữ liệu được lấy ra từ 1 api ở trên mạng , dùng future để đợi nó
//
// void main(){
//   var day = dayOfWeek(10);
//   print("${day.$1}---${day.$2}");
// }

import 'dart:math';

(String, String) dayOfWeek(int day){
  return switch(day){
    2 => ('monday','thứ 2'),
    3 => ('tuesday','thứ 3'),
    4 => ('wednesday','thứ 4'),
    5 => ('thursday','thứ 5'),
    6 => ('friday','thứ 6'),
    7 => ('saturday','thứ 7'),
    1 => ('sunday','chủ nhật'),
  _=>('invalid','ngày không hợp lệ')
  };
}

//Cho một mảng nhị phân nums, trả về độ dài tối đa của một mảng con liền kề có số phần tử 0và1 bằng nhau .
int findMaxxLength(List<int> nums){
  //Khởi tạo các biến ones , zeros và res thành 0. Ngoài ra, tạo một bản đồ diff_index để lưu trữ sự khác biệt giữa số 0 và 1 cùng với chỉ số của chúng.
  // Lặp lại mảng, cập nhật số lượng 0 và 1.
  // Nếu lần đầu tiên phát hiện sự khác biệt giữa số 0 và số 1, hãy lưu trữ sự khác biệt này trong bản đồ diff_index cùng với chỉ mục hiện tại.
  // Nếu gặp lại sự khác biệt tương tự, hãy tính độ dài của mảng con bằng cách trừ chỉ mục được lưu trữ trong bản đồ diff_index khỏi chỉ mục hiện tại. Cập nhật độ dài tối đa nếu cần.
  // Trả về độ dài lớn nhất tìm được.
  int ones= 0, zeros=0,res=0;
  Map<int , int> diff_index= {};
  nums.asMap().forEach((i,n){
    if(n==0)
      {
        zeros+=1;
      }else{
      ones+=1;
    }

    if(!diff_index.containsKey((ones-zeros))){
      diff_index[(ones-zeros)] =i;
    }
    if(ones == zeros)
      {
        res= ones+zeros;

      }else {
      int? index= diff_index[(ones-zeros)];
      res = max(res, (i-index!));
    }
  });
  return res;
}
void main(){
  List<int> a= [0, 1, 1, 1, 1, 1, 0, 1, 0, 1,1,0];
  int res= findMaxxLength(a);
  print(res);
}