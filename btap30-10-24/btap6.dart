
double averageWaitingTime(List<Map<String, int>> customers) {
  int totalWaitTime = 0; // Tổng thời gian chờ
  int currentTime = 0; // Thời gian hiện tại

  for (var customer in customers) {
    int arrivalTime = customer['arrivalTime']!;
    int serviceTime = customer['serviceTime']!;

    // Nếu thời gian hiện tại nhỏ hơn thời gian đến, cập nhật thời gian hiện tại
    if (currentTime < arrivalTime) {
      currentTime = arrivalTime;
    }

    // Thời gian chờ của khách hàng này
    int waitTime = currentTime - arrivalTime;
    totalWaitTime += waitTime;

    // Cập nhật thời gian hiện tại sau khi phục vụ
    currentTime += serviceTime;
  }

  // Tính thời gian trung bình
  return totalWaitTime / customers.length;
}

void main() {
  List<Map<String, int>> customers = [
    {'arrivalTime': 0, 'serviceTime': 3},
    {'arrivalTime': 1, 'serviceTime': 9},
    {'arrivalTime': 2, 'serviceTime': 6},
    {'arrivalTime': 3, 'serviceTime': 1},
  ];

  double averageWaitTime = averageWaitingTime(customers);
  print("Thời gian trung bình chờ: ${averageWaitTime.toStringAsFixed(2)}");
}
