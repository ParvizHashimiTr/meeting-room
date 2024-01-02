import 'package:flutter/material.dart';
import 'package:meeting_room/core/app_colors.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.title,
    this.onTap,
    this.color,
  });

  final String title;
  final VoidCallback? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 32,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color: color ?? AppColors.main,
          borderRadius: BorderRadius.circular(48),
          border: Border.all(
            color: Colors.white,
            width: 6,
          ),
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
