import "package:flutter/material.dart";

//  3 step process to create a new "contest"

class CreateContest extends StatefulWidget {
  final Function callback;
  const CreateContest({Key? key, required this.callback}) : super(key: key);

  @override
  State<CreateContest> createState() => _CreateContestState();
}

class _CreateContestState extends State<CreateContest> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              widget.callback(false);
            },
            child: const Text('done'),
          ),
        ],
      ),
    );
  }
}
