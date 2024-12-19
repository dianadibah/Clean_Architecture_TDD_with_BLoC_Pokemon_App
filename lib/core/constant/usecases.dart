import 'package:dartz/dartz.dart';
import 'package:pokemon_app/core/errors/server_exception.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params param);
}

mixin Params {
  BodyMap getBody() => {};
  QueryParams getParams() => {};
}

class NoParams with Params {}

typedef QueryParams = Map<String, String>;
typedef BodyMap = Map<String, dynamic>;

