import 'package:flutter/material.dart';

class TimerView extends StatelessWidget {
  const TimerView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        '00 : 30 : 00',
        style: TextStyle(
          fontSize: 56,
        ),
      ),
    );
  }
}
