import 'package:first_assignment/screens/check_answers_screen.dart';
import 'package:first_assignment/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './view/home_page.dart';
import './screens/score_screen.dart';

// void main() {

// SystemChrome.setPreferredOrientations([
//   DeviceOrientation.portraitUp,
//   DeviceOrientation.portraitDown,
// ]);

//   runApp(MyApp());
// }
void main() {
  //The app doesn't need a landscape mode, unless the client requests it.
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(const MyApp()));
  runApp(const MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter  Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/scores-screen': (ctx) => ScoreScreen(),
        '/splash-screen': (ctx) => SplashScreen(),
        '/check-answers-screen': (ctx) => CheckAnswersScreen(),
      },
    );
  }
//}
}
