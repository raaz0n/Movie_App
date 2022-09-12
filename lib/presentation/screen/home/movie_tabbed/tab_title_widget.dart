import 'package:flutter/material.dart';
import 'package:movie_app/common/screenUtils/size_config.dart';
import 'package:movie_app/presentation/screen/app_localization.dart';

import '../../../../common/constants/size_constant.dart';
import '../../../themes/theme_color.dart';

class TabTitleWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isSelected;

  const TabTitleWidget({
    Key? key,
    required this.title,
    required this.onTap,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border(
            bottom: BorderSide(
              color: isSelected ? AppColor.royalBlue : Colors.transparent,
              width: getProportionateScreenHeight(Sizes.dimen_1),
            ),
          ),
        ),
        child: Text(
          AppLocalizations.of(context)!.translate(title).toString(),
          style: isSelected
              ? const TextStyle(color: AppColor.royalBlue)
              : const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
