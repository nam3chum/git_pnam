import 'dart:async';

// Hàm này sẽ nhận vào một stream và phát hiện các xu hướng tăng/giảm
void detectTrends(Stream<int> stream) {
  List<int> buffer = []; // Danh sách lưu trữ các phần tử hiện tại

  stream.listen((data) {
    buffer.add(data); // Thêm phần tử mới vào danh sách

    // Chỉ kiểm tra khi có ít nhất 3 phần tử
    if (buffer.length >= 3) {
      int last = buffer.length - 1;

      // Kiểm tra xu hướng tăng dần của 3 số cuối
      if (buffer[last - 2] < buffer[last - 1] && buffer[last - 1] < buffer[last]) {
        print("Phát hiện xu hướng tăng: ${buffer.sublist(last - 2)}");
        buffer.removeRange(last - 2, last + 1); // Xóa 3 phần tử vừa kiểm tra

        // Kiểm tra xu hướng giảm dần của 3 số cuối
      } else if (buffer[last - 2] > buffer[last - 1] && buffer[last - 1] > buffer[last]) {
        print("Phát hiện xu hướng giảm: ${buffer.sublist(last - 2)}");
        buffer.removeRange(last - 2, last + 1); // Xóa 3 phần tử vừa kiểm tra
      }
    }
  }, onDone: () {
    print("Kết thúc Stream.");
  });
}

void main() {
  // Tạo một Stream ví dụ
  Stream<int> numberStream = Stream.fromIterable([5, 7, 9, 4, 3, 2, 8, 1, 0, -1]);

  // Phát hiện xu hướng trong Stream
  detectTrends(numberStream);
}
