import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import 'package:rubrick/components/applicant_list_item.dart';
import 'package:rubrick/components/search_bar.dart';

import '../models/contest.dart';

class GroupBar extends StatefulWidget {
  final Contest contest;
  final int index;
  const GroupBar({Key? key, required this.contest, required this.index})
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
    String title = widget.contest.groups[widget.index];

    List<Widget> buildApplicants() {
      return widget.contest.applicants
          .where((applicant) {
            if (applicant.groupID != widget.index) return false;
            return applicant.name
                .toLowerCase()
                .contains(searchText.toLowerCase());
          })
          .map((applicant) =>
              ApplicantListItem(applicant: applicant, contest: widget.contest))
          .toList();
    }

    Widget buildClosed(context) => Container(
          color: widget.index % 2 == 0
              ? Theme.of(context).colorScheme.secondaryContainer
              : Theme.of(context).colorScheme.primaryContainer,
          height: 80,
          width: double.infinity,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title,
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .apply(fontWeightDelta: 2)),
                Icon(Icons.expand_more,
                    color: Theme.of(context).colorScheme.onSecondary)
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
                      title,
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
                                  : Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer),
                        ),
                      ),
                    ],
                  ),
                  Wrap(
                      alignment: WrapAlignment.center,
                      runSpacing: 5,
                      children: buildApplicants()),
                  ExpandableButton(
                    child: IconButton(
                      mouseCursor: SystemMouseCursors.click,
                      icon: Icon(Icons.expand_less,
                          color: Theme.of(context).colorScheme.onSecondary),
                      onPressed: null,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );

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
}
