class Event {
  int id;
  String eventName;
  String eventDescription;
  DateTime startDate;
  DateTime endDate;

  Event({
    required this.id,
    required this.eventName,
    required this.eventDescription,
    required this.startDate,
    required this.endDate,
  });

  // Add any other properties and methods as needed.

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
        id: json['id'],
        eventName: json['event_name'],
        eventDescription: json['event_description'],
        startDate: json['start_date'],
        endDate: json['end_date']);
  }
}
