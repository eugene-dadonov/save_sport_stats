import 'package:flutter/material.dart';
import 'package:sport_stats_live/locales/locale_helper/l10n.dart';

String? isNotNullOrEmpty(BuildContext context, String? value) {
  if (value == null || value.length == 0) {
    return HelperLocale.of(context).errorFieldMustBeFilled;
  }
}
