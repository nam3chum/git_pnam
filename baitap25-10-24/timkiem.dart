
//tìm kiếm tuần tự(duyệt lân lượt danh sách để tìm kiếm)
int linearSearch(List<int> list, int target) {
  for (int i = 0; i < list.length; i++) {
    if (list[i] == target) {
      return i;
    }
  }
  return -1; // neu k tim thay
}

//tìm kiếm nhị phân(yêu cầu danh sách được sắp xếp trc)
int binarySearch(List<int> list, int target) {
  int left = 0;
  int right = list.length - 1;

  while (left <= right) {
    int mid = left + (right - left) ~/ 2;

    if (list[mid] == target) {
      return mid;
    } else if (list[mid] < target) {
      left = mid + 1;
    } else {
      right = mid - 1;
    }
  }

  return -1; // Nếu không tìm thấy
}

//tìm kiếm phân tán
void hashSearch() {
  Map<String, String> hashTable = {
    'apple': 'A fruit',
    'banana': 'A yellow fruit',
    'cat': 'An animal'
  };
  String k = 'banana';
  if (hashTable.containsKey(k)) {
    print('${hashTable[k]}');
  } else {
    print('không có $k');
  }
}

void main(){
    hashSearch();
}