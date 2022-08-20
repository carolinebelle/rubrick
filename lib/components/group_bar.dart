import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:rubrick/components/applicant_list_item.dart';
import 'package:rubrick/components/search_bar.dart';

const replaceWithFirebase = [
  "Greene",
  "Abramoqickldf",
  "John",
  "LSmith",
  "Tupak",
  "Lfdsf",
  "Orian",
  "Hernandez",
  "Turner",
  "Hutchinson",
  "Blimey",
];

class GroupBar extends StatefulWidget {
  final String title;
  final int index;
  const GroupBar({Key? key, required this.title, required this.index})
      : super(key: key);

  @override
  State<GroupBar> createState() => _GroupBarState();
}

class _GroupBarState extends State<GroupBar> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String searchText = "";
  bool isFiltered = false;
  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      child: Center(
        child: Expandable(
          collapsed: ExpandableButton(
            child: buildClosed(context),
          ),
          expanded: buildOpen(context),
        ),
      ),
    );
  }

  Widget buildClosed(context) => Container(
        color: widget.index % 2 == 0
            ? Theme.of(context).colorScheme.secondaryContainer
            : Theme.of(context).colorScheme.primaryContainer,
        height: 80,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(widget.title,
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .apply(fontWeightDelta: 2)),
              Icon(Icons.expand_circle_down,
                  color: Theme.of(context).colorScheme.onSecondaryContainer)
            ],
          ),
        ),
      );

  Widget buildOpen(context) => Form(
        key: _formKey,
        child: Container(
          color: widget.index % 2 == 0
              ? Theme.of(context).colorScheme.secondaryContainer
              : Theme.of(context).colorScheme.primaryContainer,
          width: double.infinity,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: Wrap(
              alignment: WrapAlignment.center,
              runSpacing: 5,
              children: [
                ExpandableButton(
                  child: Text(
                    widget.title,
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .apply(fontWeightDelta: 2),
                  ),
                ),
                SearchBar(
                  onChange: (value) {
                    setState(() {
                      searchText = value;
                    });
                  },
                  index: widget.index,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                        value: isFiltered,
                        activeColor: widget.index % 2 == 0
                            ? Theme.of(context).colorScheme.secondaryContainer
                            : Theme.of(context).colorScheme.primaryContainer,
                        onChanged: (bool? value) {
                          setState(() {
                            isFiltered = value!;
                          });
                        }),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isFiltered = !isFiltered;
                        });
                      },
                      child: Text(
                        "incomplete",
                        style: Theme.of(context).textTheme.subtitle1!.apply(
                            color: isFiltered
                                ? widget.index % 2 == 0
                                    ? Theme.of(context).colorScheme.secondary
                                    : Theme.of(context).colorScheme.primary
                                : Theme.of(context).colorScheme.background),
                      ),
                    ),
                  ],
                ),
                Wrap(
                    alignment: WrapAlignment.center,
                    runSpacing: 5,
                    children: buildApplicants()),
                ExpandableButton(
                  child: Transform.rotate(
                    angle: 180 * math.pi / 180,
                    child: IconButton(
                      icon: Icon(Icons.expand_circle_down,
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer),
                      onPressed: null,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  List<Widget> buildApplicants() {
    return replaceWithFirebase
        .where((applicant) {
          return applicant.toLowerCase().contains(searchText.toLowerCase());
        })
        .map((name) => ApplicantListItem(name: name))
        .toList();
  }
}
