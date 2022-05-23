import 'package:whatsapp_clone_app/feature/domain/entities/contact_entity.dart';

abstract class GetDeviceNumberRepository {
  Future<List<ContactEntity>> getDeviceNumbers();
}
