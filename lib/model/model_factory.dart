import 'package:flutter_app_question/model/question_model.dart';

class ModelFactory {
  static T generate<T>(json) {
    switch (T.toString()) {
      case 'Questions':
        return Questions.fromJson(json) as T;
      default:
        return json;
    }}}