import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import './pages/login.dart';
import './pages/registerStep1.dart';
import './pages/registerStep2.dart';
import './pages/registerStep3.dart';
import './pages/registerStep4.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.e_voting

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primaryColor: Colors.orange,
        primarySwatch: Colors.orange,

        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (context) => LoginPage(),
        '/login': (context) => LoginPage(),
      },
      // ignore: missing_return
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/registerStep1':
            return PageTransition(
                child: RegisterStep1(), type: PageTransitionType.rightToLeft);
            break;
          case '/registerStep2':
            return PageTransition(
                child: RegisterStep2(), type: PageTransitionType.rightToLeft);
            break;
          case '/registerStep3':
            return PageTransition(
                child: RegisterStep3(), type: PageTransitionType.rightToLeft);
            break;
          case '/registerStep4':
            return PageTransition(
                child: RegisterStep4(), type: PageTransitionType.rightToLeft);
            break;
          default:
            return null;
        }
      },
    );
  }
}
