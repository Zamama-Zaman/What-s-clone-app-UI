import 'package:whatsapp_clone_app/feature/domain/entities/user_entity.dart';
import 'package:whatsapp_clone_app/feature/domain/repositories/firebase_repository.dart';

class GetCreateCurrentUserUseCase {
  final FirebaseRepository repository;

  GetCreateCurrentUserUseCase({required this.repository});

  Future<void> call(UserEntity user) async {
    return await repository.getCreateCurrentUser(user);
  }
}
