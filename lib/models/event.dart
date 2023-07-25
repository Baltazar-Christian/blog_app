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
        eventName: json['eventName'],
        eventDescription: json['capacity'],
        startDate: json['address'],
        endDate: json['description']);
  }
}
