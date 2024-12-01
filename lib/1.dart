import 'package:flutter/material.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});
  @override
  State createState() => _QuizAppState();
}

class singleQueFormat {
  final String? questions;
  final List<String>? options;
  final int? answerIndex;

  const singleQueFormat({this.questions, this.options, this.answerIndex});
}

class _QuizAppState extends State {
  List allQuestion = [
    const singleQueFormat(
      questions: "  Who is founder of MICROSOFT?",
      options: ["Steve Jobs", "Jeff Bezos", "Bill Gates", "Elon Musk"],
      answerIndex: 2,
    ),
    const singleQueFormat(
      questions: "Who is the founder of APPLE?",
      options: ["Steve Jobs", "Jeff Bezos", "Bill Gates", "Elon Musk"],
      answerIndex: 0,
    ),
    const singleQueFormat(
      questions: "Who is the founder of AMAZON?",
      options: ["Steve Jobs", "Jeff Bezos", "Bill Gates", "Elon Musk"],
      answerIndex: 1,
    ),
    const singleQueFormat(
      questions: "Who is the founder of TESLA?",
      options: ["Steve Jobs", "Jeff Bezos", "Bill Gates", "Elon Musk"],
      answerIndex: 3,
    ),
    const singleQueFormat(
      questions: "Who is the founder of GOOGLE?",
      options: ["Steve Jobs", "Lary Page", "Bill Gates", "Elon Musk"],
      answerIndex: 1,
    ),
  ];

  bool queScreen = true;
  int queIndex = 0;
  int selectedAnsIndex = -1;
  int correctAns = 0;

  MaterialStateProperty<Color?>? checkAns(int buttonIndex) {
    if (selectedAnsIndex != -1) {
      if (selectedAnsIndex == buttonIndex) {
        if (selectedAnsIndex == allQuestion[queIndex].answerIndex) {
          return const MaterialStatePropertyAll(Colors.green);
        } else {
          return const MaterialStatePropertyAll(Colors.red);
        }
      } else {
        if (buttonIndex == allQuestion[queIndex].answerIndex) {
          return const MaterialStatePropertyAll(Colors.green);
        }
      }
    } else {
      return const MaterialStatePropertyAll(null);
    }
    return null;
  }

  void changePage() {
    if (selectedAnsIndex == -1) {
      return;
    }
    if (selectedAnsIndex == allQuestion[queIndex].answerIndex) {
      correctAns++;
    }
    if (selectedAnsIndex != -1) {
      if (queIndex == allQuestion.length - 1) {
        queScreen = false;
        setState(() {});
      }
      setState(() {
        selectedAnsIndex = -1;
        queIndex++;
      });
    }
  }

  Scaffold isQuestionScreen() {
    if (queScreen == true) {
      return Scaffold(
        backgroundColor: Color.fromARGB(255, 243, 242, 201),
        appBar: AppBar(
          title: const Text(
            'QuizApp',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // const SizedBox(
                  //   width: 20,
                  // ),
                  const Text(
                    'Question : ',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "${queIndex + 1}/${allQuestion.length}",
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: 380,
                height: 50,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 30,
                    ),
                    Text(
                      allQuestion[queIndex].questions,
                      style: const TextStyle(
                          fontSize: 23, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: checkAns(0),
                ),
                onPressed: () {
                  if (selectedAnsIndex == -1) {
                    setState(() {
                      selectedAnsIndex = 0;
                    });
                  }
                },
                child: Text(
                  "A.${allQuestion[queIndex].options[0]}",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.normal),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: checkAns(1),
                ),
                onPressed: () {
                  if (selectedAnsIndex == -1) {
                    setState(() {
                      selectedAnsIndex = 1;
                    });
                  }
                },
                child: Text(
                  "B.${allQuestion[queIndex].options[1]}",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.normal),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: checkAns(2),
                ),
                onPressed: () {
                  if (selectedAnsIndex == -1) {
                    setState(() {
                      selectedAnsIndex = 2;
                    });
                  }
                },
                child: Text(
                  "C.${allQuestion[queIndex].options[2]}",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.normal),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: checkAns(3),
                ),
                onPressed: () {
                  if (selectedAnsIndex == -1) {
                    setState(() {
                      selectedAnsIndex = 3;
                    });
                  }
                },
                child: Text(
                  "D.${allQuestion[queIndex].options[3]}",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.normal),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: changePage,
          backgroundColor: Colors.lightGreen,
          child: const Icon(
            Icons.forward,
            color: Colors.black,
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "QuizApp",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
                "https://imgs.search.brave.com/o1FAxG-_s0TVnbVYoDpab64wFymq2G9l47kPvCB3kP0/rs:fit:860:0:0/g:ce/aHR0cHM6Ly90aHVt/YnMuZHJlYW1zdGlt/ZS5jb20vYi9nb2xk/LXRyb3BoeS1jb25n/cmF0dWxhdGlvbnMt/NDgyNDQ3OS5qcGc"),
            const Text(
              'Congratulations',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.normal),
            ),
            Text(
              "You Score : $correctAns/${allQuestion.length}",
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedAnsIndex = -1;
                  queIndex = 0;
                  queScreen = true;
                  correctAns = 0;
                });
              },
              child: const Text('RESET'),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return isQuestionScreen();
  }
}
