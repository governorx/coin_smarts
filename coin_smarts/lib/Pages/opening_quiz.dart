import 'package:flutter/material.dart';
import '../Utils/question_types.dart';
import '../Utils/quiz_generator.dart';
import './about_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

 class OpeningQuiz extends StatefulWidget{
   @override
   State createState() => new OpeningQuizState();
 }
 class OpeningQuizState extends State<OpeningQuiz>{
  @override
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context){
      return new Scaffold(
      appBar: new AppBar(title: new Text("title")),
      body: new StreamBuilder(
        stream: Firestore.instance.collection('questions').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return AboutPage();
          return new ListView.builder(
            padding: new EdgeInsets.all(8.0),
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) {
              DocumentSnapshot ds = snapshot.data.documents[index];
              return  visualizeQuestionFromData(ds['question'],ds['answer'],ds['options']);
            }
          );
        }
      )
    ); 
  }

Flex visualizeQuestionFromData(String question,int answer,List<dynamic> options){
  //lists from firebase are passed in dynamic typ
  List<String> convertedOptions = new List<String>();
  for( dynamic i in options){
    //convert to string
    convertedOptions.add(i.toString());
  }

  //create question type
  QuestionChoice q = new QuestionChoice(question, answer, convertedOptions);
  return new Flex(
        direction: Axis.vertical,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new Text(
            q.question,
            textDirection: TextDirection.ltr,
            style: new TextStyle( fontSize: 20.0, fontWeight: FontWeight.bold), 
          ),
          new Material(
              color: Colors.blueAccent,
              child: new Text(q.options[0]),
          ),
          new Center(
              child: new Text(q.options[1]),
          ),
          new Center(
              child: new Text(q.options[2]),
          ),
          new Center(
              child: new Text(q.options[3]),
          )
        ],
      );
}
 }
