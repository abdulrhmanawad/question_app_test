import 'package:json_annotation/json_annotation.dart';
part 'question_model.g.dart';

@JsonSerializable()
class Questions{
  final List<QuestionItem>? items;
  final bool? has_more;
  final  quota_max;
  final quota_remaining;
  Questions(this.has_more,this.items,this.quota_max,this.quota_remaining);
  factory Questions.fromJson(Map<String,dynamic> json)=>_$QuestionsFromJson(json);
  Map<String,dynamic> toJson()=>_$QuestionsToJson(this);
}

@JsonSerializable()
class QuestionItem{
final int? question_id;
final List<String>? tags;
final Owner? owner;
final bool? is_answered;
final int ?view_count;
final int ?last_activity_date;
final int ?creation_date ;

final int ?answer_count;
final int ?score;
final String? content_license;
final String ?link;
final String ?title;
QuestionItem(this.creation_date,this.last_activity_date,this.link,this.title,this.answer_count,this.content_license,this.is_answered,this.owner,this.question_id,this.score,this.tags,this.view_count,);
factory QuestionItem.fromJson(Map<String,dynamic> json)=>_$QuestionItemFromJson(json);
Map<String,dynamic> toJson()=>_$QuestionItemToJson(this);



}
@JsonSerializable()
class Owner{
 final int account_id;
 final int reputation;
 final int user_id;
 final String user_type;
 final String profile_image;
 final String display_name;
 final String link;
 Owner(this.account_id,this.link,this.display_name,this.profile_image,this.reputation,this.user_id,this.user_type);
 factory Owner.fromJson(Map<String,dynamic> json)=>_$OwnerFromJson(json);
 Map<String,dynamic> toJson()=>_$OwnerToJson(this);
}
