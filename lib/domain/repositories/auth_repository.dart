import 'package:asesmen_paud/data/models/sign_in_model.dart';

abstract class AuthRepository {
  Future<SignInModel> signIn(String email, String password);
}
