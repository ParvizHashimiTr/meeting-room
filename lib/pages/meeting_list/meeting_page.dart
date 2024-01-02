import 'package:flutter/material.dart';
import 'package:meeting_room/mock/meeting.dart';
import 'package:meeting_room/pages/home/widgets/home_footer.dart';
import 'package:meeting_room/pages/meeting_list/widgets/meeting_details_view.dart';
import 'package:meeting_room/pages/meeting_list/widgets/meeting_time_list_view.dart';
import 'package:meeting_room/pages/meeting_list/widgets/timer_view.dart';

class MeetingPage extends StatefulWidget {
  const MeetingPage({super.key});

  @override
  State<MeetingPage> createState() => _MeetingPageState();
}

class _MeetingPageState extends State<MeetingPage> {
  final pageDetailsNotifier = ValueNotifier<Meeting?>(null);

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Stack(
          children: [
            Padding(
              padding: MediaQuery.viewPaddingOf(context),
              child: Row(
                children: [
                  Expanded(
                    flex: 8,
                    child: ValueListenableBuilder(
                        valueListenable: pageDetailsNotifier,
                        builder: (context, meeting, _) {
                          return MeetingTimeListView(
                            selectedMeeting: pageDetailsNotifier.value,
                            onMeetingSelected: (meeting) {
                              pageDetailsNotifier.value = meeting;
                            },
                          );
                        }),
                  ),
                  Expanded(
                    flex: 10,
                    child: ValueListenableBuilder(
                      valueListenable: pageDetailsNotifier,
                      builder: (context, meeting, _) {
                        if (meeting != null) {
                          return MeetingDetailsView(
                            meeting: meeting,
                            onCancel: () {
                              pageDetailsNotifier.value = null;
                            },
                          );
                        }

                        return const TimerView();
                      },
                    ),
                  ),
                ],
              ),
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: HomeFooter(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    pageDetailsNotifier.dispose();
    super.dispose();
  }
}
