import 'package:whatsapp_clone_app/feature/domain/repositories/firebase_repository.dart';

class VerifyPhoneNumberUseCase {
  final FirebaseRepository repository;

  VerifyPhoneNumberUseCase({required this.repository});

  Future<void> call(String phoneNumber) async {
    return await repository.verifyPhoneNumber(phoneNumber);
  }
}
