class Question {
  final String questionText;
  final List<String> answer;

  Question(
    this.questionText,
    this.answer,
  );
}

final List<Question> questions = [
  Question(
      'What is the capital of France?', ['Paris', 'London', 'Rome', 'Berlin']),
  Question('What is 2 + 2?', ['3', '4', '5', '6']),
  Question('Who wrote "Hamlet"?',
      ['Shakespeare', 'Hemingway', 'Faulkner', 'Fitzgerald']),
];
