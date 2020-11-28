// utils
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

//Firebase - Services
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:svec/services/auth.service.dart';

// Pages
import 'package:svec/pages/home.page.dart';
import 'package:svec/pages/login.page.dart';
import 'package:svec/pages/signUpStep1.page.dart';
import 'package:svec/pages/signUpStep4.page.dart';
import 'package:svec/pages/signUpStep2.page.dart';
import 'package:svec/pages/signUpStep3.page.dart';
import 'package:svec/pages/signUpFinalStep.page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(SvecApp());
}

class SvecApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (_) => AuthService(FirebaseAuth.instance, FirebaseFirestore.instance),
        ),
        StreamProvider(
          create: (context) => context.read<AuthService>().authStateChanges,
        )
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.orange,
          primarySwatch: Colors.orange,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          '/': (context) {
            if (context.watch<User>() != null) {
              return HomePage();
            }
            return LoginPage();
          },
        },
        // ignore: missing_return
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case SignUpStep1Page.routeName:
              return PageTransition(
                  child: SignUpStep1Page(),
                  type: PageTransitionType.rightToLeft);
              break;
            case SignUpStep4Page.routeName:
              final Map<String, dynamic> signUpValues = settings.arguments;
              return PageTransition(
                  child: SignUpStep4Page(signUpValues),
                  type: PageTransitionType.rightToLeft);
              break;
            case SignUpStep2Page.routeName:
              final Map<String, dynamic> signUpValues = settings.arguments;
              return PageTransition(
                  child: SignUpStep2Page(signUpValues),
                  type: PageTransitionType.rightToLeft);
              break;
            case SignUpStep3Page.routeName:
              final Map<String, dynamic> signUpValues = settings.arguments;
              return PageTransition(
                  child: SignUpStep3Page(signUpValues),
                  type: PageTransitionType.rightToLeft);
              break;
            case SignUpFinalStepPage.routeName:
              final Map<String, dynamic> signUpValues = settings.arguments;
              return PageTransition(
                  child: SignUpFinalStepPage(signUpValues),
                  type: PageTransitionType.rightToLeft);
              break;

            case HomePage.routeName:
              return PageTransition(
                  child: HomePage(), type: PageTransitionType.fade);
              break;

            default:
              return null;
          }
        },
      ),
    );
  }
}
