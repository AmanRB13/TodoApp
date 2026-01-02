import 'package:flutter/material.dart';

import 'forms.dart';
import 'buttomnav.dart';

import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Providers/providers.dart';
import 'package:provider/provider.dart';
import 'dashboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyAOdxelpo5FG_tUZMhoT06-t0NrVr363NQ",
        authDomain: "todoapp-29010.firebaseapp.com",
        projectId: "todoapp-29010",
        storageBucket: "todoapp-29010.firebasestorage.app",
        messagingSenderId: "256762293614",
        appId: "1:256762293614:web:4281883c4049cec763657f",
        measurementId: "G-Z2HJ6BDD0C",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => Listprovider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.dark),
        home: Authentication(),
        initialRoute: '/home',
        routes: {
          '/home': (context) => Bottomnavigation(),
          '/dashboard': (context) => Dashboard(),
          '/auth': (context) => Authentication(),
        },
      ),
    );
  }
}
