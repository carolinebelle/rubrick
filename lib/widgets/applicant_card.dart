import "package:flutter/material.dart";
import 'package:rubrick/components/applicant_photo.dart';
import 'package:rubrick/components/category_bar.dart';
import '../models/score_card.dart';
import '../responsive/dimensions.dart';

class ApplicantCard extends StatefulWidget {
  final ScoreCard card;
  const ApplicantCard({Key? key, required this.card}) : super(key: key);

  @override
  State<ApplicantCard> createState() => _ApplicantCardState();
}

class _ApplicantCardState extends State<ApplicantCard> {
  @override
  Widget build(BuildContext context) {
    String name = widget.card.applicant.name;
    int groupID = widget.card.applicant.groupID;
    List<int> scores = widget.card.scores;
    List<String> categories = widget.card.contest.categories;

    Widget mobileBody = ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              child: ApplicantPhoto(
                  name: 'lib/assets/profile.png', group: groupID),
            ),
          ),
        ),
        const SizedBox(height: 10),
        for (int index = 0; index < categories.length; index += 1)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: CategoryBar(
              gradeIndexSelected: scores[index],
              tag: "$name-$groupID-selected-${categories[index]}",
              groupID: groupID,
              title: categories[index],
            ),
          )
      ],
    );

    Widget desktopBody = Padding(
      padding: const EdgeInsets.all(50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Flexible(
              child: ApplicantPhoto(
                  name: 'lib/assets/profile.png', group: groupID)),
          const SizedBox(width: 50),
          Flexible(
            child: Center(
              child: ListView(
                primary: false,
                children: [
                  for (int index = 0; index < categories.length; index += 1)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: CategoryBar(
                        gradeIndexSelected: scores[index],
                        tag: "$name-$groupID-selected-${categories[index]}",
                        groupID: groupID,
                        title: categories[index],
                      ),
                    )
                ],
              ),
            ),
          ),
        ],
      ),
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > mobileWidth) {
          return desktopBody;
        } else {
          return mobileBody;
        }
      },
    );
  }
}
