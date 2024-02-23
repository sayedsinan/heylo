import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String senderId;
  final String senderEmail;
  final String recivrId;
  final String messeage;
  final Timestamp time;

  Message({
    required this.senderId,
    required this.senderEmail,
    required this.recivrId,
    required this.messeage,
    required this.time,
  });
  Map<String, dynamic> toMap() {
    return {
      'senderId':senderId,
      'senderEmail':senderEmail,
      'recivrId':recivrId,
      'message':messeage,
      
    };
  }
}
