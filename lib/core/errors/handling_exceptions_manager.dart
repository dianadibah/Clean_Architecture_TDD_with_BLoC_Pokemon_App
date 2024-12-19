import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:pokemon_app/core/errors/exceptions.dart';
import 'package:pokemon_app/core/errors/server_exception.dart';

mixin HandlingExceptionManager  {
  Future<Either<Failure, T>> wrapHandling<T>({
    required Future<T> Function() tryCall,
    Future<T?> Function()? tryCallLocal,
  }) async {
    try {
      final right = await tryCall();
      return Right(right);
    } on UnauthenticatedExeption  {
      log("<< catch >> Unauthenticated Error ");
      return const Left(UnauthenticatedFailure());
    } 
    on ServerException catch (e) {
      log("<< catch >> error is $e");
      if (tryCallLocal != null) {
        final result = await tryCallLocal();
        if (result != null) {
          return Right(result);
        } else {
          return const Left(ServerFailure("message"));
        }
      } else {
        return  Left(ServerFailure(e.message));
      }
    }
  }
}
