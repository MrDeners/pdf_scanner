import 'dart:async';

import 'package:in_app_review/in_app_review.dart';

final class RateService {
  static Future<void> requestRate() async {
    final InAppReview inAppReview = InAppReview.instance;

    if (await inAppReview.isAvailable()) {
      await inAppReview.requestReview();
    }
  }
}
