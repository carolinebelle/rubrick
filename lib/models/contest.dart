import 'dart:convert';
import 'package:rubrick/models/applicant.dart';

class ContestFields {
  static final List<String> values = [
    id,
    title,
    categories,
    applicants,
    isLocked,
    judges,
    groups
  ];

  static const String id = '_id';
  static const String title = 'title';
  static const String categories = 'categories';
  static const String applicants = 'applicants';
  static const String isLocked = 'isLocked';
  static const String judges = 'judges';
  static const String groups = 'groups';
}

class Contest {
  final String? id;
  final String title;
  final List<String> categories;
  final List<String> groups;
  List<Applicant> applicants;
  List<String> judges;
  bool isLocked;

  Contest({
    this.id,
    required this.title,
    required this.categories,
    this.isLocked = false,
    DateTime? startDate,
    List<Applicant>? applicants,
    List<String>? judges,
    List<String>? groups,
  })  : applicants = applicants ?? [],
        judges = judges ?? [],
        groups = groups ?? [];

  Map<String, dynamic> toJson() => {
        ContestFields.id: id,
        ContestFields.title: title,
        ContestFields.categories: json.encode(categories),
        ContestFields.applicants: json.encode(applicants),
        ContestFields.judges: json.encode(judges),
        ContestFields.groups: json.encode(groups),
        ContestFields.isLocked: isLocked ? 1 : 0,
      };

  Contest copy(
          {String? id,
          String? title,
          List<String>? categories,
          DateTime? startDate,
          DateTime? endDate,
          bool? isLocked,
          List<Applicant>? applicants,
          List<String>? judges,
          List<String>? groups}) =>
      Contest(
          id: id ?? this.id,
          title: title ?? this.title,
          categories: categories ?? this.categories,
          startDate: startDate ?? DateTime.now(),
          isLocked: isLocked ?? false,
          applicants: applicants ?? this.applicants,
          judges: judges ?? this.judges,
          groups: groups ?? this.groups);

  static Contest fromJson(Map<String, Object?> jsonObj) => Contest(
      id: jsonObj[ContestFields.id] as String?,
      title: jsonObj[ContestFields.title] as String,
      categories: List<String>.from(
          json.decode(jsonObj[ContestFields.categories] as String)),
      applicants: List<Applicant>.from(
          json.decode(jsonObj[ContestFields.applicants] as String)),
      judges: List<String>.from(
          json.decode(jsonObj[ContestFields.judges] as String)),
      groups: List<String>.from(
          json.decode(jsonObj[ContestFields.groups] as String)),
      isLocked: jsonObj[ContestFields.isLocked] == 1);

  @override
  String toString() {
    return 'Todo{id: $id, title: $title, categories: $categories, isLocked: $isLocked, applicants: $applicants, groups: $groups, judges: $judges}';
  }
}
