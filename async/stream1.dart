import 'dart:isolate';

void waitCounter3(SendPort sendPort)
{
  var counting = 0;
  for (var i = 1; i <= 1000000000; i++) {
    counting = i;
  }
  sendPort.send('$counting! Ready or not , here i Come');
}
void main() async{
  print("i'm counting...");
  final receiverPorrt = ReceivePort();
  final isolate = await Isolate.spawn(waitCounter3,receiverPorrt.sendPort);

  receiverPorrt.listen((message){
    print(message);
    receiverPorrt.close();
    isolate.kill();
  });

  print('iam waiting');

}