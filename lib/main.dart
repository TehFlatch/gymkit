import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gym_kit/platform_button.dart';
import 'firebase_options.dart';
import 'dart:io' show Platform;
import 'platform_scaffold.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoApp(
          title: 'Gym Tracker',
          theme: CupertinoThemeData(brightness: Brightness.light),
          home: AuthScreen(),
        )
        : MaterialApp(
          title: 'Gym Tracker',
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: ThemeMode.system,
          home: AuthScreen(),
        );
  }
}

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  Future<void> _signInAnonymously() async {
    try {
      // await _auth.signInAnonymously();
    } catch (e) {
      print("Error signing in: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      title: Text("Gym Tracker"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PlatformButton(
              onPressed: _signInAnonymously,
              child: Text("Sign in anonymously"),
            ),
            PlatformButton(
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => WorkoutScreen()),
                );
              },
              child: Text("Go to Workouts"),
            ),
            PlatformButton(
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => AIPlanScreen()),
                );
              },
              child: Text("Go to AI Plan Generator"),
            ),
          ],
        ),
      ),
    );
  }
}

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      title: Text("Workouts"),
      body: Center(child: Text("Workout Routines")),
    );
  }
}

class AIPlanScreen extends StatelessWidget {
  const AIPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      title: Text("AI Plan Generator"),
      body: Center(child: Text("AI-generated workout plan coming soon!")),
    );
  }
}
