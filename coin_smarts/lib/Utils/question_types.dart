class Question{
  String question;
  Question(this.question);
}
class QuestionChoice extends Question{
  String question;
  int answer;
  List<String> options;
  QuestionChoice(this.question,this.answer,this.options):super(question);
}
class QuestionTF extends Question{
  String question;
  bool answer;
  QuestionTF(this.question,this.answer):super(question);
}