import "package:flutter/material.dart";
import 'package:rubrick/components/contest_list_item.dart';
import 'package:rubrick/widgets/create_contest.dart';

//  Side drawer can be in list mode or create mode

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
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: isCreating ? buildCreateFlow() : buildContestList(context),
    );
  }

  Widget buildContestList(BuildContext context) => Column(
        children: [
          Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isCreating = true;
                });
              },
              child: SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(Icons.add,
                        color: Theme.of(context).colorScheme.onBackground),
                    const Padding(padding: EdgeInsets.all(5)),
                    Text(
                      'Create New',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: 4,
              itemBuilder: (context, index) => const ContestListItem(),
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
            ),
          )
        ],
      );

  Widget buildCreateFlow() => CreateContest(
        callback: callback,
      );
}
