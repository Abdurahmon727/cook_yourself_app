import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/data/either.dart';
import '../../../../core/error/failure.dart';

abstract class AuthRepository {
  Stream<User?> get status;
  Future<Either<ServerFailure, void>> signIn(String phoneNumber);
  Future<Either<ServerFailure, void>> checkSms(String smsCode);
  Future<Either<Failure, void>> logOut();
  Future<Either<Failure, File>> getImageLink(String image);
  Future<Either<Failure, void>> signInDemoGmail();
}
