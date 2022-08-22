import 'package:flutter/material.dart';
import 'package:rubrick/components/grade_box.dart';

class ApplicantSummary extends StatelessWidget {
  final String name;
  final int rank;
  final bool modified;
  const ApplicantSummary(
      {Key? key,
      required this.name,
      required this.rank,
      required this.modified})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        height: 100,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 80,
              decoration: BoxDecoration(
                border: Border.all(
                    width: 4,
                    color: 1 % 2 == 0
                        ? Theme.of(context).colorScheme.secondary
                        : Theme.of(context).colorScheme.primary),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.asset(
                  'lib/assets/profile2.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 3),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: modified
                            ? 1 % 2 == 0
                                ? Theme.of(context)
                                    .colorScheme
                                    .secondaryContainer
                                : Theme.of(context).colorScheme.primaryContainer
                            : null,
                        border: Border.all(
                            width: 4,
                            color: 1 % 2 == 0
                                ? Theme.of(context).colorScheme.secondary
                                : Theme.of(context).colorScheme.primary),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          '$rank. $name',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 3),
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 4,
                            color: 1 % 2 == 0
                                ? Theme.of(context).colorScheme.secondary
                                : Theme.of(context).colorScheme.primary),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: const [
                            GradeBox(
                              grade: "A-",
                              isSmall: true,
                              hasBorder: true,
                            ),
                            GradeBox(
                              grade: "A-",
                              isSmall: true,
                              hasBorder: true,
                            ),
                            GradeBox(
                              grade: "A-",
                              isSmall: true,
                              hasBorder: true,
                            ),
                            GradeBox(
                              grade: "A-",
                              isSmall: true,
                              hasBorder: true,
                            )
                          ]),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
