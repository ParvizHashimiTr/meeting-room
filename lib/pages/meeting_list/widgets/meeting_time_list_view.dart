import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:meeting_room/mock/mock_meeting_list.dart';
import 'package:meeting_room/pages/meeting_list/widgets/meeting_item.dart';

import '../../../core/assets.dart';
import '../../../mock/meeting.dart';

typedef OnMeetingSelected = void Function(Meeting meeting);

class MeetingTimeListView extends StatelessWidget {
  const MeetingTimeListView({
    super.key,
    this.selectedMeeting,
    this.onMeetingSelected,
  });

  final Meeting? selectedMeeting;
  final OnMeetingSelected? onMeetingSelected;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: ColoredBox(
            color: Colors.grey.shade200,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  Images.logo,
                  height: 60,
                ),
              ),
              const SizedBox(height: 32),
              Text.rich(
                TextSpan(
                  text: 'Geri',
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pop(context);
                    },
                ),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    final meeting = mockMeetingList[index];

                    final color =
                        meeting == selectedMeeting ? Colors.red.shade400 : null;

                    return MeetingItem(
                      meeting: meeting,
                      color: color,
                      onTap: () {
                        onMeetingSelected?.call(meeting);
                      },
                    );
                  },
                  separatorBuilder: (_, __) {
                    return const SizedBox(height: 8);
                  },
                  itemCount: mockMeetingList.length,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
