import 'package:e_voting/pages/home.page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:e_voting/pages/login.page.dart';
import 'package:e_voting/pages/signInStep1.page.dart';
import 'package:e_voting/pages/signInStep2.page.dart';
import 'package:e_voting/pages/signInStep3.page.dart';
import 'package:e_voting/pages/signInStep4.page.dart';
import 'package:e_voting/pages/signInStep5.page.dart';



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
        // '/': (context) => HomePage(),

        '/login': (context) => LoginPage(),
      },
      // ignore: missing_return
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/signInStep1':
            return PageTransition(
                child: SignInStep1Page(), type: PageTransitionType.rightToLeft);
            break;
          case '/signInStep2':
            return PageTransition(
                child: SignInStep2Page(), type: PageTransitionType.rightToLeft);
            break;
          case '/signInStep3':
            return PageTransition(
                child: SignInStep3Page(), type: PageTransitionType.rightToLeft);
            break; 
          case '/signInStep4':
            return PageTransition(
                child: SignInStep4Page(), type: PageTransitionType.rightToLeft);
            break;
          case '/signInStep5':
            return PageTransition(
                child: SignInStep5Page(), type: PageTransitionType.rightToLeft);
            break;

          case '/home':
          return PageTransition(
              child: HomePage(), type: PageTransitionType.fade);
          break;

          default:
            return null;
        }
      },
    );
  }
}
