import "package:flutter/material.dart";
import 'package:rubrick/components/contest_form/page_1.dart';
import 'package:rubrick/components/contest_form/page_2.dart';
import 'package:rubrick/components/contest_form/page_3.dart';
import 'package:rubrick/components/progress_bar.dart';

//  3 step process to create a new "contest"

class CreateContest extends StatefulWidget {
  final Function callback;
  const CreateContest({Key? key, required this.callback}) : super(key: key);

  @override
  State<CreateContest> createState() => _CreateContestState();
}

class _CreateContestState extends State<CreateContest> {
  int page = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: _retrievePage(context, page),
      ),
    );
  }

  Widget _retrievePage(BuildContext context, int pageNum) {
    switch (pageNum) {
      case 2:
        return PageTwo(
            callback: widget.callback,
            setPage: (page) {
              setState(() {
                this.page = page;
              });
            });
      case 3:
        return PageThree(
            callback: widget.callback,
            setPage: (page) {
              setState(() {
                this.page = page;
              });
            });
      default:
        return PageOne(
            callback: widget.callback,
            setPage: (page) {
              setState(() {
                this.page = page;
              });
            });
    }
  }
}
