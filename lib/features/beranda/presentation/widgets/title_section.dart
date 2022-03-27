import 'package:flutter/material.dart';
import 'package:shamo/core/utility/theme_helper.dart';

class TitleSection extends StatelessWidget {
  final String? title;
  const TitleSection({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: defaultMargin,
        left: defaultMargin,
        right: defaultMargin,
      ),
      child: Text(
        title!,
        style: primaryTextStyle.copyWith(
          fontSize: 22,
          fontWeight: semiBold,
        ),
      ),
    );
  }
}
