// Tìm tất cả các chuỗi con đối xứng (palindromic substring) trong một chuỗi và sắp xếp chúng theo độ dài giảm dần.
// Ví dụ:
// •	Input: "banana"
// •	Output: ["anana", "nan", "ana", "n", "a"]
List<String> chuoiDoiXung(String s) {
  Set<String> listDoiXung = {};
  bool checkDoiXung(String str) {
    int left = 0;
    int right = str.length - 1;
    while (left < right) {
      if (str[left] != str[right]) return false;
      left++;
      right--;
    }
    return true;
  }
  for (int start = 0; start < s.length; start++) {
    for (int end = start + 1; end <= s.length; end++) {
      String chuoicon = s.substring(start, end);
      if (checkDoiXung(chuoicon)) {
        listDoiXung.add(chuoicon);
      }
    }
  }

  List<String> result = listDoiXung.toList();
  result.sort((a, b) => b.length.compareTo(a.length));
  return result;
}
// Yêu cầu: Cho một số nguyên n, tìm tất cả các cách phân tích n thành tổng của các số nguyên dương
// sao cho mỗi cách là một tập hợp khác nhau.
// Ví dụ:
// •	Input: 4
// •	Output: [[4], [3, 1], [2, 2], [2, 1, 1], [1, 1, 1, 1]]

void partition(int n, List<int> current, List<List<int>> result) {
  if (n == 0) {
    result.add(List.from(current));
    return;
  }
  for (int i = (current.isEmpty ? n : current.last); i >= 1; i--) {
    if (i <= n) {
      current.add(i);
      partition(n - i, current, result);
      current.removeLast();
    }
  }
}

List<List<int>> findPartitions(int n) {
  List<List<int>> result = [];
  partition(n, [], result);
  return result;
}


void main() {
  // String a = "banana";
  // print(chuoiDoiXung(a));
  List<List<int>> partitions = findPartitions(5);
  print(partitions);
}
