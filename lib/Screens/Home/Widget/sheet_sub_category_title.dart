import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intertrack/Utils/utils.dart';

class SubCategoryTitle extends StatelessWidget {
  const SubCategoryTitle(
    this.icondata,
    this.title,
  );

  final IconData icondata;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FaIcon(
          icondata,
          size: Responsive().largeW,
        ),
        SizedBox(
          width: Responsive().smallW,
        ),
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
