import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  final Function onChange;
  final int index;
  const SearchBar({Key? key, required this.onChange, required this.index})
      : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: widget.index % 2 == 0
            ? Theme.of(context).colorScheme.secondaryContainer
            : Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
          child: TextFormField(
            onChanged: (value) {
              widget.onChange(value);
            },
            cursorColor: Theme.of(context).colorScheme.background,
            maxLines: 1,
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.search,
                  color: Theme.of(context).colorScheme.background),
              suffixIconColor: Theme.of(context).colorScheme.background,
              hintText: 'Search for an applicant',
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .apply(color: Theme.of(context).colorScheme.background),
              border: InputBorder.none,
              isDense: true,
            ),
          ),
        ),
      ),
    );
  }
}
