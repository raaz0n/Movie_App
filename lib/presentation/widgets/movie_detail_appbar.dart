import 'package:flutter/material.dart';
import 'package:movie_app/common/constants/size_constant.dart';
import 'package:movie_app/common/screenUtils/size_config.dart';

class MovieDetailAppBar extends StatelessWidget {
  const MovieDetailAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
                size: getProportionateScreenWidth(Sizes.dimen_20),
              ),
            ),
            Icon(
              Icons.favorite_border,
              color: Colors.white,
              size: getProportionateScreenWidth(Sizes.dimen_20),
            )
          ],
        ),
      ),
    );
  }
}
