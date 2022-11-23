import 'package:flutter/material.dart';

class ScoreScreen extends StatelessWidget {
  Widget scoreCard(String title, String res) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Color(0xffFFFFFF)),
      width: double.infinity,
      padding: EdgeInsets.only(top: 30, bottom: 30, left: 4, right: 4),
      margin: EdgeInsets.only(left: 15, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(res,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff9D23B3)))
        ],
      ),
    );
  }

  InkWell navButton(
    String title,
    VoidCallback,
    Color color,
    screenHeight,
    screenWidth,
  ) {
    return InkWell(
      onTap: VoidCallback,
      child: Container(
        height: screenHeight * 0.1,
        width: screenWidth * 0.45,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: color),
        child: Center(
          child: Text(
            title,
            style: TextStyle(color: Color(0xffFFFFFF)),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)?.settings.arguments as Map;
    final totalScore = routeArgs['score'];
    final questions = routeArgs['index'];
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    final wrongAnswers = 6 - totalScore;
    final int scorePercent = ((totalScore / 6) * 100).toInt();

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        //I used nav.pop even thought i dont need it since appBar include a back button
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Result'),
        backgroundColor: Color(0xff9D23B3),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight < 600
              ? screenHeight
              : (screenHeight - AppBar().preferredSize.height - kToolbarHeight),
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color(0xff9D23B3).withOpacity(0.7),
            Color(0xff460647)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Container(child: Text('result')),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              scoreCard('Number of Questions', '$questions'),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              scoreCard('Score', '${scorePercent}%'),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              scoreCard('Correct Answers', '${totalScore}/$questions'),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              scoreCard('Wrong Answers', '${wrongAnswers}/$questions'),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    navButton('Go to The Home Page', () {
                      Navigator.pushNamed(context, '/splash-screen');
                    }, Color(0xff460647), screenHeight, screenWidth),
                    navButton('Check The Answers', () {
                      Navigator.pushNamed(context, '/check-answers-screen');
                    }, Color(0xff9D23B3), screenHeight, screenWidth),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
