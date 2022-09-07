import 'dart:convert';
import 'applicant.dart';
import 'contest.dart';

class ScoreCardFields {
  static final List<String> values = [contest, applicant, scores];

  static const String contest = 'contest';
  static const String applicant = 'applicant';
  static const String scores = 'scores';
  static const String notes = 'notes';
}

class ScoreCard {
  final Contest contest;
  final Applicant applicant;
  List<int> scores;
  List<String> notes;

  ScoreCard(
      {required this.contest,
      required this.applicant,
      List<int>? scores,
      List<String>? notes})
      : scores = scores ?? <int>[],
        notes = notes ?? <String>[];

  Map<String, dynamic> toJson() => {
        ScoreCardFields.contest: json.encode(contest),
        ScoreCardFields.applicant: json.encode(applicant),
        ScoreCardFields.scores: json.encode(scores),
        ScoreCardFields.notes: json.encode(notes),
      };

  ScoreCard copy(
          {Contest? contest,
          Applicant? applicant,
          List<int>? scores,
          List<String>? notes}) =>
      ScoreCard(
          contest: contest ?? this.contest,
          applicant: applicant ?? this.applicant,
          scores: scores ?? this.scores,
          notes: notes ?? this.notes);

  static ScoreCard fromJson(Map<String, Object?> jsonObj) => ScoreCard(
        contest: jsonObj[ScoreCardFields.contest] as Contest,
        applicant: jsonObj[ScoreCardFields.applicant] as Applicant,
        scores: List<int>.from(
            json.decode(jsonObj[ScoreCardFields.scores] as String)),
        notes: List<String>.from(
            json.decode(jsonObj[ScoreCardFields.notes] as String)),
      );

  @override
  String toString() {
    return 'Todo{contestID: $contest, applicantID: $applicant, scores: $scores, notes: $notes}';
  }
}
