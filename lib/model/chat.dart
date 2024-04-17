import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String senderId;
  final String senderEmail;
  final String recivrId;
  final String messeage;
  final Timestamp time;
  final String name;
  final String about;
  final String image;

  Message({
    required this.senderId,
    required this.senderEmail,
    required this.recivrId,
    required this.messeage,
    required this.time,
    required this.name,
    required this.about,
    required this.image,
  });
  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'senderEmail': senderEmail,
      'recivrId': recivrId,
      'message': messeage,
      'timestamp': time,
      'name': name,
      'about': about,
      'image':image
    };
  }
}
