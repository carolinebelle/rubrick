import 'package:flutter/material.dart';
import '../components/group_bar.dart';
import '../models/contest.dart';

class ContestScreen extends StatelessWidget {
  final Contest contest;
  const ContestScreen({Key? key, required this.contest}) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                child: SafeArea(
                  child: Text(
                    contest.title,
                    style: Theme.of(context).textTheme.headline4!.apply(
                        fontWeightDelta: 3,
                        color: Theme.of(context).colorScheme.onBackground),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                  primary: false,
                  itemBuilder: (context, index) =>
                      GroupBar(contest: contest, index: index),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                  itemCount: contest.groups.length),
            ),
          ],
        ),
      );
}
