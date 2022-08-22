import "package:flutter/material.dart";

class ContestListItem extends StatelessWidget {
  final String title;
  const ContestListItem({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Theme.of(context).colorScheme.onSurface,
      title: Center(
          child: Text(title, style: Theme.of(context).textTheme.headline5)),
      onTap: () {
        print("To be implemented");
      },
    );
  }
}
