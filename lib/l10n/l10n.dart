import 'package:flutter/widgets.dart';
import 'package:piero_morales_alcalde/l10n/gen/app_localizations.dart';

export 'package:piero_morales_alcalde/l10n/gen/app_localizations.dart';

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
