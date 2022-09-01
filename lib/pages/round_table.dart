import 'package:flutter/material.dart';
import 'package:rubrick/components/applicant_photo.dart';
import 'package:rubrick/components/grade_box.dart';
import 'package:rubrick/components/rounded_border.dart';

import '../components/navigation_header.dart';
import '../widgets/judge_card/judge_card.dart';

class RoundTable extends StatefulWidget {
  const RoundTable({Key? key}) : super(key: key);

  @override
  State<RoundTable> createState() => _RoundTableState();
}

class _RoundTableState extends State<RoundTable> {
  String firstName = "John";
  String lastName = "Doe";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Expanded(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: NavigationHeader(),
          ),
        ),
        Expanded(
            flex: 12,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(child: _buildSideBar(context)),
                Expanded(
                  flex: 4,
                  child: Padding(
                      padding: const EdgeInsets.all(10), child: JudgeCard()),
                ),
              ],
            ))
      ],
    );
  }

  Widget _buildSideBar(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: ApplicantPhoto(name: 'lib/assets/profile2.jpg', group: 1),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: RoundedBorder(
                group: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Applicant Name",
                        style: Theme.of(context).textTheme.headline5),
                    const GradeBox(
                      grade: "A+",
                      hasBorder: true,
                    )
                  ],
                ),
              ),
            ),
          ),
          const Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: RoundedBorder(
                group: 1,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Long thing about the candidate goes here. Long thing about the candidate goes here. Long thing about the candidate goes here. Long thing about the candidate goes here.Long thing about the candidate goes here.Long thing about the candidate goes here. Long thing about the candidate goes here. Long thing about the candidate goes here. Long thing about the candidate goes here. Long thing about the candidate goes here. Long thing about the candidate goes here.",
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
            ),
          ),
        ],
      );
}
