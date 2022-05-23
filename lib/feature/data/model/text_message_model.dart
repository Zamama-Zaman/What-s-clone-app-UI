import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whatsapp_clone_app/feature/domain/entities/text_message_entity.dart';

class TextMessageModel extends TextMessageEntity {
  const TextMessageModel({
    String? senderName,
    String? sederUID,
    String? recipientName,
    String? recipientUID,
    String? messageType,
    String? message,
    String? messageId,
    Timestamp? time,
  }) : super(
          senderName: senderName,
          sederUID: sederUID,
          recipientName: recipientName,
          recipientUID: recipientUID,
          messsageType: messageType,
          message: message,
          messageId: messageId,
          time: time,
        );
  factory TextMessageModel.fromSnapShot(DocumentSnapshot snapshot) {
    return TextMessageModel(
      senderName: snapshot.get('senderName'),
      sederUID: snapshot.get('sederUID'),
      recipientName: snapshot.get('recipientName'),
      recipientUID: snapshot.get('recipientUID'),
      messageType: snapshot.get('messageType'),
      message: snapshot.get('message'),
      messageId: snapshot.get('messageId'),
      time: snapshot.get('time'),
    );
  }
  Map<String, dynamic> toDocument() {
    return {
      "senderName": senderName,
      "sederUID": sederUID,
      "recipientName": recipientName,
      "recipientUID": recipientUID,
      "messageType": messsageType,
      "message": message,
      "messageId": messageId,
      "time": time,
    };
  }
}
