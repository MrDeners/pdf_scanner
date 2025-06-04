import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:core_ui/core_ui.dart';

class AppImage {
  static const String _pngFileRegex = r'.png$';
  static const double _defaultIconPadding = 0;

  final String iconKey;

  bool get isPNG => iconKey.contains(RegExp(_pngFileRegex));

  const AppImage(this.iconKey);

  static Widget callPath(
    AppColorsTheme colors, {
    required String path,
    VoidCallback? onTap,
    bool isLoading = false,
    double? size,
  }) {
    final Uri uri = Uri.parse(path);
    final bool isNetwork = uri.scheme == 'http' || uri.scheme == 'https' ? true : false;

    if (isNetwork) {
      return GestureDetector(
        onTap: onTap,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppDimens.borderRadiusMedium),
          child: Container(
            height: size,
            width: size,
            color: colors.secondary,
            child: isLoading
                ? const AppLoadingIndicator()
                : CachedNetworkImage(
                    imageUrl: path,
                    fit: BoxFit.cover,
                    errorWidget: (_, __, ___) => AppIcons.placeholder.call(),
                    placeholder: (_, __) => const AppLoadingIndicator(),
                  ),
          ),
        ),
      );
    } else {
      return GestureDetector(
        onTap: onTap,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppDimens.borderRadiusMedium),
          child: Container(
            height: size,
            width: size,
            color: colors.secondary,
            child: isLoading
                ? const AppLoadingIndicator()
                : path.isNotEmpty && File(path).existsSync()
                    ? Image.file(
                        File(path),
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => AppIcons.placeholder.call(),
                      )
                    : AppIcons.placeholder.call(),
          ),
        ),
      );
    }
  }

  Widget call({
    Color? color,
    double? size,
    BoxFit? fit,
    Function()? onTap,
    double padding = _defaultIconPadding,
    bool needClip = false,
    bool needShadow = false,
  }) {
    assert(
      isPNG,
      'Implemented only for png',
    );

    final BorderRadius borderRadius =
        needClip ? BorderRadius.circular(AppDimens.borderRadiusLarge) : BorderRadius.zero;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          boxShadow: needShadow ? <BoxShadow>[
            BoxShadow(
              color: Colors.black.withAlpha(20),
              blurRadius: 50,
              offset: const Offset(0, 3),
            ),
          ] : null,
        ),
        child: ClipRRect(
          borderRadius: borderRadius,
          child: Padding(
            padding: EdgeInsets.all(padding),
            child: Image.asset(
              iconKey,
              package: kPackageName,
              fit: fit ?? BoxFit.contain,
              width: size,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}
