import 'package:flutter/material.dart';

class RoundedBorder extends StatelessWidget {
  final Widget child;
  final int group;
  const RoundedBorder({Key? key, required this.child, required this.group})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        color: colors.background,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
            width: 4,
            color: group % 2 == 0
                ? colors.secondary
                : group % 3 == 0
                    ? colors.tertiary
                    : colors.primary),
      ),
      child: child,
    );
  }
}
