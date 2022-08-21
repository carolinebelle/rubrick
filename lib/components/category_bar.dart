import 'package:flutter/material.dart';

import 'grade_picker.dart';

class CategoryBar extends StatefulWidget {
  final int gradeIndexSelected;
  final String tag;
  final int groupIndex;
  final String title;
  const CategoryBar(
      {Key? key,
      required this.gradeIndexSelected,
      required this.tag,
      required this.groupIndex,
      required this.title})
      : super(key: key);

  @override
  State<CategoryBar> createState() => _CategoryBarState();
}

class _CategoryBarState extends State<CategoryBar> {
  bool open = false;
  String notes = "";
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: widget.groupIndex % 2 == 0
                  ? Theme.of(context).colorScheme.secondary.withAlpha(26)
                  : Theme.of(context).colorScheme.primary.withAlpha(26)),
          child: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      open = !open;
                    });
                  },
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      widget.title,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                if (open) _buildOpen(context),
                GradePicker(
                    gradeIndexSelected: widget.gradeIndexSelected,
                    tag: widget.tag)
              ],
            ),
          ),
        ),
        Positioned(
          right: 5,
          top: 2,
          child: GestureDetector(
            onTap: () {
              setState(() {
                open = !open;
              });
            },
            child: Icon(open ? Icons.expand_less : Icons.expand_more,
                color: Theme.of(context).colorScheme.onSecondary),
          ),
        ),
      ],
    );
  }

  Widget _buildOpen(BuildContext context) => Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: widget.groupIndex % 2 == 0
              ? Theme.of(context)
                  .colorScheme
                  .onSecondaryContainer
                  .withAlpha(200)
              : Theme.of(context)
                  .colorScheme
                  .onPrimaryContainer
                  .withAlpha(200)),
      child: Padding(
          padding: const EdgeInsets.all(10),
          child: TextFormField(
            initialValue: notes,
            autofocus: true,
            onChanged: (value) {
              // widget.onChange(value);
              setState(() {
                notes = value;
              });
            },
            cursorColor: Theme.of(context).colorScheme.onSecondary,
            maxLines: null,
            decoration: InputDecoration(
              hintText: 'Notes...',
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .apply(color: Theme.of(context).colorScheme.onSecondary),
              border: InputBorder.none,
            ),
          )));
}
