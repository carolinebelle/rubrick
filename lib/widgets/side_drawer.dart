import "package:flutter/material.dart";
import 'package:rubrick/components/contest_list_item.dart';
import 'package:rubrick/widgets/create_contest.dart';

//  Side drawer can be in list mode or create mode
const contestTitles = ["Fellows 2022-23", "Fellows 2023-34"];

class SideDrawer extends StatefulWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  State<SideDrawer> createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  bool isCreating = false;
  String selected = "Fellows 2022-23";

  void createCallback(bool isCreating) {
    setState(
      () {
        this.isCreating = isCreating;
      },
    );
  }

  void contestCallback(String contestID) {
    setState(
      () {
        selected = contestID;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return isCreating ? buildCreateFlow() : buildContestList(context, selected);
  }

  Widget buildContestList(BuildContext context, String selected) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: TextButton(
                  onPressed: () {
                    setState(
                      () {
                        isCreating = true;
                      },
                    );
                  },
                  child: const Text(
                    'Create New',
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                primary: false,
                itemCount: contestTitles.length,
                itemBuilder: (context, index) => ContestListItem(
                  title: contestTitles[index],
                  callback: contestCallback,
                  selected: contestTitles[index] == selected,
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
        callback: createCallback,
      );
}
