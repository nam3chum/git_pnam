// Mô tả: Giả sử bạn đang xây dựng một ứng dụng tải dữ liệu từ nhiều nguồn khác nhau (
// API hoặc tệp). Mỗi nguồn dữ liệu sẽ trả về dữ liệu trong thời gian khác nhau,
// vì vậy bạn cần sử dụng Future để quản lý việc tải dữ liệu bất đồng bộ.
// Sau khi dữ liệu từ tất cả các nguồn đã sẵn sàng, bạn sẽ sử dụng Stream để phát ra kết quả cuối cùng
// và xử lý nó trong lớp kế thừa.
// Yêu cầu:
// Tạo một lớp DataSource là lớp cha trừu tượng để
// định nghĩa phương thức fetchData() trả về dữ liệu dưới dạng Future.
// Tạo hai lớp con của DataSource:
// Lớp ApiSource mô phỏng việc lấy dữ liệu từ một API (mất 2 giây).
// Lớp FileSource mô phỏng việc lấy dữ liệu từ một tệp (mất 3 giây).
// Sử dụng Stream để phát ra dữ liệu đã được tải từ cả hai nguồn khi hoàn thành.
// Kết hợp tất cả dữ liệu từ các nguồn và xử lý chúng trong một lớp kế thừa.

abstract class DataSource{
  Future<String> fetchData();
}

class ApiSource extends DataSource{
  @override
  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 2));
    return 'Dữ liệu từ API';
  }

}
class FileSource extends DataSource{
  @override
  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 3));
    return 'Dữ liệu từ Tệp';
  }
}
class DataProcessor {
  final List<DataSource> sources;

  DataProcessor(this.sources);
  Stream<String> joinData() async* {
    for (var source in sources) {
      String data = await source.fetchData();
      yield data;
    }
  }
  Future<String> xuLyData() async {
    StringBuffer kethopDL = StringBuffer();
    await for (var data in joinData()) {
      kethopDL.writeln(data);
    }
    return kethopDL.toString();
  }
}
void main() async {
  List<DataSource> sources = [ApiSource(), FileSource()];
  DataProcessor processor = DataProcessor(sources);
  print('Đang tải ');
  await for (var data in processor.joinData()) {
    print('$data');
  }
  String kethopDL = await processor.xuLyData();
  print('\nDữ liệu kết hợp cuối cùng:');
  print(kethopDL);
}