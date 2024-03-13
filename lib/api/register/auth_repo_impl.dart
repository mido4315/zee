import 'dart:convert';

import 'package:dio/dio.dart';

import '../api_service.dart';
import 'auth_repo.dart';

class AuthRepoImpl {
  AuthRepoImpl(this.apiService);

  APIService apiService;

  Future<void> userRegister({
    required String name,
    required String email,
    required String password,
    required String RePassword,
    required String PhoneNumber,
  }) async {
    try {

      print("requestBodyrequestBody");

      final Map<String, dynamic> requestBody = {
        "name": name,
        "emaill": email,
        "Password": password,
        "RePassword": RePassword,
        "PhoneNumber": PhoneNumber
      };
      print("afterrequestBodyrequestBody");

      var result = await apiService.post(
          path: '', data: jsonEncode(requestBody));

      print("successsuccesssuccesssuccess : ${result}");
    } catch (e) {
      if (e is DioException) {
        print("DioExceptionDioExceptionDioException");
      }
      print(e.toString());

    }
  }

//   @override
//   Future<Either<Failure, UserModel>> userLogin({
//     required String email,
//     required String password,
//   }) async {
//     try {
//       UserModel data = UserModel(
//         email: email,
//         password: password,
//       );
//       var result =
//           await apiService.post(path: '/api/signin', data: data.toJson());
//       UserModel user = UserModel.fromMap(result);
//       getIt.get<SharedPrefs>().setData(key: 'token', value: user.token);
//
//       //______________________________________saving user data with shard preferences
//       // List<String> userArgs = [
//       //   user.name!,
//       //   user.email,
//       //   user.address!,
//       //   user.type!,
//       //   user.token!,
//       // ];
//       // getIt.get<SharedPrefs>().setData(key: 'user', value: userArgs);
//       myUserModel = user;
//       return Right(user);
//     } catch (e) {
//       if (e is DioException) {
//         return Left(
//           ServerFailure.fromDioError(e),
//         );
//       }
//       return left(ServerFailure(
//         e.toString(),
//       ));
//     }
//   }
//
// //______________________________________get user data every time the app opens and check his token
//   @override
//   Future<void> getUserData() async {
//     try {
//       String token = getIt.get<SharedPrefs>().getData(key: 'token');
//       final Map<String, String> headers = {
//         'Content-Type': 'application/json; charset=utf-8',
//         'my-souq-auth-token': token
//       };
//       Response result = await apiService.isValidToken(
//         headers: headers,
//       );
//       if (result.data == true) {
//         var userResult = await apiService.get(
//           path: "/",
//           headers: headers,
//         );
//         myUserModel = UserModel.fromMap(userResult);
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
}