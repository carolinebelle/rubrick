import "package:flutter/material.dart";

class ContestListItem extends StatelessWidget {
  final String title;
  final void Function(String contestID) callback;
  final bool selected;
  const ContestListItem(
      {Key? key,
      required this.title,
      required this.callback,
      required this.selected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;
    TextTheme text = Theme.of(context).textTheme;
    return Container(
      color: selected
          ? colors.onPrimary.withAlpha(200)
          : colors.onPrimary.withAlpha(100),
      child: InkWell(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Text(title,
                style: text.headline5!.apply(
                    color:
                        selected ? colors.onError : colors.onErrorContainer)),
          ),
        ),
        onTap: () {
          callback(title);
        },
      ),
    );
  }
}
