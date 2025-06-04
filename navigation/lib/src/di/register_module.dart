import 'package:injectable/injectable.dart';
import 'package:navigation/navigation.dart';

@module
abstract class RegisterModule {
  @singleton
  AppRouter get appRouter => AppRouter();
}
