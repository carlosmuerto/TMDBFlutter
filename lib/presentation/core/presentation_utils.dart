import 'package:TMDBFlutter/generated/l10n.dart';
import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  S get s => S.of(this);
}

void doNothing() {}
