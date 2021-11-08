part of 'question_bloc.dart';

@immutable
abstract class QuestionEvent {
  const QuestionEvent();
}
class LoadQuestion extends QuestionEvent{
  const LoadQuestion();
}
class LoadMoreQuestion extends QuestionEvent{
  final ScrollNotification scrollNotification;
  const LoadMoreQuestion(this.scrollNotification);
}
