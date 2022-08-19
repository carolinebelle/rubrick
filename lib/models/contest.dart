import 'dart:convert';

class ContestFields {
  static final List<String> values = [
    id,
    title,
    categories,
    gradingScale,
    applicants,
    startDate,
    endDate,
    isLocked
  ];

  static const String id = '_id';
  static const String title = 'title';
  static const String categories = 'categories';
  static const String gradingScale = 'gradingScale';
  static const String applicants = 'applicants';
  static const String startDate = 'startDate';
  static const String endDate = 'endDate';
  static const String isLocked = 'isLocked';
}

class Contest {
  final String? id;
  final String title;
  final List<String> categories;
  final List<String> gradingScale;
  final DateTime startDate;
  DateTime endDate;
  bool isLocked;
  List<String> applicants;

  Contest({
    this.id,
    required this.title,
    required this.categories,
    required this.gradingScale,
    required this.endDate,
    this.isLocked = false,
    DateTime? startDate,
    List<String>? applicants,
  })  : startDate = startDate ?? DateTime.now(),
        applicants = applicants ?? [];

  Map<String, dynamic> toJson() => {
        ContestFields.id: id,
        ContestFields.startDate: startDate.toIso8601String(),
        ContestFields.endDate: endDate.toIso8601String(),
        ContestFields.title: title,
        ContestFields.categories: json.encode(categories),
        ContestFields.gradingScale: json.encode(gradingScale),
        ContestFields.applicants: json.encode(applicants),
        ContestFields.isLocked: isLocked ? 1 : 0,
      };

  Contest copy(
          {String? id,
          String? title,
          List<String>? categories,
          List<String>? gradingScale,
          DateTime? startDate,
          DateTime? endDate,
          bool? isLocked,
          List<String>? applicants}) =>
      Contest(
          id: id ?? this.id,
          title: title ?? this.title,
          categories: categories ?? this.categories,
          gradingScale: gradingScale ?? this.gradingScale,
          startDate: startDate ?? DateTime.now(),
          endDate: endDate ?? this.endDate,
          isLocked: isLocked ?? false,
          applicants: applicants ?? this.applicants);

  static Contest fromJson(Map<String, Object?> jsonObj) => Contest(
      id: jsonObj[ContestFields.id] as String?,
      startDate: DateTime.parse(jsonObj[ContestFields.startDate] as String),
      endDate: DateTime.parse(jsonObj[ContestFields.endDate] as String),
      title: jsonObj[ContestFields.title] as String,
      gradingScale: List<String>.from(
          json.decode(jsonObj[ContestFields.gradingScale] as String)),
      categories: List<String>.from(
          json.decode(jsonObj[ContestFields.categories] as String)),
      applicants: List<String>.from(
          json.decode(jsonObj[ContestFields.applicants] as String)),
      isLocked: jsonObj[ContestFields.isLocked] == 1);

  @override
  String toString() {
    return 'Todo{id: $id, title: $title, startDate: $startDate, endDate: $endDate, categories: $categories, gradingScale: $gradingScale, isLocked: $isLocked, applicants: $applicants}';
  }
}
