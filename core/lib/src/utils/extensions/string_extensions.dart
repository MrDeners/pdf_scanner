import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';

extension StringSpacer on String {
  String insertMiddleSpace() {
    if (length < 2) return this;

    final int midIndex = length ~/ 2;
    final String result = '${substring(0, midIndex)} ${substring(midIndex)}';

    return result;
  }
}

extension LocaleObserver on String {
  String watchTr(BuildContext context, {
    List<String>? args,
    Map<String, String>? namedArgs,
    String? gender,
  }) {
    context.locale;
    return this.tr(args: args, namedArgs: namedArgs, gender: gender);
  }

  String watchTrIfNotEmpty(BuildContext context, {
    List<String>? args,
    Map<String, String>? namedArgs,
    String? gender,
  }) {
    if (isNotEmpty) {
      context.locale;
      return this.tr(args: args, namedArgs: namedArgs, gender: gender);
    }

    return this;
  }
}
