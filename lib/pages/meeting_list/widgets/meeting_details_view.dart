import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meeting_room/mock/meeting.dart';
import 'package:meeting_room/widgets/action_button.dart';

class MeetingDetailsView extends StatelessWidget {
  const MeetingDetailsView({
    super.key,
    required this.meeting,
    this.onCancel,
  });

  final Meeting meeting;
  final VoidCallback? onCancel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                meeting.companyName,
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: onCancel,
                icon: const Icon(
                  CupertinoIcons.xmark,
                  size: 40,
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          _itemBuilder('Adı', meeting.details.title),
          _itemBuilder('Müddət', meeting.details.duration),
          _itemBuilder('Səlahiyyətli şəxs', meeting.details.ownedPerson),
          _itemBuilder('Adam sayı', meeting.details.personCount.toString()),
          const SizedBox(height: 16),
          ActionButton(
            title: 'Bitir',
            color: Colors.red.shade400,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _itemBuilder(String title, String value) {
    const style = TextStyle(fontSize: 20);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: style.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(value, style: style),
          ],
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
