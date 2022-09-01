import 'package:flutter/material.dart';

class ApplicantPhoto extends StatelessWidget {
  final String name;
  final int group;
  const ApplicantPhoto({Key? key, required this.name, required this.group})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            width: 4,
            color: group % 2 == 0
                ? Theme.of(context).colorScheme.secondary
                : Theme.of(context).colorScheme.primary),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: AspectRatio(
          aspectRatio: 1 / 1,
          child: Image.asset(
            name,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
