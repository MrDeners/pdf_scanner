import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:home/rename/bloc/rename_bloc.dart';

class RenameContent extends StatefulWidget {
  const RenameContent({super.key});

  @override
  State<RenameContent> createState() => _RenameContentState();
}

class _RenameContentState extends State<RenameContent> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: context.read<RenameBloc>().state.document.name)
      ..addListener(() => context.read<RenameBloc>().add(ChangeName(_controller.text)));
  }

  @override
  Widget build(BuildContext context) {
    final RenameBloc bloc = context.read<RenameBloc>();

    return BlocBuilder<RenameBloc, RenameState>(
      builder: (BuildContext context, RenameState state) {
        return AppScaffold(
          hasScrollBody: false,
          hasAppBar: false,
          isLoading: state.isLoading,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: AppDimens.spacerLargest,
            children: <Widget>[
              Row(
                spacing: AppDimens.spacerExtraSmall,
                children: <Widget>[
                  AppIcons.close.call(onTap: () => bloc.add(const NavigateBack())),
                  Text(
                    LocaleKeys.home_tiles_documents_action_rename_title.watchTr(context),
                    style: AppFonts.h3,
                  ),
                ],
              ),
              AppTextField(
                controller: _controller,
                style: AppTextFieldStyle.secondary,
                hint: LocaleKeys.common_inputHint.watchTr(context),
              ),
              AppElevatedButton(
                title: LocaleKeys.home_tiles_documents_action_rename_confirm.watchTr(context),
                onTap: () => bloc.add(const Save()),
              ),
            ],
          ),
        );
      },
    );
  }
}
