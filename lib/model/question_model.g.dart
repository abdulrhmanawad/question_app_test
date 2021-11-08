// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Questions _$QuestionsFromJson(Map<String, dynamic> json) {
  return Questions(
    json['has_more'] as bool?,
    (json['items'] as List<dynamic>?)
        ?.map((e) => QuestionItem.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['quota_max'],
    json['quota_remaining'],
  );
}

Map<String, dynamic> _$QuestionsToJson(Questions instance) => <String, dynamic>{
      'items': instance.items,
      'has_more': instance.has_more,
      'quota_max': instance.quota_max,
      'quota_remaining': instance.quota_remaining,
    };

QuestionItem _$QuestionItemFromJson(Map<String, dynamic> json) {
  return QuestionItem(
    json['creation_date'] as int?,
    json['last_activity_date'] as int?,
    json['link'] as String?,
    json['title'] as String?,
    json['answer_count'] as int?,
    json['content_license'] as String?,
    json['is_answered'] as bool?,
    json['owner'] == null
        ? null
        : Owner.fromJson(json['owner'] as Map<String, dynamic>),
    json['question_id'] as int?,
    json['score'] as int?,
    (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
    json['view_count'] as int?,
  );
}

Map<String, dynamic> _$QuestionItemToJson(QuestionItem instance) =>
    <String, dynamic>{
      'question_id': instance.question_id,
      'tags': instance.tags,
      'owner': instance.owner,
      'is_answered': instance.is_answered,
      'view_count': instance.view_count,
      'last_activity_date': instance.last_activity_date,
      'creation_date': instance.creation_date,
      'answer_count': instance.answer_count,
      'score': instance.score,
      'content_license': instance.content_license,
      'link': instance.link,
      'title': instance.title,
    };

Owner _$OwnerFromJson(Map<String, dynamic> json) {
  return Owner(
    json['account_id'] as int,
    json['link'] as String,
    json['display_name'] as String,
    json['profile_image'] as String,
    json['reputation'] as int,
    json['user_id'] as int,
    json['user_type'] as String,
  );
}

Map<String, dynamic> _$OwnerToJson(Owner instance) => <String, dynamic>{
      'account_id': instance.account_id,
      'reputation': instance.reputation,
      'user_id': instance.user_id,
      'user_type': instance.user_type,
      'profile_image': instance.profile_image,
      'display_name': instance.display_name,
      'link': instance.link,
    };
