import 'dart:io';

// Hàm tìm kiếm nhị phân
int binarySearch(List<int> sortedList, int target) {
  int left = 0;
  int right = sortedList.length - 1;

  while (left <= right) {
    int mid = (left + right) ~/ 2; // Lấy chỉ số giữa (~/ là chia lấy phần nguyên)

    if (sortedList[mid] == target) {
      return mid; // Tìm thấy, trả về chỉ số
    } else if (sortedList[mid] < target) {
      left = mid + 1; // Tìm trong nửa phải
    } else {
      right = mid - 1; // Tìm trong nửa trái
    }
  }

  return -1; // Trả về -1 nếu không tìm thấy
}

void main() async{

  final file = File('E:\\Android_NC\\demo\\lib\\all_numbers (1).txt');
  final numberStr= await file.readAsString();
  List<int> sortedList = numberStr!.split(' ').map(int.parse).toList();

  // Nhập số cần tìm
  print('Nhập số cần tìm:');
  int? target = int.parse(stdin.readLineSync()!);

  // Gọi hàm tìm kiếm nhị phân
  int result = binarySearch(sortedList, target);

  if (result != -1) {
    print('Số $target được tìm thấy tại vị trí $result.');
  } else {
    print('Số $target không tồn tại trong danh sách.');
  }
}
