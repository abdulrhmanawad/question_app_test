import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_question/bloc/network_repo.dart';
import 'package:flutter_app_question/model/question_model.dart';
import 'package:flutter_app_question/model/response_model.dart';
import 'package:meta/meta.dart';

part 'question_event.dart';
part 'question_state.dart';

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  QusetionRepo qusetionRepo;
  QuestionBloc(this.qusetionRepo) : super(const QuestionInitial());

  @override
  Stream<QuestionState> mapEventToState(
      QuestionEvent event,
      ) async* {
    if(event is LoadQuestion){
      yield QuestionLoading();
      await qusetionRepo.getPaginationData();
      yield QuestionLoaded(qusetionRepo.stream);
    }
    else if(event is LoadMoreQuestion){
      qusetionRepo.sink.add(event.scrollNotification);
    }
    else{
      yield const QuestionError("There is A Problem");
    }
  }
}
