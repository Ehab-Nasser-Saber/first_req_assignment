import 'package:first_assignment/view/answer.dart';
import 'package:first_assignment/view/question_appbar.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _questions = [
    {
      'questionText': 'Motor racing is the ---- sport in the world.',
      'answers': [
        {'text': 'most expensive', 'score': 1, 'selected': true},
        {'text': 'more expensive', 'score': 0, 'selected': false},
        {'text': 'expensivest', 'score': 0, 'selected': false},
        {'text': 'as expensive', 'score': 0, 'selected': false},
      ],
    },
    {
      'questionText': 'She lives far ---- here.',
      'answers': [
        {'text': 'on', 'score': 0, 'selected': true},
        {'text': 'to', 'score': 0, 'selected': false},
        {'text': 'at', 'score': 0, 'selected': false},
        {'text': 'from', 'score': 1, 'selected': false},
      ],
    },
    {
      'questionText': 'Jhon\'s house is ---- built.',
      'answers': [
        {'text': 'been', 'score': 0, 'selected': true},
        {'text': 'being', 'score': 1, 'selected': false},
        {'text': 'be', 'score': 0, 'selected': false},
        {'text': 'get', 'score': 0, 'selected': false},
      ],
    },
    {
      'questionText': 'The student ---- late to school.',
      'answers': [
        {'text': 'were', 'score': 0, 'selected': true},
        {'text': 'was', 'score': 1, 'selected': false},
        {'text': 'am', 'score': 0, 'selected': false},
        {'text': 'are', 'score': 0, 'selected': false},
      ],
    },
    {
      'questionText': 'There is ---- else here.',
      'answers': [
        {'text': 'anybody', 'score': 0, 'selected': true},
        {'text': 'everyone', 'score': 0, 'selected': false},
        {'text': 'all', 'score': 0, 'selected': false},
        {'text': 'no one', 'score': 1, 'selected': false},
      ],
    },
    {
      'questionText': 'My friends will ---- early.',
      'answers': [
        {'text': 'arrived', 'score': 0, 'selected': true},
        {'text': 'arrive', 'score': 1, 'selected': false},
        {'text': 'arrives', 'score': 0, 'selected': false},
        {'text': 'arriving', 'score': 0, 'selected': false},
      ],
    },
  ];
  int _questionIndex = 0;
  int _totalScore = 0;
  int _score = 0;
  bool isSelected = false;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
      _score = 0;
      isSelected = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var answersIndex = _questions[_questionIndex]['answers'] as List;
    var screenHeight = MediaQuery.of(context).size.height;
    //var screenWidth = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50), child: QuestionAppBar()),
      body: Column(
        // ignore: sort_child_properties_last
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 40,
                  left: 10,
                ),
                child:
                    Text('Question ${_questionIndex + 1}/${_questions.length}',
                        style: const TextStyle(
                          color: Color(0xffFBB551),
                          fontWeight: FontWeight.bold,
                        )),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 15, bottom: 30, left: 10, right: 60),
                child:
                    Text(_questions[_questionIndex]['questionText'].toString(),
                        style: const TextStyle(
                          fontSize: 25,
                          color: Color(0xff545B6C),
                          fontFamily: 'Sans Serif',
                          fontWeight: FontWeight.bold,
                        )),
              )
            ],
          ),
          SizedBox(
            height:
                screenHeight < 600 ? screenHeight * 0.4 : screenHeight * 0.55,
            child: ListView.separated(
              itemBuilder: (ctx, index) {
                // var answersIndex =
                //     _questions[_questionIndex]['answers'] as List;
                return Answer(() {
                  setState(() {
                    for (int i = 0; i < 4; i++) {
                      answersIndex[i]['selected'] = false;
                    }
                    isSelected = true;
                    _score = answersIndex[index]['score'];
                    answersIndex[index]['selected'] = true;
                  });
                },
                    answersIndex[index]['text'],
                    answersIndex[index]['selected']
                        ? const Color(0xff8B80B6)
                        : Colors.white,
                    answersIndex[index]['selected']
                        ? Colors.white
                        : const Color(0xff545B6C));
              },
              itemCount: answersIndex.length,
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  color: Colors.black,
                  height: 2,
                  thickness: 1,
                );
              },
            ),
          ),
          /* This is the map that got replaced by listview.

           ...(_questions[_questionIndex]['answers'] as List).map(
             (answer) {
               var answersIndex = _questions[_questionIndex]['answers'] as List;
               return Answer(() {
                 setState(() {
                   for (int i = 0; i < 4; i++) {
                     answersIndex[i]['selected'] = false;
                   }
                   isSelected = true;
                   _score = answer['score'];
                   answer['selected'] = true;
                 });
              },
                   answer['text'],
                   answer['selected'] ? Color(0xff8B80B6) : Colors.white,
                   answer['selected'] ? Colors.white : Color(0xff545B6C));
             },
 ),*/
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: isSelected
                  ? () {
                      if (_questionIndex < 5) {
                        setState(() {
                          _questionIndex++;
                          _totalScore += _score;
                          isSelected = false;
                        });
                      } else {
                        _totalScore += _score;
                        print('Your total score is:${_totalScore}');
                        _resetQuiz();
                      }
                    }
                  : null,
              child: Container(
                  width: double.infinity,
                  height: 80,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: Color(0xff8B80B6),
                  ),
                  child: const Center(
                    child: Text(
                      'Next',
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  )),
            ),
          )
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }
}
