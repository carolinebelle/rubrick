import 'package:flutter/material.dart';

class GradeBox extends StatelessWidget {
  final String grade;
  final bool isSelected;
  final bool isSmall;
  final bool hasBorder;
  const GradeBox(
      {Key? key,
      required this.grade,
      this.isSelected = true,
      this.isSmall = false,
      this.hasBorder = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isSmall ? 45 : 50,
      width: isSmall ? 45 : 50,
      decoration: BoxDecoration(
        color: isSelected
            ? Theme.of(context).colorScheme.tertiaryContainer
            : Theme.of(context).colorScheme.tertiaryContainer.withAlpha(0),
        borderRadius: BorderRadius.circular(10),
        border: hasBorder
            ? Border.all(
                color: Theme.of(context).colorScheme.onTertiary, width: 3)
            : null,
      ),
      child: Center(
        child: Text(
          grade,
          style: (isSmall
                  ? Theme.of(context).textTheme.headline6
                  : Theme.of(context).textTheme.headline5)!
              .apply(
                  color: Theme.of(context).colorScheme.onTertiary,
                  fontWeightDelta: 2),
        ),
      ),
    );
  }
}
