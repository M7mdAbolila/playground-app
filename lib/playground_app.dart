import 'package:flutter/material.dart';
import 'package:playground/core/widgets/app_button.dart';

import 'features/new_widgets/new_widgets_screen.dart';

class PlaygroundApp extends StatelessWidget {
  const PlaygroundApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
        children: [
          AppButton(
            text: 'New Widgets',
            onPressed: () => _pushScreen(context, const NewWidgetsScreen()),
          ),
        ],
      ),
    );
  }

  void _pushScreen(BuildContext context, Widget screen) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => screen));
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text(
        'Playground app',
        style: TextStyle(
          fontSize: 24,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.teal,
    );
  }
}
