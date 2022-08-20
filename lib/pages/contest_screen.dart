import 'package:flutter/material.dart';

import '../components/group_bar.dart';

const replaceWithFirebase = ["Day 1: Saturday", "Day 2: Sunday"];

class ContestScreen extends StatelessWidget {
  final String contestID;
  const ContestScreen({Key? key, required this.contestID}) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).colorScheme.background,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                child: SafeArea(
                    child: Text(
                  contestID,
                  style: Theme.of(context).textTheme.headline4!.apply(
                      fontWeightDelta: 3,
                      color: Theme.of(context).colorScheme.onBackground),
                )),
              ),
            ),
            Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) => GroupBar(
                        title: replaceWithFirebase[index], index: index),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
                    itemCount: 2))
          ],
        ),
      );
}
