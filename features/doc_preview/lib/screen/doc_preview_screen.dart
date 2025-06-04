import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:doc_preview/bloc/doc_preview_bloc.dart';
import 'package:doc_preview/screen/doc_preview_content.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';

@RoutePage()
class DocPreviewScreen extends StatelessWidget {
  final DocumentData document;

  const DocPreviewScreen({
    required this.document,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DocPreviewBloc>(
      create: (_) =>
          DocPreviewBloc(
            appRouter: appLocator<AppRouter>(),
            appEventNotifier: appLocator<AppEventNotifier>(),
            fetchSubscriptionStatusUseCase: appLocator<FetchSubscriptionStatusUseCase>(),
            updateDocumentUseCase: appLocator<UpdateDocumentUseCase>(),
          )..add(Initialize(document)),
      child: const DocPreviewContent(),
    );
  }
}
