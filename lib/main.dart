import 'package:flutter/material.dart';
import 'package:flutter_firebase/bandvotes.dart';
// import 'package:flutter_firebase/register.dart';
import 'package:firebase_core_web/firebase_core_web.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "XXX",
      appId: "1:521411551149:android:2d5f44a2012838dc14cb24",
      messagingSenderId: "XXX",
      projectId: "flutter-firebase-82865",
    ),
  );
  // FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firestore Bandnames',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: VotesPage(title: "Band Votes"),
    );
  }
}
