import 'package:asesmen_paud/domain/entities/profile_entity.dart';
import 'package:asesmen_paud/domain/repositories/auth_repository.dart';

class GetUserProfileUseCase {
  final AuthRepository authRepository;

  GetUserProfileUseCase({required this.authRepository});

  Future<ProfileEntity> execute() {
    return authRepository.getUserProfile();
  }
}
