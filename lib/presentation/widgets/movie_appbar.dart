import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/common/screenUtils/size_config.dart';

import '../../common/constants/size_constant.dart';

class MovieAppBar extends StatelessWidget {
  const MovieAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: getProportionateScreenHeight(Sizes.dimen_10),
          left: getProportionateScreenWidth(Sizes.dimen_16),
          right: getProportionateScreenWidth(Sizes.dimen_16)),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: SvgPicture.asset(
              "assets/svgs/menu.svg",
              height: getProportionateScreenHeight(Sizes.dimen_20),
            ),
          ),
          Expanded(
              child: Image.asset(
            "assets/pngs/logo.png",
            height: getProportionateScreenWidth(Sizes.dimen_14),
          )),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
      ),
    );
  }
}
