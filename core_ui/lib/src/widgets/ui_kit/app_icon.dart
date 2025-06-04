import 'package:core_ui/core_ui.dart';
import 'package:flutter_svg/svg.dart';

class AppIcon {
  static const String _svgFileRegex = r'.svg$';
  static const double _iconSize = AppDimens.iconSizeMedium;

  final String iconKey;

  bool get isSVG => iconKey.contains(RegExp(_svgFileRegex));

  const AppIcon(this.iconKey);

  Widget call({
    Color? color,
    double size = _iconSize,
    BoxFit? fit,
    Function()? onTap,
    double padding = 0,
  }) {
    assert(
      isSVG,
      'Implemented only for svg',
    );

    return Builder(
      builder: (BuildContext context) {
        return Theme(
          data: context.theme.copyWith(splashFactory: NoSplash.splashFactory),
          child: InkWell(
            borderRadius: BorderRadius.circular(size + padding),
            onTap: onTap,
            child: Padding(
              padding: EdgeInsets.all(padding),
              child: SvgPicture.asset(
                iconKey,
                package: kPackageName,
                colorFilter: color != null
                    ? ColorFilter.mode(
                        color,
                        BlendMode.srcIn,
                      )
                    : null,
                fit: fit ?? BoxFit.contain,
                height: size,
                width: size,
              ),
            ),
          ),
        );
      },
    );
  }
}
