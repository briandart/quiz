import 'package:flutter/material.dart';
import './answer.dart';
import './question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  const Quiz({
    Key? key,
    required this.questions,
    required this.answerQuestion,
    required this.questionIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final questionText = questions[questionIndex]['questionText'] as String;
    final answers = questions[questionIndex]['answers'] as List<Map<String, Object>>;

    return Column(
      children: [
        Question(questionText),
        ...answers.map((answer) {
          final answerText = answer['text'] as String;
          final answerScore = answer['score'] as int;
          return Answer(() => answerQuestion(answerScore), answerText);
        }).toList(),
      ],
    );
  }
}
