import 'package:flutter/material.dart';

import '../widgets/applicant_card.dart';
import 'grade_box.dart';

const gradeIndices = [0, 1, 3, 4];
const grades = ["A+", "A", "A-", "B+", "B", "B-"];

class ApplicantListItem extends StatefulWidget {
  final String name;
  final int groupIndex;
  const ApplicantListItem(
      {Key? key, required this.name, required this.groupIndex})
      : super(key: key);

  @override
  State<ApplicantListItem> createState() => _ApplicantListItemState();
}

class _ApplicantListItemState extends State<ApplicantListItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _gotoDetailsPage(context, widget.name, widget.groupIndex, gradeIndices);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              width: 4,
              color: widget.groupIndex % 2 == 0
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
                  widget.name,
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
                        '${widget.name}-${widget.groupIndex}-selected-achievement',
                    child: GradeBox(
                      grade: grades[gradeIndices[0]],
                    ),
                  ),
                  Hero(
                    tag:
                        '${widget.name}-${widget.groupIndex}-selected-technical',
                    child: GradeBox(
                      grade: grades[gradeIndices[1]],
                    ),
                  ),
                  Hero(
                    tag:
                        '${widget.name}-${widget.groupIndex}-selected-academic',
                    child: GradeBox(
                      grade: grades[gradeIndices[2]],
                    ),
                  ),
                  Hero(
                    tag:
                        '${widget.name}-${widget.groupIndex}-selected-personality',
                    child: GradeBox(
                      grade: grades[gradeIndices[3]],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _gotoDetailsPage(BuildContext context, String name, int groupIndex,
      List<int> gradeIndices) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: AppBar(
            title: Text(name),
            backgroundColor: groupIndex % 2 == 0
                ? Theme.of(context).colorScheme.secondary
                : Theme.of(context).colorScheme.primary,
            foregroundColor: Colors.white,
          ),
          body: ApplicantCard(
              groupIndex: groupIndex, name: name, gradeIndices: gradeIndices),
        ),
      ),
    );
  }
}
