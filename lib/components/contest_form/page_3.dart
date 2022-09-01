import 'package:flutter/material.dart';

import '../progress_bar.dart';

class PageThree extends StatefulWidget {
  final Function callback;
  final Function setPage;
  const PageThree({Key? key, required this.callback, required this.setPage})
      : super(key: key);

  @override
  State<PageThree> createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
  int numJudges = 1;
  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;
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
            const ProgressBar(page: 3),
            for (int i = 0; i < numJudges; i++)
              TextFormField(
                key: Key("Judge email ${i + 1}"),
                decoration: InputDecoration(
                    hintText: "Judge email ${i + 1}",
                    filled: true,
                    fillColor: colors.primary.withAlpha(100)),
              ),
            IconButton(
                onPressed: () {
                  setState(() {
                    numJudges += 1;
                  });
                },
                icon: const Icon(Icons.add)),
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
                  widget.setPage(2);
                },
                child: const Text('previous'),
              ),
              TextButton(
                onPressed: () {
                  widget.callback(false);
                },
                child: const Text('done'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
