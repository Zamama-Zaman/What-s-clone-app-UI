import 'package:whatsapp_clone_app/feature/domain/entities/my_chat_entity.dart';
import 'package:whatsapp_clone_app/feature/domain/repositories/firebase_repository.dart';

class GetMyChatUseCase {
  final FirebaseRepository repository;

  GetMyChatUseCase({required this.repository});

  Stream<List<MyChatEntity>> call(String uid) {
    return repository.getMyChat(uid);
  }
}
