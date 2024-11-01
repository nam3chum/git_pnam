//Cho một mảng các số nguyên dương. Hãy tìm số nguyên dương nhỏ nhất
// mà không thể tạo thành từ tổng của một số bất kỳ các phần tử trong mảng.

int minOfNumbers(List<int> arr) {
  arr.sort();
  int result = 1;
  for (var num in arr) {
    if (num > result) break;
    result += num;
  }
  return result;
}
List<int> a= [1,2,3,4,5];
//Cho một chuỗi, hãy đếm số lần xuất hiện của từng ký tự trong chuỗi đó
// và trả về dưới dạng Map<Ký tự, Số lần xuất hiện>.
void demchuoi(){
  String chuoi = 'xin chào hello kitty';
  var charCount = <String,int> {};
  List<String> a= chuoi.split('');
  for(var char in a){
    charCount[char]=(charCount[char]??0)+1;
  }
  print(charCount);
}
void main(){
  print(minOfNumbers(a));
  demchuoi();
}