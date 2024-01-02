import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/assets.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  int _currentIndex = 0;
  final _assets = <String>[
    Images.image1,
    Images.image2,
    Images.image3,
    Images.image4,
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(
            CupertinoIcons.chevron_left,
            size: size.width * 0.1,
          ),
          onPressed: () {
            setState(() {
              if (_currentIndex == 0) {
                _currentIndex = _assets.length - 1;
              } else {
                _currentIndex--;
              }
            });
          },
        ),
        Image.asset(
          _assets[_currentIndex],
          width: size.width * 0.6,
          height: size.height * 0.5,
        ),
        IconButton(
          icon: Icon(
            CupertinoIcons.chevron_right,
            size: size.width * 0.1,
          ),
          onPressed: () {
            setState(() {
              if (_currentIndex == 3) {
                _currentIndex = 0;
              } else {
                _currentIndex++;
              }
            });
          },
        ),
      ],
    );
  }
}
