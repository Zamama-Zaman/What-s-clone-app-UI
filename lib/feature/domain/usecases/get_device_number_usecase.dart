import 'package:whatsapp_clone_app/feature/domain/entities/contact_entity.dart';
import 'package:whatsapp_clone_app/feature/domain/repositories/get_device_number_repository.dart';

class GetDeviceNumberUseCase {
  final GetDeviceNumberRepository deviceNumberRepository;

  GetDeviceNumberUseCase({required this.deviceNumberRepository});

  Future<List<ContactEntity>> call() async {
    return deviceNumberRepository.getDeviceNumbers();
  }
}
