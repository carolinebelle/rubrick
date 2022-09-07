import 'package:flutter/material.dart';

FloatingActionButton rankingFAB(BuildContext context, Function navigate) =>
    FloatingActionButton(
      heroTag: "rank",
      onPressed: () {
        navigate(context);
      },
      tooltip: 'Adjust rankings',
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
      child: const Icon(Icons.format_list_numbered),
    );

FloatingActionButton myTurnFAB(BuildContext context, Function navigate) =>
    FloatingActionButton(
      heroTag: "turn",
      onPressed: navigate(),
      tooltip: 'End your turn',
      backgroundColor: Theme.of(context).colorScheme.secondary,
      foregroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
      child: const Icon(Icons.campaign),
    );

FloatingActionButton roundTableFAB(BuildContext context, Function navigate) =>
    FloatingActionButton(
      heroTag: "group",
      onPressed: () {
        navigate(context);
      },
      tooltip: 'Round table',
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
      child: const Icon(Icons.people),
    );

FloatingActionButton yesVoteFAB(BuildContext context, Function navigate) =>
    FloatingActionButton(
      heroTag: "yes",
      onPressed: navigate(),
      tooltip: 'Yes',
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      child: const Icon(Icons.thumb_up),
    );

FloatingActionButton noVoteFAB(BuildContext context, Function navigate) =>
    FloatingActionButton(
      heroTag: "no",
      onPressed: navigate(),
      tooltip: 'No',
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      foregroundColor: Theme.of(context).colorScheme.onTertiary,
      child: const Icon(Icons.thumb_down),
    );

Widget votingFAB(BuildContext context, Function navigate) => Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        yesVoteFAB(context, navigate),
        const SizedBox(height: 10),
        noVoteFAB(context, navigate)
      ],
    );
