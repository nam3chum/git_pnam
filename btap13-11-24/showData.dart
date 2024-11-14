
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:projecttraining/btap13-11-24/story.dart';

Future<void> showData() async {
  List<String> type =[];
  final url = Uri.parse(
      'https://raw.githubusercontent.com/nhocconsr/vbook-ext/master/plugin.json');
  try{
    final response = await http.get(url);
    if (response.statusCode == 200)
  {
    final Map<String, dynamic> jsonData = jsonDecode(response.body);
    final plugins = (jsonData['data'] as List).map((item)=>
     Story.fromJson(item)).toList();
    for(var item in plugins)
      {
        if(!type.any((e)=>e == item.type) && item.type!='') {
          type.add(item.type);
        }
      }
  }else {
      throw 'lỗi';
    }
  }catch(e){
    print('lỗi $e');
  }
  print(type.toList());
}

void main(){
  showData();
}