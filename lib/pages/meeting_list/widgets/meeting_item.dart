import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:meeting_room/core/app_colors.dart';
import 'package:meeting_room/mock/meeting.dart';

class MeetingItem extends StatelessWidget {
  const MeetingItem({
    super.key,
    required this.meeting,
    this.onTap,
    this.color,
  });

  final Meeting meeting;
  final VoidCallback? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    var title = '';

    title += '${meeting.start.hour.toString().padLeft(2, '0')}'
        ':${meeting.start.minute.toString().padLeft(2, '0')}';

    title += ' - ';

    title += '${meeting.end.hour.toString().padLeft(2, '0')}'
        ':${meeting.end.minute.toString().padLeft(2, '0')}';

    title += ' ';

    title += meeting.companyName;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 4,
        ),
        decoration: BoxDecoration(
          color: color ?? AppColors.main,
          borderRadius: BorderRadius.circular(48),
          border: Border.all(
            color: Colors.white,
            width: 6,
          ),
        ),
        child: Row(
          children: [
            const SizedBox(width: 32),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Icon(
              CupertinoIcons.chevron_down,
              size: 56,
            ),
          ],
        ),
      ),
    );
  }
}
