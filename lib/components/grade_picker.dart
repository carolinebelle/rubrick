import 'package:flutter/material.dart';

import 'grade_box.dart';

class GradePicker extends StatefulWidget {
  final int gradeIndexSelected;
  final String tag;
  const GradePicker(
      {Key? key, required this.gradeIndexSelected, required this.tag})
      : super(key: key);

  @override
  State<GradePicker> createState() => _GradePickerState();
}

class _GradePickerState extends State<GradePicker> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.gradeIndexSelected;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: _getGradeRow(selectedIndex, widget.tag),
    );
  }

  List<Widget> _getGradeRow(int gradeIndexSelected, String tag) {
    const grades = ["A+", "A", "A-", "B+", "B", "B-"];
    return grades
        .asMap()
        .entries
        .map((entry) => entry.key == gradeIndexSelected
            ? Hero(
                tag: tag,
                child: GradeBox(
                  grade: entry.value,
                  isSmall: true,
                  hasBorder: true,
                ),
              )
            : GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = entry.key;
                  });
                },
                child: GradeBox(
                    grade: entry.value, isSelected: false, isSmall: true)))
        .toList();
  }
}
