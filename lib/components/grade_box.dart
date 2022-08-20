import 'package:flutter/material.dart';

class GradeBox extends StatelessWidget {
  final String grade;
  const GradeBox({Key? key, required this.grade}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiaryContainer,
        borderRadius: BorderRadiusDirectional.circular(10),
      ),
      child: Center(
        child: Text(
          grade,
          style: Theme.of(context).textTheme.headline4!.apply(
              color: Theme.of(context).colorScheme.primary, fontWeightDelta: 2),
        ),
      ),
    );
  }
}
