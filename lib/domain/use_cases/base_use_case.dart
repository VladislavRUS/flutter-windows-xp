abstract class BaseUseCase<T, P> {
  T execute(P params);
}
