// Yêu cầu: Tìm chuỗi con dài nhất trong một chuỗi mà không có ký tự nào lặp lại.
// Input: "abcabcbb"
// Output: "abc" với độ dài là 3
String longestUniqueSubstring(String s) {
  Map<String, int> seen = {}; // Map lưu vị trí cuối cùng của ký tự
  int start = 0, maxLength = 0;
  String longestSub = '';

  for (int end = 0; end < s.length; end++) {
    String char = s[end];
    // Nếu ký tự đã xuất hiện trước đó trong phạm vi hiện tại
    if (seen.containsKey(char) && seen[char]! >= start) {
      start = seen[char]! + 1; // Cập nhật vị trí bắt đầu
    }
    seen[char] = end; // Lưu vị trí hiện tại của ký tự
    if (end - start + 1 > maxLength) {
      maxLength = end - start + 1;
      longestSub = s.substring(start, end + 1);
    }
  }
  return longestSub; // Chuỗi con dài nhất không chứa ký tự lặp lại
}
String reverseWords(String s) {
  List<String> words = s.split(' '); // Tách chuỗi thành danh sách từ
  List<String> reversedWords = words.map((word) => String.fromCharCodes(word.runes.toList().reversed)).toList();
  return reversedWords.join(' '); // Ghép các từ đã đảo ngược thành chuỗi kết quả
}



void main() {
  //print(longestUniqueSubstring("abcdaebb")); // Kết quả: "abc"

  print(reverseWords('hello world'));
}
