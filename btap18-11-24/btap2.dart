// Cho một mảng các khoảng thời gian intervalstrong đó , trả về số khoảng thời gian tối thiểu
// bạn cần loại bỏ để các khoảng thời gian còn lại không chồng lấn nhau .intervals[i] = [starti, endi]
// Lưu ý rằng các khoảng chỉ tiếp xúc tại một điểm thì không chồng lấn . Ví dụ, [1, 2]và [2, 3]không chồng lấn.

int eraseOverlapIntervals(List<List<int>> intervals) {
  intervals.sort((a, b) => a[1].compareTo(b[1]));
  var ans = 0;
  var prevInterval = intervals.first;
  for (var interval in intervals) {
    final start = interval.first;
    if (start < prevInterval.last) {
      ans += 1;
    } else {
      prevInterval = interval;
    }
  }

  return ans - 1;
}


void main(){
  List<List<int>> a = [[-52,31],[-73,-26],[82,97],[-65,-11],[-62,-49],[95,99],[58,95],[-31,49],[66,98],[-63,2],[30,47],[-40,-26]];
  print(eraseOverlapIntervals(a));
}