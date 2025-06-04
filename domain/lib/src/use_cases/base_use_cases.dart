part of usecases;

abstract class UseCase<Input, Output> {
  Output execute(Input payload);
}

abstract class FutureUseCase<Input, Output> {
  Future<Output> execute(Input payload);
}

abstract class StreamUseCase<Input, Output> {
  Stream<Output> execute(Input payload);
}

class NoParams {
  const NoParams();
}
