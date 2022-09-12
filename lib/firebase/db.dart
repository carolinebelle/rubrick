import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

import 'package:rubrick/models/score_card.dart';

import '../models/contest.dart';
import '../models/score_card.dart';

class DatabaseService {
  FirebaseFirestore db;

  DatabaseService({
    FirebaseFirestore? db,
  }) : db = db ?? FirebaseFirestore.instance;

  Future<String> retrieveCardID(
      String contestID, String applicantID, String userID) async {
    String cardID = (await db
            .collection('contests')
            .doc(contestID)
            .collection('score_cards')
            .where('author', isEqualTo: userID)
            .where('applicant', isEqualTo: applicantID)
            .limit(1)
            .get())
        .docs[0]
        .id;
    return '$contestID/score_cards/$cardID';
  }

  Stream<ScoreCard> streamCard(String cardID) {
    return db
        .collection('contests')
        .doc(cardID)
        .snapshots()
        .map((snap) => ScoreCard.fromFirestore(snap));
  }

  Stream<Contest>? streamContest(String? contestID) {
    if (contestID == null) return null;
    return db
        .collection('contests')
        .doc(contestID)
        .snapshots()
        .map((snap) => Contest.fromFirestore(snap));
  }
}
