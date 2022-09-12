import 'dart:convert';
import 'applicant.dart';
import 'contest.dart';

class ScoreCardFields {
  static final List<String> values = [id, author, contest, applicant, scores];

  static const String id = '_id';
  static const String contest = 'contest';
  static const String applicant = 'applicant';
  static const String author = 'author';
  static const String scores = 'scores';
  static const String notes = 'notes';
}

class ScoreCard {
  final String? id;
  final Contest contest;
  final Applicant applicant;
  final String author;
  List<int> scores;
  List<String> notes;

  ScoreCard(
      {this.id,
      required this.contest,
      required this.applicant,
      required this.author,
      List<int>? scores,
      List<String>? notes})
      : scores = scores ?? <int>[],
        notes = notes ?? <String>[];

  Map<String, dynamic> toJson() => {
        ScoreCardFields.id: json.encode(id),
        ScoreCardFields.contest: json.encode(contest),
        ScoreCardFields.applicant: json.encode(applicant),
        ScoreCardFields.author: json.encode(author),
        ScoreCardFields.scores: json.encode(scores),
        ScoreCardFields.notes: json.encode(notes),
      };

  ScoreCard copy(
          {String? id,
          Contest? contest,
          Applicant? applicant,
          String? author,
          List<int>? scores,
          List<String>? notes}) =>
      ScoreCard(
          id: id,
          contest: contest ?? this.contest,
          applicant: applicant ?? this.applicant,
          author: author ?? this.author,
          scores: scores ?? this.scores,
          notes: notes ?? this.notes);

  static ScoreCard fromJson(Map<String, Object?> jsonObj) => ScoreCard(
        id: jsonObj[ScoreCardFields.id] as String,
        contest: jsonObj[ScoreCardFields.contest] as Contest,
        applicant: jsonObj[ScoreCardFields.applicant] as Applicant,
        author: jsonObj[ScoreCardFields.author] as String,
        scores: List<int>.from(
            json.decode(jsonObj[ScoreCardFields.scores] as String)),
        notes: List<String>.from(
            json.decode(jsonObj[ScoreCardFields.notes] as String)),
      );

  @override
  String toString() {
    return 'Todo{id: $id, author: $author, contest: $contest, applicant: $applicant, scores: $scores, notes: $notes}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ScoreCard && id == other.id;
  }

  @override
  int get hashCode => id.hashCode;
}
