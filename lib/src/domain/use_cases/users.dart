import 'package:dartz/dartz.dart';

import '../../core/errors/failures.dart';
import '../entities/user_entity.dart';
import '../repositories/user_repository.dart';

class Users {
  final UserRepository userRepository;

  Users(this.userRepository);

  Future<Either<Failure, IdEntity>> callRegister(UserEntity userData) async {
    return await userRepository.register(userData);
  }

  Future<Either<Failure, TokenEntity>> callSignIn(UserEntity userData) async {
    return await userRepository.signIn(userData);
  }

  Future<Either<Failure, UserEntity>> callInfo(String idUser) async {
    return await userRepository.getInfo(idUser);
  }
}
