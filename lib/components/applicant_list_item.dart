import 'package:flutter/material.dart';

import 'grade_box.dart';

class ApplicantListItem extends StatefulWidget {
  final String name;
  const ApplicantListItem({Key? key, required this.name}) : super(key: key);

  @override
  State<ApplicantListItem> createState() => _ApplicantListItemState();
}

class _ApplicantListItemState extends State<ApplicantListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              width: 4, color: Theme.of(context).colorScheme.onBackground)),
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
              children: const [
                GradeBox(
                  grade: 'A-',
                ),
                GradeBox(
                  grade: 'B+',
                ),
                GradeBox(
                  grade: 'B-',
                ),
                GradeBox(
                  grade: 'A+',
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
