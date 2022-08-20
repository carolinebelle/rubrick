import "package:flutter/material.dart";

class ContestListItem extends StatelessWidget {
  const ContestListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Theme.of(context).colorScheme.onSurface,
      title: Center(
          child: Text("Fellows 2022-23",
              style: Theme.of(context).textTheme.headline5)),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}
