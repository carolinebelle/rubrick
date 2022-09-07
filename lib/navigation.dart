import 'package:flutter/material.dart';
import 'package:rubrick/pages/contest.dart';
import 'package:rubrick/widgets/side_drawer.dart';

import 'components/custom_fab.dart';
import 'mock.dart';
import 'models/contest.dart';
import 'responsive/dimensions.dart';
import 'widgets/rankable_list.dart';
import 'pages/round_table.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);
  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  bool isMyTurn = false; //based on Firebase data
  bool isRanking = true; //based on Firebase data
  bool isLive = true; //based on Firebase data
  Contest? contest;

  void _actionButtonPress() {
    print("To be implemented");
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < mobileWidth) {
          return _buildMobileBody(context);
        } else {
          return _buildDesktopBody(context);
        }
      },
    );
  }

  Widget _buildMobileBody(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;

    return Scaffold(
      drawer: Drawer(
        backgroundColor: colors.surface,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: const SideDrawer(),
      ),
      backgroundColor: colors.background,
      body: ContestScreen(contest: mockContest),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (isMyTurn) myTurnFAB(context, _actionButtonPress),
          if (isRanking)
            rankingFAB(context, () {
              _goToPage(
                  context,
                  RankableList(
                    cloudRankings: [...group1, ...group2],
                  ),
                  "Finalize Rankings");
            })
        ],
      ),
    );
  }

  Widget _buildDesktopBody(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colors.background,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: colors.tertiary.withAlpha(100),
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: const SideDrawer(),
            ),
          ),
          Flexible(
            flex: 3,
            child: ContestScreen(contest: mockContest),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (isMyTurn) myTurnFAB(context, _actionButtonPress),
          if (isLive) const SizedBox(height: 10),
          if (isLive)
            roundTableFAB(context, () {
              _goToPage(context, const RoundTable(), "Round Table");
            }),
          if (isRanking) const SizedBox(height: 10),
          if (isRanking)
            rankingFAB(context, () {
              _goToPage(
                  context,
                  RankableList(
                    cloudRankings: [...group1, ...group2],
                  ),
                  "Finalize Rankings");
            }),
        ],
      ),
    );
  }

  void _goToPage(BuildContext context, Widget body, String pageName) {
    ColorScheme colors = Theme.of(context).colorScheme;

    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => Scaffold(
          backgroundColor: colors.background,
          appBar: AppBar(
            title: Text(pageName),
            backgroundColor: colors.tertiary,
          ),
          body: body,
          floatingActionButton: votingFAB(context, _actionButtonPress),
        ),
      ),
    );
  }
}
