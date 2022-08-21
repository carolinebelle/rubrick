import "package:flutter/material.dart";
import 'package:rubrick/components/category_bar.dart';

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
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: Container(
                  height: 160,
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 4,
                        color: widget.groupIndex % 2 == 0
                            ? Theme.of(context).colorScheme.secondary
                            : Theme.of(context).colorScheme.primary),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      'lib/assets/profile.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                )),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.separated(
                  itemBuilder: ((context, index) => CategoryBar(
                        gradeIndexSelected: widget.gradeIndices[index],
                        tag:
                            "${widget.name}-${widget.groupIndex}-selected-${widget.categories[index]}",
                        groupIndex: widget.groupIndex,
                        title: widget.categoryTitles[index],
                      )),
                  separatorBuilder: ((context, index) => const SizedBox(
                        height: 10,
                      )),
                  itemCount: 4),
            )
          ],
        ),
      ),
    );
  }
}
