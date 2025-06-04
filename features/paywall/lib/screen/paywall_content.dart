import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:paywall/bloc/paywall_bloc.dart';
import 'package:paywall/widgets/product_tile.dart';

class PaywallContent extends StatelessWidget {
  const PaywallContent({super.key});

  static const double _betweenSpacer = AppDimens.spacerLargest;

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;

    final PaywallBloc bloc = context.read<PaywallBloc>();

    return BlocBuilder<PaywallBloc, PaywallState>(
      builder: (BuildContext context, PaywallState state) {
        final List<ProductTile> items = List<ProductTile>.generate(
          //TODO: Uncomment after adding api key
          // bloc.state.offering?.availablePackages.length ?? 0,
          2,
              (int index) =>
              ProductTile(
                //TODO: Uncomment after adding api key
                // title: bloc.state.offering?.availablePackages[index].storeProduct.title ?? '',
                // description: bloc.state.offering?.availablePackages[index].storeProduct.description ?? '',
                // price: bloc.state.offering?.availablePackages[index].storeProduct.price.toString() ?? '',
                // isSelected: index == bloc.state.selectedIndex,
                title: 'Week',
                description: '3-Day Free Trial',
                price: '1.99\$',
                isSelected: index == bloc.state.selectedIndex,
                onTap: () => bloc.add(ChangeSelectedIndex(index)),
              ),
        );

        return AppScaffold(
          hasAppBar: false,
          hasScrollBody: false,
          hasPadding: false,
          isLoading: state.isLoading,
          content: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child: AppImages.pattern.call(),
              ),
              Align(
                alignment: Alignment.topRight,
                child: AppIcons.close.call(onTap: () => bloc.add(const NavigateBack())),
              ),
              Align(
                heightFactor: 2,
                child: AppImages.paywall.call(),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: AppDimens.defaultPagePadding * 1.5,),
                    child: LayoutBuilder(
                      builder: (BuildContext context, BoxConstraints constraints) {
                        return ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: constraints.maxWidth * 0.75),
                          child: Row(
                            spacing: AppDimens.spacerLargest,
                            children: <Widget>[
                              const Padding(
                                padding: EdgeInsets.only(top: 4),
                                child: AppOnboardingProgressBar(
                                  amount: 3,
                                  activeIndex: 3,
                                ),
                              ),
                              Flexible(
                                child: Column(
                                  spacing: AppDimens.spacerSmall,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      LocaleKeys.paywall_title.watchTr(context),
                                      style: AppFonts.h1,
                                    ),
                                    Text(
                                      LocaleKeys.paywall_description.watchTr(context),
                                      style: AppFonts.h3.copyWith(color: colors.onSecondaryLight),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(height: _betweenSpacer),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: AppDimens.defaultPagePadding * 1.5,),
                    child: Column(
                      spacing: AppDimens.spacerExtraSmall,
                      children: items,
                    ),
                  ),
                  const SizedBox(height: _betweenSpacer),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: AppDimens.defaultPagePadding * 1.5,),
                    child: AppElevatedButton.custom(
                      onTap: () => bloc.add(const MakePurchase()),
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Flexible(
                            child: Text(
                              state.selectedIndex == 0
                                  ? LocaleKeys.paywall_action_purchase_freeTrial.watchTr(context)
                                  : LocaleKeys.paywall_action_purchase_continue.watchTr(context),
                              style: AppFonts.h4.copyWith(color: colors.onAccent),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          AppIcons.rightArrowLong.call(),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: _betweenSpacer),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: AppDimens.defaultPagePadding * 1.5,),
                    child: Row(
                      spacing: AppDimens.spacerLargest,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        AppTextButton(
                          title: LocaleKeys.paywall_action_restore_title.watchTr(context),
                          style: AppTextButtonStyle.secondary,
                          onTap: () =>
                              bloc.add(
                                Restore(
                                      () async =>
                                      _openRestoreFailureDialog(
                                        context,
                                        onConfirm: () => bloc.add(const NavigateBack()),
                                      ),
                                ),
                              ),
                        ),
                        const VerticalLineDivider(),
                        AppTextButton(
                          title: LocaleKeys.paywall_action_privacy_title.watchTr(context),
                          style: AppTextButtonStyle.secondary,
                          onTap: () => bloc.add(const OpenPrivacy()),
                        ),
                        const VerticalLineDivider(),
                        AppTextButton(
                          title: LocaleKeys.paywall_action_terms_title.watchTr(context),
                          style: AppTextButtonStyle.secondary,
                          onTap: () => bloc.add(const OpenTerms()),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void _openRestoreFailureDialog(BuildContext context, {
    required VoidCallback onConfirm,
  }) {
    AppDialog.openDialog(
      context: context,
      child: AppAlertDialog(
        title: LocaleKeys.paywall_action_restore_failure_title.watchTr(context),
        content: LocaleKeys.paywall_action_restore_failure_description.watchTr(context),
        actions: const <AppAlertDialogItem>[],
      ),
    );
  }
}
