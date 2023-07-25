class Event {
  int? id;
  String? eventName;
  String? eventDescription;
  String? startDate;
  String? endDate;

  Event({
    this.id,
    this.eventName,
    this.eventDescription,
    this.startDate,
    this.endDate,
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
