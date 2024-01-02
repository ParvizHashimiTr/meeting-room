import 'package:flutter/material.dart';
import 'package:meeting_room/pages/home/widgets/home_footer.dart';
import 'package:meeting_room/pages/home/widgets/home_header.dart';
import 'package:meeting_room/pages/home/widgets/home_slider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(color: Colors.grey.shade200),
          Padding(
            padding: MediaQuery.viewPaddingOf(context),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HomeHeader(),
                HomeSlider(),
                HomeFooter(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
