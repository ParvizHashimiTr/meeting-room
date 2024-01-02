class Meeting {
  const Meeting({
    required this.start,
    required this.end,
    required this.companyName,
    required this.details,
  });

  final DateTime start;
  final DateTime end;
  final String companyName;
  final MeetingDetails details;
}

class MeetingDetails {
  const MeetingDetails({
    required this.title,
    required this.duration,
    required this.ownedPerson,
    required this.personCount,
  });

  final String title;
  final String duration;
  final String ownedPerson;
  final int personCount;
}
