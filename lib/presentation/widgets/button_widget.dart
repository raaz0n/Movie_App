import 'package:flutter/material.dart';
import 'package:movie_app/common/screenUtils/size_config.dart';
import 'package:movie_app/presentation/screen/app_localization.dart';

import '../../common/constants/size_constant.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const Button({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(Sizes.dimen_50),
      width: double.infinity,
      decoration: BoxDecoration(
        // gradient: const LinearGradient(
        //   colors: [
        //     AppColor.royalBlue,
        //     AppColor.violet,
        //   ],
        // ),
        borderRadius: BorderRadius.all(
          Radius.circular(getProportionateScreenWidth(Sizes.dimen_20)),
        ),
      ),
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(Sizes.dimen_16)),
      margin: EdgeInsets.symmetric(
          vertical: getProportionateScreenHeight(Sizes.dimen_10)),
      // height: getProportionateScreenHeight(Sizes.dimen_16),
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        child: Text(
          AppLocalizations.of(context)!.translate(text).toString(),
          style: Theme.of(context).textTheme.button,
        ),
      ),
    );
  }
}
