import 'dart:math';

String largestNumber(List<int> nums) {
  // Chuyển các số thành chuỗi
  List<String> strNums = nums.map((num) => num.toString()).toList();

  // Sắp xếp các chuỗi với hàm so sánh tùy chỉnh
  strNums.sort((a, b) {
    // So sánh hai chuỗi "a" và "b" bằng cách so sánh "a+b" và "b+a"
    return (b + a).compareTo(a + b);
  });

  // Nếu chuỗi đầu tiên là "0", trả về "0" (trường hợp tất cả các số đều là 0)
  if (strNums[0] == '0') {
    return '0';
  }

  // Ghép tất cả các chuỗi lại với nhau và trả về kết quả
  return strNums.join('');
}

void main() {
  List<int> nums = [0, 30, 34, 5, 9];
  print(largestNumber(nums));  // Output: "9534330"
}
