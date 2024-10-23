import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:notes_app/pages/choose_theme_page.dart';
import 'package:notes_app/pages/notes_page.dart';
import 'package:notes_app/service/setting_service.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SplashWidget());
  }
}

class SplashWidget extends StatefulWidget {
  const SplashWidget({super.key});

  @override
  State<SplashWidget> createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  @override
  void initState() {
    super.initState();
    _navigatingToScreen();
  }

  void _navigatingToScreen() async {
    await Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) => SettingsService.loadThemeMode() == null
                ? const ChooseThemePage()
                : const NotesPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        'assets/animation/note_animation.json',
        width: 300,
        height: 300,
        fit: BoxFit.fill,
      ),
    );
  }
}
