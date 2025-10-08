import 'package:asesmen_paud/data/models/sign_in_model.dart';
import 'package:asesmen_paud/domain/entities/profile_entity.dart';

abstract class AuthRepository {
  Future<SignInModel> signIn(String email, String password);
  Future<void> saveToken(String token);
  Future<void> signOut();
  Future<String?> getToken();
  Future<bool> checkToken();

  Future<ProfileEntity> getUserProfile();
}
