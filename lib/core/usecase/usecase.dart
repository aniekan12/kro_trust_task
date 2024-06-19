abstract class Usecase<I, O> {
  Future<O> execute(I input);
}
