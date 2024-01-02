import 'package:flutter/material.dart';

class HomeFooter extends StatelessWidget {
  const HomeFooter({super.key});

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );

    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '© 2023 Time Busness centre',
            style: style,
          ),
          Text(
            'Developed with by TimeSoft',
            style: style,
          ),
        ],
      ),
    );
  }
}
