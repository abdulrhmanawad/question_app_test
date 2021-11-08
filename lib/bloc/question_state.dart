part of 'question_bloc.dart';

@immutable
abstract class QuestionState {
  const QuestionState();
}

class QuestionInitial extends QuestionState {
  const QuestionInitial();
}

class QuestionLoading extends QuestionState{}
class QuestionLoaded extends QuestionState{
  final Stream<ResponseModel<Questions>> questions;
  const QuestionLoaded(this.questions);
}
class QuestionError extends QuestionState{
  final String message;
  const QuestionError(this.message);
}
