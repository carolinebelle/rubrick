import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final int page;
  const ProgressBar({Key? key, required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 15,
            width: 15,
            decoration: BoxDecoration(
                color: page == 1
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.primary,
                shape: BoxShape.circle),
          ),
          Container(
            height: 5,
            width: 80,
            decoration: BoxDecoration(
              color: page == 1
                  ? Theme.of(context).colorScheme.primaryContainer
                  : Theme.of(context).colorScheme.primary,
            ),
          ),
          Container(
            height: 15,
            width: 15,
            decoration: BoxDecoration(
                color: page == 1
                    ? Theme.of(context).colorScheme.primaryContainer
                    : page == 2
                        ? Theme.of(context).colorScheme.secondary
                        : Theme.of(context).colorScheme.primary,
                shape: BoxShape.circle),
          ),
          Container(
            height: 5,
            width: 80,
            decoration: BoxDecoration(
                color: page == 3
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.primaryContainer),
          ),
          Container(
            height: 15,
            width: 15,
            decoration: BoxDecoration(
                color: page == 3
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.primaryContainer,
                shape: BoxShape.circle),
          ),
        ],
      ),
    );
  }
}
