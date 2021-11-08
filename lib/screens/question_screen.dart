
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_question/model/question_model.dart';
import 'package:flutter_app_question/screens/details_screen.dart';
import 'package:flutter_app_question/utilles/config_file.dart';

class QuestionCard extends StatelessWidget {
final QuestionItem questionItem;
   const QuestionCard(this.questionItem, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
       Navigator.push(context,MaterialPageRoute(builder: (context){
         return   DetailsScreen(questionItem: questionItem,);
       }) );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          borderRadius: BorderRadius.circular(8.0),
          elevation: 3.0,
          child: Container(
            margin: const  EdgeInsets.all(8.0),
            padding: const  EdgeInsets.all(8.0),
            width: MediaQuery.of(context).size.width,
            height: 200,
            child:Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(

                        child: Row(
                          children: [
                            Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                              image: DecorationImage(fit: BoxFit.cover,image: CachedNetworkImageProvider(questionItem.owner!.profile_image))
                            )),
                            const SizedBox(width: 10,),
                            Column(
                              children: [
                                Text(questionItem.owner!.display_name,style: TextStyle(fontSize: Theme.of(context).textTheme.subtitle1!.fontSize
                                ),),
                                Text(questionItem.owner!.user_type,style: TextStyle(fontSize: Theme.of(context).textTheme.caption!.fontSize
                                ),),

                              ],
                            ),
                          ],
                        ),
                      ),
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.end,
                         children: [
                           Text("creation date",style: TextStyle(fontSize: Theme.of(context).textTheme.caption!.fontSize),textAlign: TextAlign.end,),
                           Text(convertTime(questionItem.creation_date!),style: TextStyle(fontSize: Theme.of(context).textTheme.overline!.fontSize)),
                         ],
                       )
                    ],
                  ),
                 Text(questionItem.title!,style:TextStyle(overflow: TextOverflow.ellipsis,fontSize: Theme.of(context).textTheme.bodyText1!.fontSize),maxLines: 2,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Row(
                     children: [
                       const Icon(Icons.remove_red_eye_sharp),
                       const SizedBox(width: 5.0,),
                       Text(questionItem.view_count.toString())
                     ],
                   ),
                   Row(
                     children:   [
                       const Icon(Icons.score),
                       const SizedBox(width: 5.0,),
                       Text(questionItem.score.toString())
                     ],
                   ),
                   Row(
                     children:   [
                       const Icon(Icons.question_answer),
                       const SizedBox(width: 5.0,),
                       Text(questionItem.answer_count.toString())
                     ],
                   ),

                 ],
               )

              ],
            ) ,
          ),
        ),
      ),
    );
  }
}
// Wrap(
// spacing: 5.0,
// runSpacing: 5.0,
// children:getKeyWord([ "react js", "material-ui","react js", "material-ui","react js", "material-ui"])
// )