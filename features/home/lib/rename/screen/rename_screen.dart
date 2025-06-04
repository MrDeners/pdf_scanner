import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:home/rename/bloc/rename_bloc.dart';
import 'package:home/rename/screen/rename_content.dart';
import 'package:navigation/navigation.dart';

@RoutePage()
class RenamePopup extends StatelessWidget {
  final DocumentData document;

  const RenamePopup({
    required this.document,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RenameBloc>(
      create: (_) => RenameBloc(
        document: document,
        appRouter: appLocator<AppRouter>(),
        appEventNotifier: appLocator<AppEventNotifier>(),
        updateDocumentUseCase: appLocator<UpdateDocumentUseCase>(),
      ),
      child: const RenameContent(),
    );
  }
}
