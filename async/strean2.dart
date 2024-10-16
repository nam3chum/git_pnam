import 'dart:async';

Stream<int> numberStream = Stream.periodic(Duration(seconds: 1), (x) => x).take(5);

void main() async {
  StreamSubscription<int> subscription = numberStream.listen(
          (data) {
        print('Data received: $data');
      },
      onDone: () {
        print('Stream completed!');
      }
  );

  // Tạm dừng sau 2 giây
  await Future.delayed(Duration(seconds: 2), () {
    subscription.pause();
    print('Stream paused');
  });

  // Tiếp tục sau 4 giây
  await Future.delayed(Duration(seconds: 4), () {
    subscription.resume();
    print('Stream resumed');
  });

  // Hủy sau 6 giây
  Future.delayed(Duration(seconds: 6), () {
    subscription.cancel();
    print('Stream cancelled');
  });
}
