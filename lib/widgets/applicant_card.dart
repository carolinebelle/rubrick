import "package:flutter/material.dart";
import 'package:rubrick/components/applicant_photo.dart';
import 'package:rubrick/components/category_bar.dart';

import '../responsive/dimensions.dart';

// detailed view of an applicant
class ApplicantCard extends StatefulWidget {
  final String name;
  final int groupIndex;
  final List<int> gradeIndices;
  final List<String> categories = const [
    "achievement",
    "technical",
    "academic",
    "personality"
  ];
  final List<String> categoryTitles = const [
    "Achievements",
    "Technical Ability",
    "Academic Potential",
    "Personality"
  ];
  const ApplicantCard(
      {Key? key,
      required this.name,
      required this.groupIndex,
      required this.gradeIndices})
      : super(key: key);

  @override
  State<ApplicantCard> createState() => _ApplicantCardState();
}

class _ApplicantCardState extends State<ApplicantCard> {
  @override
  Widget build(BuildContext context) {
    Widget mobileBody = ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.25,
                child: ApplicantPhoto(
                    name: 'lib/assets/profile.png', group: widget.groupIndex)),
          ),
        ),
        const SizedBox(height: 10),
        for (int index = 0; index < widget.categories.length; index += 1)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: CategoryBar(
              gradeIndexSelected: widget.gradeIndices[index],
              tag:
                  "${widget.name}-${widget.groupIndex}-selected-${widget.categories[index]}",
              groupIndex: widget.groupIndex,
              title: widget.categoryTitles[index],
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
                  name: 'lib/assets/profile.png', group: widget.groupIndex)),
          const SizedBox(width: 50),
          Flexible(
            child: Center(
              child: ListView(
                primary: false,
                children: [
                  for (int index = 0;
                      index < widget.categories.length;
                      index += 1)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: CategoryBar(
                        gradeIndexSelected: widget.gradeIndices[index],
                        tag:
                            "${widget.name}-${widget.groupIndex}-selected-${widget.categories[index]}",
                        groupIndex: widget.groupIndex,
                        title: widget.categoryTitles[index],
                      ),
                    )
                ],
              ),
            ),
          ),
        ],
      ),
    );

    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > mobileWidth) {
        return desktopBody;
      } else {
        return mobileBody;
      }
    });
  }
}
