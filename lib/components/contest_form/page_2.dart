import 'package:flutter/material.dart';

import '../progress_bar.dart';

class PageTwo extends StatefulWidget {
  final Function callback;
  final Function setPage;
  const PageTwo({Key? key, required this.callback, required this.setPage})
      : super(key: key);

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            TextButton(
              onPressed: () {
                widget.callback(false);
              },
              child: const Text('cancel'),
            ),
            const ProgressBar(page: 2),
            Container(
              color: Colors.blue,
              child: const Padding(
                padding: EdgeInsets.all(30),
                child: Text('create contest flow'),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              TextButton(
                onPressed: () {
                  widget.setPage(1);
                },
                child: const Text('previous'),
              ),
              TextButton(
                onPressed: () {
                  widget.setPage(3);
                },
                child: const Text('next'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
