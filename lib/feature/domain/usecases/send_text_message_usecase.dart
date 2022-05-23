import 'package:whatsapp_clone_app/feature/domain/entities/text_message_entity.dart';
import 'package:whatsapp_clone_app/feature/domain/repositories/firebase_repository.dart';

class SendTextMessageUseCase {
  final FirebaseRepository repository;

  SendTextMessageUseCase({required this.repository});

  Future<void> sendTextMessage(
      TextMessageEntity textMessageEntity, String channelId) async {
    return await repository.sendTextMessage(textMessageEntity, channelId);
  }
}
