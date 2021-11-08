class ResponseModel<T>{
  final String? status_message;
  final int? status_code;
  final  T ?results;
  const ResponseModel({ this.results, this.status_message, this.status_code});
  bool get success=>[200,201].contains(status_code);

}