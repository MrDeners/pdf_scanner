import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/src/widgets/ui_kit/inputs/app_text_field/app_text_field_mapper.dart';
import 'package:flutter/services.dart';

export 'app_text_field_style_enum.dart';

class AppTextField extends StatefulWidget {
  final String? title;
  final String? hint;
  final String? error;
  final AppTextFieldStyle style;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool isObscured;
  final bool isEnabled;
  final Widget? postfix;
  final Widget? suffixIcon;

  const AppTextField({
    required this.controller,
    this.style = AppTextFieldStyle.primary,
    this.isObscured = false,
    this.isEnabled = true,
    this.title,
    this.postfix,
    this.suffixIcon,
    this.hint,
    this.error,
    this.keyboardType,
    this.inputFormatters,
    super.key,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;

    final Color backgroundColor = AppTextFieldMapper.getBackgroundColor(
      colors: colors,
      style: widget.style,
    );

    final Color borderColor = AppTextFieldMapper.getBorderColor(
      colors: colors,
      style: widget.style,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (widget.title != null) ...<Widget>[
          Text(
            widget.title ?? '',
            style: AppFonts.h5,
          ),
          const SizedBox(height: AppDimens.spacerExtraSmall),
        ],
        SizedBox(
          child: TextField(
            controller: widget.controller,
            focusNode: _focusNode,
            obscureText: widget.isObscured,
            keyboardType: widget.keyboardType,
            inputFormatters: widget.inputFormatters,
            cursorColor: colors.secondary,
            style: AppFonts.h4.copyWith(color: colors.onSecondary),
            decoration: InputDecoration(
              suffixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppDimens.defaultPagePadding),
                child: widget.postfix,
              ),
              suffixIconConstraints: const BoxConstraints(
                maxHeight: AppDimens.defaultControlHeight * 0.5,
              ),
              fillColor: backgroundColor,
              filled: true,
              hintText: widget.hint ?? LocaleKeys.common_inputHint.watchTr(context),
              hintStyle: AppFonts.h4.copyWith(color: colors.onSecondaryLightest),
              errorText: widget.error?.isNotEmpty ?? false ? widget.error : null,
              enabled: widget.isEnabled,
              errorStyle: AppFonts.h5,
              errorMaxLines: 1,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor),
                borderRadius: BorderRadius.circular(AppDimens.borderRadiusMedium),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor),
                borderRadius: BorderRadius.circular(AppDimens.borderRadiusMedium),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor),
                borderRadius: BorderRadius.circular(AppDimens.borderRadiusMedium),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
}
