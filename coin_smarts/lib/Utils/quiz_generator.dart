import "./question_types.dart";
class QuizInit{
  List<QuestionChoice> _questions;
  int _currentQuestionIndex = -1;
  int _score = 0;
  List<int> responses;
  QuizInit(this._questions);
  int get score => _score;
  int get length => _questions.length;
  int get questionNumber => _currentQuestionIndex+1;
  List<QuestionChoice> get questions => _questions;
  QuestionChoice get nextQuestion{
    _currentQuestionIndex++;
    if(_currentQuestionIndex >= length) return null;
    return _questions[_currentQuestionIndex];
  }
  List<String> get answers{
    _currentQuestionIndex++;
    if(_currentQuestionIndex >= length) return null;
    return _questions[_currentQuestionIndex].options;
  }
  bool isCorrect(int response){
    if(response == _questions[_currentQuestionIndex].answer){
       _score++;
       return true;
    }
  }
}

class QuizTF{
  List<QuestionTF> _questions;
  int _currentQuestionIndex = -1;
  int _score = 0;
  QuizTF(this._questions){
    _questions.shuffle();
  }
  
  int get score => _score;
  int get length => _questions.length;
  int get questionNumber => _currentQuestionIndex+1;
  List<QuestionTF> get questionTFs => _questions;

  String get nextQuestion{
    _currentQuestionIndex++;
    if(_currentQuestionIndex >= length) return null;
    return _questions[_currentQuestionIndex].question;
  }

  bool isCorrect(bool response){
    if(response == _questions[_currentQuestionIndex].answer) {
      _score++;
      return true;
    }
    return false;
  }
}
