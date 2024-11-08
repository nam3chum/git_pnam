//Cho một chuỗi được mã hóa theo định dạng k[encoded_string],
// trong đó k là số lần lặp lại của chuỗi encoded_string
// nằm trong dấu ngoặc vuông, bạn cần trả về chuỗi đã được giải mã.
//ví dụ Input: "3[a]2[bc]"
// Output: "aaabcbc"

String decodeString(String s) {
  List<String> stack = [];
  int i = 0;

  while (i < s.length) {
    if (s[i].contains(RegExp(r'\d'))) {
      // Nếu gặp một số, lấy toàn bộ số
      String numStr = '';
      while (s[i].contains(RegExp(r'\d'))) {
        numStr += s[i];
        i++;
      }
      stack.add(numStr);
    } else if (s[i] == '[') {
      // Gặp dấu mở ngoặc
      stack.add('[');
      i++;
    } else if (s[i] == ']') {
      // Gặp dấu đóng ngoặc
      List<String> decodedStr = [];
      // Pop cho đến khi gặp '['
      while (stack.isNotEmpty && stack.last != '[') {
        decodedStr.insert(0, stack.removeLast());
      }
      // Bỏ dấu '['
      stack.removeLast();
      // Lấy số lần lặp lại
      int repeatCount = int.parse(stack.removeLast());
      // Lặp lại chuỗi
      String repeatedStr = decodedStr.join() * repeatCount;
      // Đưa chuỗi đã lặp vào stack
      stack.add(repeatedStr);
      i++;
    } else {
      // Gặp chữ cái, thêm vào stack
      stack.add(s[i]);
      i++;
    }
  }

  // Ghép các phần trong stack lại thành chuỗi kết quả
  return stack.join();
}

void main() {
  print(decodeString("3[a]2[bc]"));
  print(decodeString("3[a2[c]]"));
  print(decodeString("2[abc]3[cd]ef")); // Output: "abcabccdcdcdef"
}
