import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return body();
  }

  Widget body() {
    return const Scaffold(
        body: SafeArea(
          child: Column(
            children:[],
        ),
      ),
    );
  }
}