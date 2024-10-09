
import 'dart:math';


class UserStatus{
  final String userId;
  final String status;

  UserStatus(this.userId, this.status);
}

Stream<UserStatus> userStatusStream(List<String> userid) async*{
  final statuses = {for (var id in userid) id: 'offine'};
  final random = Random();

  while (true) {
    await Future.delayed(Duration(seconds: 3));
    // Randomly thay đổi trạng thái của một người dùng
    var userId = userid[random.nextInt(userid.length)];
    var newStatus = statuses[userId] == 'offline' ? 'online' : 'offline';
    statuses[userId] = newStatus;
    yield UserStatus(userId, newStatus);
  }

}
  void main() async {
    List<String> userIds = ['user1', 'user2', 'user3'];

    Stream<UserStatus> stream = userStatusStream(userIds).asBroadcastStream();

    // Listener 1
    stream.listen((status) {
      print('${status.userId} is now ${status.status}');
    });

    // Listener 2
    stream.listen((status) {
      if (status.status == 'online') {
        print('Welcome ${status.userId}!');
      } else {
        print('${status.userId} has gone offline.');
      }
    });

    // Giữ chương trình chạy trong 15 giây
    await Future.delayed(Duration(seconds: 15));
    print('Stopped tracking user statuses.');
  }