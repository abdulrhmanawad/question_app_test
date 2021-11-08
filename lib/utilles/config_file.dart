import 'package:flutter_app_question/widget/tag_widget.dart';
import 'package:intl/intl.dart';
String  convertTime(int time){
  DateTime dateTime=DateTime.fromMillisecondsSinceEpoch(time*1000);

  String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
  return formattedDate;
}

List<Tag> getKeyWord(List<String> tags){
  late List<Tag> tagsKeyword=[];
  for(var keyword in tags){
    tagsKeyword.add(Tag(name: keyword,));
  }
  return tagsKeyword;
}