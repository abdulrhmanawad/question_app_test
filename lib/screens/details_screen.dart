import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_question/model/question_model.dart';
import 'package:flutter_app_question/model/response_model.dart';
import 'package:flutter_app_question/network/network_helper.dart';
import 'package:flutter_app_question/utilles/config_file.dart';

class DetailsScreen extends StatefulWidget {
 final QuestionItem questionItem;
  const DetailsScreen({Key? key, required this.questionItem}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        margin: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration:  BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: CachedNetworkImageProvider(
                          widget.questionItem.owner!.profile_image)),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Column(
                      children: [
                        Text(
                          widget.questionItem.owner!.display_name,
                          style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .fontSize),
                        ),
                        Text(
                         widget.questionItem.owner!.user_type,
                          style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .fontSize),
                        )
                      ],
                    ),
                  ],
                ),
                RichText(
                  text: TextSpan(
                      text: 'at:',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize:
                              Theme.of(context).textTheme.subtitle1!.fontSize),
                      children: <TextSpan>[
                        TextSpan(
                          text: convertTime(widget.questionItem.creation_date!),
                          style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .fontSize),
                        )
                      ]),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Tags",
                  style: TextStyle(
                      fontSize:
                          Theme.of(context).textTheme.headline6!.fontSize),
                ),
                Wrap(
                    spacing: 5.0,
                    runSpacing: 5.0,
                    children: getKeyWord(widget.questionItem.tags!)),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: Column(
              children: [
                SizedBox(
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Answers",
                        style: TextStyle(
                            fontSize: Theme.of(context)
                                .textTheme
                                .headline6!
                                .fontSize),
                      ),
                      Text(
                        "Answers:${widget.questionItem.answer_count}",
                        style: TextStyle(
                            fontSize: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .fontSize),
                      ),
                    ],
                  ),
                ),

              Expanded(
                child: FutureBuilder<ResponseModel<Questions>>(
                    future: QuestionApi.api.getDetails(widget.questionItem.question_id!),
                    builder: (context,snapShot){
                  if(snapShot.hasData&&snapShot.data!.success){
                    return ListView.builder(
                      shrinkWrap: true,
                        itemCount: snapShot.data!.results!.items!.length,
                        itemBuilder: (context,index){
                         return  Container(child: Center(child: Text(snapShot.data!.results!.items![index].owner!.display_name)));
                        });
                  }else if(snapShot.hasError){
                    return const Center(child:  Text("there is an error in your connection"),);
                  }
                  else{
                    return const Center(child: CircularProgressIndicator(),);
                  }
                }),
              )
              ],
            ),
            ),
          ],
        ),
      ),
    ));
  }
}
