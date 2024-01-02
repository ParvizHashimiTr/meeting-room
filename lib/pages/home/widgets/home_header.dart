import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meeting_room/core/app_colors.dart';
import 'package:meeting_room/core/app_routes.dart';
import 'package:meeting_room/core/assets.dart';
import 'package:meeting_room/widgets/action_button.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Text(
          'Bakı zalı',
          style: TextStyle(
            fontSize: 78.6,
            fontWeight: FontWeight.bold,
            color: AppColors.main,
          ),
        ),
        ActionButton(
          title: 'Görüş siyahısına bax',
          onTap: () {
            Navigator.of(context).pushNamed(AppRoutes.meetingRoom);
          },
        ),
        Image.asset(
          Images.logo,
          height: 80,
        ),
      ],
    );
  }
}
