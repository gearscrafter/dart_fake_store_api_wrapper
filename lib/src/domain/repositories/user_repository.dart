import 'package:dartz/dartz.dart';

import '../../core/errors/failures.dart';
import '../entities/user_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, IdEntity>> register(UserEntity user);
  Future<Either<Failure, TokenEntity>> signIn(UserEntity user);
  Future<Either<Failure, UserEntity>> getInfo(String idUser);
}
