import 'package:flutter/material.dart';

class NavigationHeader extends StatefulWidget {
  const NavigationHeader({Key? key}) : super(key: key);

  @override
  State<NavigationHeader> createState() => _NavigationHeaderState();
}

class _NavigationHeaderState extends State<NavigationHeader> {
  int page = 1;
  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;
    TextTheme text = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          splashColor: colors.tertiary,
          customBorder: const CircleBorder(),
          child: Icon(
            Icons.chevron_left,
            size: 50,
            color: colors.onBackground,
          ),
          onTap: () {
            setState(() {
              page -= 1;
            });
          },
        ),
        Text("1/12", style: text.headline6!.apply(color: colors.onBackground)),
        InkWell(
          splashColor: colors.tertiary,
          customBorder: const CircleBorder(),
          child:
              Icon(Icons.chevron_right, size: 50, color: colors.onBackground),
          onTap: () {
            setState(() {
              page += 1;
            });
          },
        ),
      ],
    );
  }
}
