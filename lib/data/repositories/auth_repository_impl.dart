import 'dart:convert';

import 'package:asesmen_paud/api/exception.dart';
import 'package:asesmen_paud/api/payload/profile_payload.dart';
import 'package:asesmen_paud/api/response.dart';
import 'package:asesmen_paud/data/models/sign_in_model.dart';
import 'package:asesmen_paud/data/providers/auth_provider.dart';
import 'package:asesmen_paud/data/providers/local/token_local_data_source.dart';
import 'package:asesmen_paud/domain/entities/profile_entity.dart';
import 'package:asesmen_paud/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthProvider authProvider;
  final TokenLocalDataSource tokenLocalDataSource;

  AuthRepositoryImpl({
    required this.authProvider,
    required this.tokenLocalDataSource,
  });

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

  @override
  Future<void> signOut() async {
    await tokenLocalDataSource.clearToken();
  }

  @override
  Future<bool> checkToken() async {
    final token = await getToken();
    if (token == null) return false;
    return await authProvider.checkToken(token);
  }

  @override
  Future<String?> getToken() async {
    return await tokenLocalDataSource.getToken();
  }

  @override
  Future<void> saveToken(String token) async {
    await tokenLocalDataSource.saveToken(token);
  }

  @override
  Future<ProfileEntity> getUserProfile() async {
    final token = await tokenLocalDataSource.getToken();
    if (token == null) {
      throw Exception('Token tidak ditemukan, mohon sign-in kembali.');
    }

    final response = await authProvider.getProfile(token);
    final jsonResponse = json.decode(response.body);

    if (response.statusCode == 200) {
      final payload = ProfilePayload.fromJson(jsonResponse['payload']);
      return ProfileEntity(
        name: payload.name,
        email: payload.email,
        nuptk: payload.nuptk,
      );
    } else {
      throw Exception('Gagal mengambil data profil');
    }
  }
}
