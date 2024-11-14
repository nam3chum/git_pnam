// Cho một mảng chuỗi wordsvà một số nguyên k, trả về chuỗi kxuất hiện thường xuyên nhất .
// Trả về câu trả lời được sắp xếp theo tần suất từ ​​cao nhất đến thấp nhất.
// Sắp xếp các từ có cùng tần suất theo thứ tự từ điển của chúng
import 'dart:collection';

List<String> topKFrequent(List<String> words, int k) {
  // Đếm tần suất xuất hiện của từng từ
  Map<String, int> frequencyMap = {};
  for (String word in words) {
    frequencyMap[word] = (frequencyMap[word] ?? 0) + 1;
  }

  // Sắp xếp các từ dựa trên tần suất và thứ tự từ điển
  List<String> sortedWords = frequencyMap.keys.toList()
    ..sort((a, b) {
      int freqCompare = frequencyMap[b]!.compareTo(frequencyMap[a]!);
      return freqCompare != 0 ? freqCompare : a.compareTo(b);
    });

  // Lấy k từ xuất hiện nhiều nhất
  return sortedWords.take(k).toList();
}

void main() {
  List<String> words = ["apple", "banana", "apple", "orange", "banana", "apple"];
  int k = 2;
  print(topKFrequent(words, k)); // Output: ['apple', 'banana']
}
