import "package:flutter/material.dart";
import 'package:rubrick/components/contest_list_item.dart';
import 'package:rubrick/widgets/create_contest.dart';

import '../responsive/dimensions.dart';

//  Side drawer can be in list mode or create mode
const contestTitles = ["Fellows 2022-23", "Fellows 2023-34"];

class SideDrawer extends StatefulWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  State<SideDrawer> createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  bool isCreating = false;

  void callback(bool isCreating) {
    setState(() {
      this.isCreating = isCreating;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: isCreating ? buildCreateFlow() : buildContestList(context),
      );
    });
  }

  Widget buildContestList(BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SafeArea(
              child: TextButton(
                onPressed: () {
                  setState(() {
                    isCreating = true;
                  });
                },
                child: const Text(
                  'Create New',
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: contestTitles.length,
                itemBuilder: (context, index) => ContestListItem(
                  title: contestTitles[index],
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
              ),
            )
          ],
        ),
      );

  Widget buildCreateFlow() => CreateContest(
        callback: callback,
      );
}
