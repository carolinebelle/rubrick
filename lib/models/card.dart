import 'dart:convert';

class CardFields {
  static final List<String> values = [contestID, applicantID, scores];

  static const String contestID = 'contestID';
  static const String applicantID = 'applicantID';
  static const String scores = 'scores';
}

class Card {
  final String contestID;
  final String applicantID;
  List<int> scores; //scores stored as

  Card({
    required this.contestID,
    required this.applicantID,
    List<int>? scores,
  }) : scores = scores ?? <int>[];

  Map<String, dynamic> toJson() => {
        CardFields.contestID: contestID,
        CardFields.applicantID: applicantID,
        CardFields.scores: json.encode(scores),
      };

  Card copy({String? contestID, String? applicantID, List<int>? scores}) =>
      Card(
          contestID: contestID ?? this.contestID,
          applicantID: applicantID ?? this.applicantID,
          scores: scores ?? this.scores);

  static Card fromJson(Map<String, Object?> jsonObj) => Card(
        contestID: jsonObj[CardFields.contestID] as String,
        applicantID: jsonObj[CardFields.applicantID] as String,
        scores:
            List<int>.from(json.decode(jsonObj[CardFields.scores] as String)),
      );

  @override
  String toString() {
    return 'Todo{contestID: $contestID, applicantID: $applicantID, scores: $scores}';
  }
}
