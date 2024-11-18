import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';

class Story {
  String name, author, path, source, icon, description, type, locale;
  int version;

  Story({
    required this.name,
    required this.author,
    required this.path,
    required this.source,
    required this.icon,
    required this.description,
    required this.type,
    required this.locale,
    required this.version,
  });

  factory Story.fromJson(Map<String, dynamic> json) {
    return Story(
      name: json['name'] ?? 'unknown name',
      author: json['author'] ?? 'unknown author',
      path: json['path'] ?? 'unknown path',
      source: json['source'] ?? '',
      icon: json['icon'] ?? '',
      description: json['description'] ?? '',
      type: json['type'] ?? '',
      locale: json['locale'] ?? '',
      version: json['version'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'author': author,
      'path': path,
      'source': source,
      'icon': icon,
      'description': description,
      'type': type,
      'locale': locale,
      'version': version,
    };
  }
  @override
  String toString() {
    // TODO: implement toString
    return 'name: $name - type: $type';
  }
}

class StoryManager {
  List<Story> stories = [];

  Future<void> fetchData() async {
    final url = Uri.parse('https://raw.githubusercontent.com/nhocconsr/vbook-ext/master/plugin.json');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body) as Map<String, dynamic>;
        stories = (jsonData['data'] as List).map((item) => Story.fromJson(item)).toList();
        print('Dữ liệu đã tải thành công.');
      } else {
        print('Lỗi khi tải dữ liệu: ${response.statusCode}');
      }
    } catch (e) {
      print('Lỗi: $e');
    }
  }

  void displayData() {
    for (var story in stories) {
      print('Name: ${story.name}');
      print('Author: ${story.author}');
      print('Type: ${story.type}');
      print('Version: ${story.version}');
      print('Locale: ${story.locale}');
      print('----------------------------');
    }
  }

  void searchByName(String name) {
    var results = stories.where((story) => story.name.toLowerCase().contains(name.toLowerCase())).toList();
    print('Tìm kiếm kết quả:');
    for(var story in results)
      {
        print(story);
      }
  }

  void filterByAuthor(String author) {
    final filteredStories = stories.where((story) => story.author.toLowerCase() == author.toLowerCase()).toList();
    if (filteredStories.isEmpty) {
      print('Không tìm thấy truyện của tác giả: $author');
    } else {
      for (var story in filteredStories) {
        print('Name: ${story.name} - Author: ${story.author}');
      }
    }
  }

  void filterByLocale(String locale) {
    final filteredStories = stories.where((story) => story.locale.toLowerCase() == locale.toLowerCase()).toList();
    if (filteredStories.isEmpty) {
      print('Không tìm thấy truyện với ngôn ngữ: $locale');
    } else {
      for (var story in filteredStories) {
        print('Name: ${story.name} - Locale: ${story.locale}');
      }
    }
  }

  void addStory(Story story) {
    stories.add(story);
    print('Đã thêm truyện mới: ${story.name}');
  }

  void deleteStory(String name) {
    stories.removeWhere((story) => story.name.toLowerCase() == name.toLowerCase());
    print('Đã xóa truyện: $name');
  }

  void countTypes() {
    final typeCounts = <String, int>{};
    for (var story in stories) {
      typeCounts[story.type] = (typeCounts[story.type] ?? 0) + 1;
    }
    print('Thống kê các loại truyện:');
    typeCounts.forEach((type, count) {
      print('$type: $count truyện');
    });
  }

  void highestVersion() {
    final maxVersionStory = stories.reduce((curr, next) => curr.version > next.version ? curr : next);
    print('Truyện có phiên bản cao nhất: ${maxVersionStory.name} với phiên bản ${maxVersionStory.version}');
  }

  void exportToJson(String path) {
    try {
      final file = File(path);
      final json = jsonEncode(stories.map((story) => story.toJson()).toList());
      file.writeAsStringSync(json);
      print('Dữ liệu đã được xuất ra file $path');
    }
    catch (e) {
      print('lỗi $e');
    }
  }
  void importFromJson(String path) {
    final file = File(path);
    if (file.existsSync()) {
      final jsonData = jsonDecode(file.readAsStringSync()) as List;
      stories = jsonData.map((data) => Story.fromJson(data)).toList();
      print('Dữ liệu đã được đọc từ file $path');
    } else {
      print('File $path không tồn tại.');
    }
  }

  Future<void> generatePdfReport() async {
    final pdf = pw.Document();
    pdf.addPage(
      pw.MultiPage(
        header: (context) => pw.Text('Báo cáo danh sách truyện', style: pw.TextStyle(fontSize: 18)),
        footer: (context) => pw.Text('Trang ${context.pageNumber}', style: pw.TextStyle(fontSize: 12)),
        build: (context) => stories.map((story) {
          return pw.Container(
            margin: pw.EdgeInsets.only(bottom: 10),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text('Tên: ${story.name}', style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold)),
                pw.Text('Tác giả: ${story.author}'),
                pw.Text('Phiên bản: ${story.version}'),
                pw.Text('Ngôn ngữ: ${story.locale}'),
                pw.Divider(),
              ],
            ),
          );
        }).toList(),
      ),
    );

    final file = File('E:\\report.pdf');
    await file.writeAsBytes(await pdf.save());
    print('Báo cáo đã được lưu thành công.');
  }
}

void main() async {
  StoryManager storyManager = StoryManager();
  await storyManager.fetchData();


  while (true) {
    print('--- Menu Chương Trình ---');
    print('1. Hiển thị tất cả truyện');
    print('2. Tìm kiếm truyện theo tên');
    print('3. Lọc truyện theo tác giả');
    print('4. Lọc truyện theo ngôn ngữ');
    print('5. Thêm truyện mới');
    print('6. Xóa truyện theo tên');
    print('7. Thống kê loại truyện');
    print('8. Thống kê phiên bản cao nhất');
    print('9. Xuất dữ liệu ra file JSON');
    print('10. Đọc dữ liệu từ file JSON');
    print('11. Tạo báo cáo PDF');
    print('0. Thoát');
    print('Chọn một lựa chọn: ');

    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        storyManager.displayData();
        break;
      case '2':
        print('Nhập tên cần tìm:');
        String? searchName = stdin.readLineSync();
        if (searchName != null) {
          storyManager.searchByName(searchName);
        }
        break;
      case '3':
        print('Nhập tên tác giả cần lọc:');
        String? author = stdin.readLineSync();
        if (author != null) {
          storyManager.filterByAuthor(author);
        }
        break;
      case '4':
        print('Nhập ngôn ngữ cần lọc:');
        String? locale = stdin.readLineSync();
        if (locale != null) {
          storyManager.filterByLocale(locale);
        }
        break;
      case '5':
      // Thêm chi tiết truyện mới từ người dùng
        print('Nhập thông tin truyện mới:');
        print('Tên truyện:');
        String? name = stdin.readLineSync() ?? 'unknown';
        print('Tác giả:');
        String? author = stdin.readLineSync() ?? 'unknown';
        print('Đường dẫn:');
        String? path = stdin.readLineSync() ?? '';
        print('Nguồn:');
        String? source = stdin.readLineSync() ?? '';
        print('Icon:');
        String? icon = stdin.readLineSync() ?? '';
        print('Mô tả:');
        String? description = stdin.readLineSync() ?? '';
        print('Thể loại:');
        String? type = stdin.readLineSync() ?? '';
        print('Ngôn ngữ:');
        String? locale = stdin.readLineSync() ?? '';
        print('Phiên bản:');
        int? version = int.tryParse(stdin.readLineSync() ?? '0') ?? 0;

        storyManager.addStory(Story(
          name: name,
          author: author,
          path: path,
          source: source,
          icon: icon,
          description: description,
          type: type,
          locale: locale,
          version: version,
        ));
        break;
      case '6':
        print('Nhập tên truyện cần xóa:');
        String? nameToDelete = stdin.readLineSync();
        if (nameToDelete != null) {
          storyManager.deleteStory(nameToDelete);
        }
        break;
      case '7':
        storyManager.countTypes();
        break;
      case '8':
        storyManager.highestVersion();
        break;
      case '9':
        print('Nhập đường dẫn để lưu file JSON:');
        String? path = stdin.readLineSync() ?? 'data.json';
        storyManager.exportToJson(path);
        break;
      case '10':
        print('Nhập đường dẫn để đọc file JSON:');
        String? path = stdin.readLineSync() ?? 'data.json';
        storyManager.importFromJson(path);
        break;
      case '11':
        await storyManager.generatePdfReport();
        break;
      case '0':
        print('Thoát chương trình.');
        exit(0);
      default:
        print('Lựa chọn không hợp lệ, vui lòng thử lại.');
    }

    print('\nNhấn Enter để tiếp tục...');
    stdin.readLineSync();
  }
}
