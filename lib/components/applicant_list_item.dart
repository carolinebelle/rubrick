import 'package:flutter/material.dart';
import 'package:rubrick/models/applicant.dart';
import 'package:rubrick/models/score_card.dart';

import '../models/contest.dart';
import '../widgets/applicant_card.dart';
import 'grade_box.dart';

class ApplicantListItem extends StatefulWidget {
  final Contest contest;
  final Applicant applicant;
  const ApplicantListItem(
      {Key? key, required this.contest, required this.applicant})
      : super(key: key);

  @override
  State<ApplicantListItem> createState() => _ApplicantListItemState();
}

class _ApplicantListItemState extends State<ApplicantListItem> {
  // TODO: retrieve scores for contest applicant and listen for updates

  List<int> scores = [0, 1, 3, 4];
  @override
  Widget build(BuildContext context) {
    const grades = ["A+", "A", "A-", "B+", "B", "B-"];
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          _gotoDetailsPage(context);
        },
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                width: 4,
                color: widget.applicant.groupID % 2 == 0
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.primary),
          ),
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    widget.applicant.name,
                    style: Theme.of(context).textTheme.headline6,
                    overflow: TextOverflow.fade,
                    softWrap: false,
                  ),
                ),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 1,
                  children: [
                    Hero(
                      tag:
                          '${widget.applicant.name}-${widget.applicant.groupID}-selected-achievement',
                      child: GradeBox(
                        grade: grades[scores[0]],
                      ),
                    ),
                    Hero(
                      tag:
                          '${widget.applicant.name}-${widget.applicant.groupID}-selected-technical',
                      child: GradeBox(
                        grade: grades[scores[1]],
                      ),
                    ),
                    Hero(
                      tag:
                          '${widget.applicant.name}-${widget.applicant.groupID}-selected-academic',
                      child: GradeBox(
                        grade: grades[scores[2]],
                      ),
                    ),
                    Hero(
                      tag:
                          '${widget.applicant.name}-${widget.applicant.groupID}-selected-personality',
                      child: GradeBox(
                        grade: grades[scores[3]],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _gotoDetailsPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: AppBar(
            title: Text(widget.applicant.name),
            backgroundColor: widget.applicant.groupID % 2 == 0
                ? Theme.of(context).colorScheme.secondary
                : Theme.of(context).colorScheme.primary,
            foregroundColor: Colors.white,
          ),
          body: ApplicantCard(
              card: ScoreCard(
                  applicant: widget.applicant,
                  contest: widget.contest,
                  author: "Caroline Yoon",
                  scores: scores)),
        ),
      ),
    );
  }
}
