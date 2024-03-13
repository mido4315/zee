

abstract class AuthRepo {
  Future<void> userRegister({
    required String name,
    required String email,
    required String password,
});
//   Future<Either<Failure, UserModel>> userLogin({
//     required String email,
//     required String password,
// });
}