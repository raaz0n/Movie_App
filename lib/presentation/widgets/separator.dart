import 'package:flutter/material.dart';
import 'package:movie_app/common/screenUtils/size_config.dart';

import '../../common/constants/size_constant.dart';
import '../themes/theme_color.dart';

class Separator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(Sizes.dimen_1),
      width: getProportionateScreenWidth(Sizes.dimen_80),
      padding: EdgeInsets.only(
        top: getProportionateScreenHeight(Sizes.dimen_2),
        bottom: getProportionateScreenHeight(Sizes.dimen_6),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
            Radius.circular(getProportionateScreenHeight(Sizes.dimen_1))),
        gradient: const LinearGradient(
          colors: [
            AppColor.violet,
            AppColor.royalBlue,
          ],
        ),
      ),
    );
  }
}
