import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:home/home/bloc/home_bloc.dart';
import 'package:home/home/widgets/documents_list.dart';
import 'package:home/home/widgets/scan_button.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController()
      ..addListener(() => context.read<HomeBloc>().add(ChangeSearch(_controller.text)));
  }

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;
    final HomeBloc bloc = context.read<HomeBloc>();

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (BuildContext context, HomeState state) {
        return AppScaffold(
          hasScrollBody: false,
          isLoading: state.isLoading,
          content: Column(
            spacing: AppDimens.spacerLargest,
            children: <Widget>[
              AppTextField(
                controller: _controller,
                style: AppTextFieldStyle.secondary,
                hint: LocaleKeys.common_searchHint.watchTr(context),
                postfix: state.search.isNotEmpty
                    ? AppIcons.close.call(onTap: () => _controller.clear())
                    : AppIcons.search.call(),
              ),
              if (state.documents.isEmpty) ...<Widget>[
                DocumentsList(
                  documents: state.documents,
                  onSort: () => bloc.add(const SortByDateTime()),
                  onTap: (int index) => bloc.add(NavigatePreview(index)),
                  isSortedHeight: state.isSortHeight,
                  onTapMenu: (int index) => _openDocumentActionsPopup(
                    context,
                    colors,
                    onRename: () => bloc.add(NavigateDocRename(index)),
                    onPrint: () => bloc.add(Print(index)),
                    onShare: () => bloc.add(Share(index)),
                    onDelete: () => bloc.add(Delete(index)),
                  ),
                ),
                const Spacer(),
              ] else
                Flexible(
                  child: DocumentsList(
                    documents: state.filteredDocuments,
                    onSort: () => bloc.add(const SortByDateTime()),
                    onTap: (int index) => bloc.add(NavigatePreview(index)),
                    isSortedHeight: state.isSortHeight,
                    onTapMenu: (int index) => _openDocumentActionsPopup(
                      context,
                      colors,
                      onRename: () => bloc.add(NavigateDocRename(index)),
                      onPrint: () => bloc.add(Print(index)),
                      onShare: () => bloc.add(Share(index)),
                      onDelete: () => bloc.add(Delete(index)),
                    ),
                  ),
                ),
              ScanButton(onTap: () => bloc.add(const Scan())),
            ],
          ),
        );
      },
    );
  }

  void _openDocumentActionsPopup(
    BuildContext context,
    AppColorsTheme colors, {
    required VoidCallback onRename,
    required VoidCallback onPrint,
    required VoidCallback onShare,
    required VoidCallback onDelete,
  }) {
    AppActionsPopup.open(
      context: context,
      actions: <CupertinoActionSheetAction>[
        CupertinoActionSheetAction(
          onPressed: () async {
            await Navigator.maybePop(context);
            onRename();
          },
          child: Text(
            LocaleKeys.home_tiles_documents_action_rename_title.watchTr(context),
            style: AppFonts.h4.copyWith(color: AppColors.appleBlue),
          ),
        ),
        CupertinoActionSheetAction(
          onPressed: () async {
            await Navigator.maybePop(context);
            onPrint();
          },
          child: Text(
            LocaleKeys.home_tiles_documents_action_print_title.watchTr(context),
            style: AppFonts.h4.copyWith(color: AppColors.appleBlue),
          ),
        ),
        CupertinoActionSheetAction(
          onPressed: () async {
            await Navigator.maybePop(context);
            onShare();
          },
          child: Text(
            LocaleKeys.home_tiles_documents_action_share_title.watchTr(context),
            style: AppFonts.h4.copyWith(color: AppColors.appleBlue),
          ),
        ),
        CupertinoActionSheetAction(
          onPressed: () async {
            await Navigator.maybePop(context);
            onDelete();
          },
          child: Text(
            LocaleKeys.home_tiles_documents_action_delete_title.watchTr(context),
            style: AppFonts.h4.copyWith(color: AppColors.appleRed),
          ),
        ),
      ],
    );
  }
}
