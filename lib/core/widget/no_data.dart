
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../shared/text_styles.dart';

class WidgetNoData extends StatelessWidget {
  final String name;
  const WidgetNoData({
    super.key, required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/svg/noData.svg'),
            Text(
              '$name',
              style: TextStyles.font22mainColorW600,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
