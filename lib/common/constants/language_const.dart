import 'package:flutter/material.dart';

import '../../presentation/screen/app_localization.dart';

String? getTranslated(BuildContext context, String key) {
  return AppLocalizations.of(context)!.translate(key) ?? "***";
}
