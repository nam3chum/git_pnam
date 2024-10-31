// Cho một chuỗi và một số nguyên k. Hãy chia chuỗi thành các đoạn k ký tự và đảo ngược mỗi đoạn.
// Nếu đoạn cuối có ít hơn k ký tự thì vẫn đảo ngược.
//ví dụ:
// Input: "abcdefgh" với k = 3
// Output: "cbadefhg"
String reverseSegments(String input, int k) {
  // Khởi tạo một danh sách để chứa các đoạn đã đảo ngược
  List<String> segments = [];

  // Duyệt qua chuỗi với bước nhảy là k
  for (int i = 0; i < input.length; i += k) {
    // Lấy đoạn con từ i đến i + k
    String segment = input.substring(i, (i + k) < input.length ? (i + k) : input.length);
    // Đảo ngược đoạn và thêm vào danh sách
    segments.add(segment.split('').reversed.join());
  }
  // Nối lại các đoạn đã đảo ngược thành chuỗi cuối cùng
  return segments.join('');
}

void main() {
  String input = "abcdefgh";
  int k = 4;

  String result = reverseSegments(input, k);
  print(result);
}
