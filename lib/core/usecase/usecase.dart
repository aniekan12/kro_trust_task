import 'package:dartz/dartz.dart';

abstract class UseCase<I, E, O> {
  Future<Either<E, O>> invoke(I input);
}
