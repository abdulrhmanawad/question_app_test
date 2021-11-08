import 'package:flutter/material.dart';
import 'package:flutter_app_question/model/question_model.dart';
import 'package:flutter_app_question/model/response_model.dart';
import 'package:flutter_app_question/network/network_helper.dart';
import 'package:rxdart/rxdart.dart';

class QusetionRepo {
  double pixels = 0.0;
  int _pageSize=10;
  final QuestionApi _networkHelper = QuestionApi.api;
  final ReplaySubject<ResponseModel<Questions>> _subject = ReplaySubject();
  final ReplaySubject<ScrollNotification> controller = ReplaySubject();

  getPaginationData() async{
    final response=await _networkHelper.getQuestion(pageSize: _pageSize);
    _subject.sink.add(response);
    controller.listen((notification) {
      loadData(notification);
    });
  }

  Future<void> loadData(ScrollNotification? scrollNotification) async {
    if (scrollNotification!.metrics.pixels ==
        scrollNotification.metrics.maxScrollExtent &&
        pixels != scrollNotification.metrics.pixels) {
      pixels = scrollNotification.metrics.pixels;
      _pageSize+=10;
      ResponseModel<Questions> response = await _networkHelper.getQuestion(pageSize: _pageSize);
      _subject.sink.add(response);
    }
  }

  Stream<ResponseModel<Questions>> get stream => _subject.stream;

  Sink<ScrollNotification> get sink => controller.sink;
}