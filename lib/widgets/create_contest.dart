import "package:flutter/material.dart";

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
    return SafeArea(child: _retrievePage(context, page));
  }

  Widget _retrievePage(BuildContext context, int pageNum) {
    switch (pageNum) {
      case 2:
        return _pageTwo(context);
      case 3:
        return _pageThree(context);
      default:
        return _pageOne(context);
    }
  }

  Widget _pageOne(BuildContext context) => Column(
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
              _progressBar(context, 1),
              Container(
                color: Colors.blue,
                child: const Padding(
                  padding: EdgeInsets.all(30),
                  child: Text('create contest flow'),
                ),
              ),
            ],
          ),
          TextButton(
            onPressed: () {
              setState(() {
                page = page + 1;
              });
            },
            child: const Text('next'),
          ),
        ],
      );
  Widget _pageTwo(BuildContext context) => Column(
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
              _progressBar(context, 2),
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
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      page = page - 1;
                    });
                  },
                  child: const Text('previous'),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      page = page + 1;
                    });
                  },
                  child: const Text('next'),
                ),
              ],
            ),
          ),
        ],
      );

  Widget _pageThree(BuildContext context) => Column(
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
              _progressBar(context, 3),
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
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      page = page - 1;
                    });
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

  Widget _progressBar(BuildContext context, int page) => Padding(
        padding: const EdgeInsets.only(bottom: 10),
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
