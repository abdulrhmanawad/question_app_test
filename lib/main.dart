import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app_question/bloc/network_repo.dart';
import 'package:flutter_app_question/bloc/question_bloc.dart';
import 'package:flutter_app_question/model/question_model.dart';
import 'package:flutter_app_question/model/response_model.dart';
import 'package:flutter_app_question/network/network_helper.dart';
import 'package:flutter_app_question/screens/question_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
create: (context)=>QuestionBloc(QusetionRepo()),
          child: const MyHomePage(title:"Question App")),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  QuestionApi networkHelper = QuestionApi.api;
  List<int> maxExtend=[];
  late QusetionRepo qusetionRepo;
  late List<QuestionItem> questions;
  void _init()async {
    networkHelper.init();
    maxExtend.addAll(List.generate(5000, (index) => index));
    questions=[];
  }
  bool _onNotification(ScrollNotification scrollinfo){
    if(scrollinfo is ScrollEndNotification){
      BlocProvider.of<QuestionBloc>(context).add(LoadMoreQuestion(scrollinfo));
    }
    return false ;
  }
  @override
  void initState() {
    _init();

    BlocProvider.of<QuestionBloc>(context).add(const LoadQuestion());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:BlocConsumer<QuestionBloc,QuestionState>(
        key: const ValueKey("BlocConsumer"),
        listener: (context,state){
          if(state is QuestionError){
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("There is an Error dude !!")));
          }
        },
        builder: (context,state){

          if(state is QuestionLoading){
            return const Center(child:CircularProgressIndicator(),);
          }
          else if (state is QuestionLoaded){
            return NotificationListener<ScrollNotification>(
                onNotification: (notification){
                  return _onNotification(notification);
                },
                child:StreamBuilder<ResponseModel<Questions>>(
                  stream: state.questions,
                  builder: (context,snapshot){
                    if(snapshot.hasData&&snapshot.data?.results?.items!=null){
                      questions.addAll(snapshot.data!.results!.items!);
                      return ListView.builder(
                          padding: const EdgeInsets.all(16.0),
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemCount: (maxExtend.length>questions.length)?questions.length+1:questions.length,
                          itemBuilder:(context,index){
                            if(index==questions.length){
                              return  Container(
                                margin: const EdgeInsets.all(8.0),
                                child:const  Center(child: CircularProgressIndicator()),
                              );
                            }
                            else{
                           return QuestionCard(questions[index]);
                            }
                          });
                    }
                    else if(snapshot.hasError){
                      return const Center(child: Text("There is an Error Dud!!"),);
                    }
                    else{
                      return const Center(child:CircularProgressIndicator());
                    }
                  },
                ));
          }
          else{
            return const Center(child: Text("There is An error of your stateManagement"),);
          }

        },
      )
    );
  }
}
