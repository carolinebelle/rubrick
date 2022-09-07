class ApplicantFields {
  static final List<String> values = [groupID, name];

  static const String id = '_id';
  static const String groupID = 'groupID';
  static const String name = 'name';
}

class Applicant {
  final String id;
  final int groupID;
  final String name;

  Applicant({required this.id, required this.groupID, required this.name});

  Map<String, dynamic> toJson() => {
        ApplicantFields.id: id,
        ApplicantFields.groupID: groupID,
        ApplicantFields.name: name,
      };

  Applicant copy({String? id, int? groupID, String? name}) => Applicant(
      id: id ?? this.id,
      groupID: groupID ?? this.groupID,
      name: name ?? this.name);

  static Applicant fromJson(Map<String, Object?> jsonObj) => Applicant(
        id: jsonObj[ApplicantFields.id] as String,
        groupID: jsonObj[ApplicantFields.groupID] as int,
        name: jsonObj[ApplicantFields.name] as String,
      );

  @override
  String toString() {
    return 'Todo{id: $id, groupID: $groupID, name: $name}';
  }
}
