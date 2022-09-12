import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  final Map<String, String> name;
  final List<String> peers;
  final List<String> contests;
  final List<String> blocked;
  final String? picUrl;

  UserModel(
    this.picUrl, {
    required this.id,
    required this.name,
    required this.peers,
    required this.contests,
    required this.blocked,
  });

  factory UserModel.fromDocument(DocumentSnapshot doc) {
    Map data = doc.data() as Map;

    return UserModel(
      data['pic_url'],
      id: doc.id,
      name: data['name'] ?? {'first': '', 'last': ''},
      peers: data['peers'] ?? [],
      contests: data['contests'] ?? [],
      blocked: data['blocked'] ?? [],
    );
  }
}
