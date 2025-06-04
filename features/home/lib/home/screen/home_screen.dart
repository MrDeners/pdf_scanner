import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:home/home/bloc/home_bloc.dart';
import 'package:home/home/screen/home_content.dart';
import 'package:navigation/navigation.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (_) => HomeBloc(
        appRouter: appLocator<AppRouter>(),
        appEventNotifier: appLocator<AppEventNotifier>(),
        addDocumentUseCase: appLocator<AddDocumentUseCase>(),
        deleteDocumentUseCase: appLocator<DeleteDocumentUseCase>(),
        fetchDocumentsUseCase: appLocator<FetchDocumentsUseCase>(),
        fetchSubscriptionStatusUseCase: appLocator<FetchSubscriptionStatusUseCase>(),
      )..add(const Initialize()),
      child: const HomeContent(),
    );
  }
}
