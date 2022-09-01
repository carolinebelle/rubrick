import 'package:flutter/material.dart';
import 'package:rubrick/components/progress_bar.dart';

class PageOne extends StatefulWidget {
  final Function callback;
  final Function setPage;
  const PageOne({Key? key, required this.callback, required this.setPage})
      : super(key: key);

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  int numCategories = 1;
  int numGroups = 1;
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
            const ProgressBar(page: 1),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "Event Title",
                  filled: true,
                  fillColor: colors.secondary.withAlpha(100)),
            ),
            const SizedBox(height: 20),
            for (int i = 0; i < numCategories; i++)
              TextFormField(
                key: Key("Category ${i + 1}"),
                decoration: InputDecoration(
                    hintText: "Category ${i + 1}",
                    filled: true,
                    fillColor: colors.primary.withAlpha(100)),
              ),
            IconButton(
                onPressed: () {
                  setState(() {
                    numCategories += 1;
                  });
                },
                icon: const Icon(Icons.add)),
            for (int i = 0; i < numGroups; i++)
              TextFormField(
                key: Key("Applicant Group ${i + 1}"),
                decoration: InputDecoration(
                  hintText: "Applicant Group ${i + 1}",
                  filled: true,
                  fillColor: colors.primary.withAlpha(100),
                ),
              ),
            IconButton(
                onPressed: () {
                  setState(() {
                    numGroups += 1;
                  });
                },
                icon: const Icon(Icons.add)),
          ],
        ),
        TextButton(
          onPressed: () {
            widget.setPage(2);
          },
          child: const Text('next'),
        ),
      ],
    );
  }
}
