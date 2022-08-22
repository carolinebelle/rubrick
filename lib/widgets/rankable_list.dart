import 'package:flutter/material.dart';

import '../components/applicant_summary.dart';

class RankableList extends StatefulWidget {
  const RankableList({Key? key, required this.cloudRankings}) : super(key: key);
  final List<String> cloudRankings;

  @override
  State<RankableList> createState() => _RankableListState();
}

class _RankableListState extends State<RankableList> {
  bool isModified = false;
  final List<String> rankings = [
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

  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
      children: <Widget>[
        for (int index = 0; index < rankings.length; index += 1)
          ApplicantSummary(
            key: Key('$index'),
            rank: index + 1,
            name: rankings[index],
            modified: !(rankings[index] == widget.cloudRankings[index]),
          ),
      ],
      onReorder: (int oldIndex, int newIndex) {
        setState(() {
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          final String item = rankings.removeAt(oldIndex);
          rankings.insert(newIndex, item);
        });
      },
    );
  }
}
