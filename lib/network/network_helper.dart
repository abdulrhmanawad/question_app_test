import 'package:flutter_app_question/constant/strings_file.dart';
import 'package:flutter_app_question/model/question_model.dart';
import 'package:flutter_app_question/model/response_model.dart';
import 'package:flutter_app_question/network/request.dart';

class QuestionApi {
  QuestionApi._();

  static final QuestionApi _api = QuestionApi._();

  static QuestionApi get api => _api;
  Request? _request;
  Future<void> init() async {
    _request = Request(Base_Url);
  }
  Future<ResponseModel<Questions>> getQuestion({int page=1,int pageSize=10}) async {
    String params = '2.3/questions?page=$page&pagesize=$pageSize&order=desc&sort=activity&site=stackoverflow';
    final response =
    await _request!.request<Questions>(params, cache: true);
    if (response.success) {
      print(response.status_message);
      return response;
    } else {
      print(response.status_message);
      return const ResponseModel();
    }
  }
  Future<ResponseModel<Questions>> getDetails(int id) async {
    String params = '/2.3/questions/$id/answers?order=desc&sort=activity&site=stackoverflow';
    final response =
    await _request!.request<Questions>(params, cache: true);
    if (response.success) {
      return response;
    } else {
      return const ResponseModel();
    }
  }


}