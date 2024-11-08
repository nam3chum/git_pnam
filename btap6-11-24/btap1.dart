// Cho một danh sách các số nguyên, tìm dãy con liên tiếp đơn điệu dài nhất trong danh sách đó (dãy tăng hoặc giảm).
//Ví dụ:
// Input:
// Output: [1, 4, 5, 6]
List<int> arr = [1, 2, 2, 3, 1, 4, 5, 6];

void dondieu() {
  List<List<int>> a = [];
  List<int> b = [];

  for (int i = 0; i < arr.length; i++) {
    b.add(arr[i]);
    if (i == arr.length - 1 || arr[i + 1] < arr[i]) {
      a.add(b.toList()); // Thêm dãy con vào danh sách a // nếu cho b trực tiếp vào thì nó sẽ không hiện ra gì vì ngay sau đó b đã bị xoá
      b.clear();
    }

  }
  List<int> c= a.reduce((list1,list2)=>list1.length >= list2.length ? list1:list2);
 // List<List<int>> d = a.where((element) => element == c.length).toList();
  print(a);
  print(c);
}

//Yêu cầu: Viết một hàm nhận vào một danh sách các ký tự và số nguyên k.
// Tạo ra tất cả các tổ hợp có độ dài k từ danh sách này mà
// không chứa các ký tự lặp lại và phải sắp xếp theo thứ tự từ điển.
// Ví dụ:
// •	Input: ['a', 'b', 'c', 'd'], k = 2
// •	Output: [ab, ac, ad, bc, bd, cd]

List<String> ketHopTu(List<String> chars, int k) {
  List<String> result = [];
  void congChuoi(String a, int b) {

    if (a.length == k) {
      result.add(a);
      return;
    }
    // Duyệt qua các ký tự từ vị trí start để đảm bảo thứ tự từ điển
    for (int i = b; i < chars.length; i++) {
      congChuoi(a + chars[i], i + 1);
    }
  }
  // Bắt đầu đệ quy với chuỗi rỗng và vị trí 0
  congChuoi('', 0);
  return result;
}

void main() {
  List<String> char = ['a', 'b', 'c', 'd'];
  int k = 3;
  List<String> a = ketHopTu(char, k);
  print(a);
}
