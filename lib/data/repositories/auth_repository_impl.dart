import 'dart:convert';

import 'package:asesmen_paud/api/exception.dart';
import 'package:asesmen_paud/api/response.dart';
import 'package:asesmen_paud/data/models/sign_in_model.dart';
import 'package:asesmen_paud/data/providers/auth_provider.dart';
import 'package:asesmen_paud/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthProvider authProvider;

  AuthRepositoryImpl({required this.authProvider});

  @override
  Future<SignInModel> signIn(String email, String password) async {
    final response = await authProvider.signIn(email, password);
    final jsonResponse = json.decode(response.body);

    if (response.statusCode == 200) {
      final successResponse = SuccessResponse.fromJson(
        jsonResponse,
        (data) => SignInModel.fromJson(data),
      );
      return successResponse.payload!;
    } else if (response.statusCode == 422) {
      final failResponse = FailResponse.fromJson(jsonResponse);
      throw ValidationException(failResponse.errors ?? {});
    } else if (response.statusCode == 400) {
      throw ErrorException(jsonResponse['message'] ?? 'Terjadi kesalahan');
    } else {
      throw Exception('Gagal terhubung ke server');
    }
  }
}
