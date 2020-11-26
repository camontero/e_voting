// utils
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

//Firebase - Services
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:svec/services/auth.service.dart';

// Pages
import 'package:svec/pages/home.page.dart';
import 'package:svec/pages/login.page.dart';
import 'package:svec/pages/signUpStep1.page.dart';
import 'package:svec/pages/signUpStep2.page.dart';
import 'package:svec/pages/signUpStep3.page.dart';
import 'package:svec/pages/signUpStep4.page.dart';
import 'package:svec/pages/signUpStep5.page.dart';

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
          create: (_) => AuthService(FirebaseAuth.instance),
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
            final firebaseUser = context.watch<User>();



            if (firebaseUser != null) {
              return HomePage();
            }
            return LoginPage();
          },
        },
        // ignore: missing_return
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/signInStep1':
              return PageTransition(
                  child: SignUpStep1Page(),
                  type: PageTransitionType.rightToLeft);
              break;
            case '/signInStep2':
              return PageTransition(
                  child: SignUpStep2Page(),
                  type: PageTransitionType.rightToLeft);
              break;
            case '/signInStep3':
              return PageTransition(
                  child: SignUpStep3Page(),
                  type: PageTransitionType.rightToLeft);
              break;
            case '/signInStep4':
              return PageTransition(
                  child: SignUpStep4Page(),
                  type: PageTransitionType.rightToLeft);
              break;
            case '/signInStep5':
              return PageTransition(
                  child: SignUpStep5Page(),
                  type: PageTransitionType.rightToLeft);
              break;

            case '/home':
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
