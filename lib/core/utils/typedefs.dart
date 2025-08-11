import 'package:coincap/core/failure.dart';
import 'package:dartz/dartz.dart';

typedef DataMap = Map<String, dynamic>;

typedef FutureResponse<Type> = Future<Either<Failure, Type>>;
