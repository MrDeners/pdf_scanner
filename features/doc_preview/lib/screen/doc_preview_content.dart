import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:doc_preview/bloc/doc_preview_bloc.dart';
import 'package:doc_preview/widgets/preview_footer.dart';
import 'package:doc_preview/widgets/preview_header.dart';

class DocPreviewContent extends StatelessWidget {
  const DocPreviewContent({super.key});

  static const double _previewTileHeight = 70.0;

  @override
  Widget build(BuildContext context) {
    final DocPreviewBloc bloc = context.read<DocPreviewBloc>();

    return BlocBuilder<DocPreviewBloc, DocPreviewState>(
      builder: (BuildContext context, DocPreviewState state) {
        return AppScaffold(
          isLoading: state.isLoading,
          hasScrollBody: false,
          hasAppBar: false,
          hasPadding: false,
          useSafeArea: false,
          content: SafeArea(
            bottom: false,
            left: false,
            right: false,
            child: Column(
              spacing: AppDimens.spacerLargest,
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: AppDimens.spacerLargest,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: AppDimens.defaultPagePadding),
                        child: PreviewHeader(
                          title: state.document.name,
                          pageAmount: state.pagesAmount,
                          selectedPage: state.selectedPage,
                          onNavigateBack: () => bloc.add(const NavigateBack()),
                          onShare: () => bloc.add(const Share()),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: AppDimens.defaultPagePadding),
                          child: LayoutBuilder(
                            builder: (BuildContext context, BoxConstraints constraints) =>
                                PageView.builder(
                                  itemCount: state.pagesAmount,
                                  physics: const ClampingScrollPhysics(),
                                  controller: PageController(initialPage: state.selectedPage),
                                  onPageChanged: (int index) => bloc.add(ChangeSelectedPageIndex(index)),
                                  itemBuilder: (BuildContext context, int index) => DocumentPreview(
                                    file: state.document.file,
                                    pageNumber: state.selectedPage + 1,
                                    height: constraints.maxHeight,
                                  ),
                                ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: _previewTileHeight,
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemCount: state.pagesAmount,
                          scrollDirection: Axis.horizontal,
                          physics: const ClampingScrollPhysics(),
                          padding: const EdgeInsets.symmetric(horizontal: AppDimens.defaultPagePadding),
                          separatorBuilder: (_, __) => const SizedBox(width: AppDimens.spacerExtraSmall),
                          itemBuilder: (BuildContext context, int index) => DocumentPreview(
                            file: state.document.file,
                            height: _previewTileHeight,
                            pageNumber: index + 1,
                            onTap: () => bloc.add(ChangeSelectedPageIndex(index)),
                            isActive: state.selectedPage == index,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                PreviewFooter(
                  onAdd: () => bloc.add(const Add()),
                  onEdit: () => bloc.add(const Edit()),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
