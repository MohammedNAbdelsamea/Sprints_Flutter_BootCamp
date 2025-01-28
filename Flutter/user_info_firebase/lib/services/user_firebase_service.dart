import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:user_info_firebase/models/firebase_user_model.dart';




class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Save user data to Firestore
  Future<void> saveUserData(UserFirebaseModel user) async {
    try {
      await _firestore.collection('users').add(user.toFirestore());
    } catch (e) {
      throw Exception('Failed to save user data: $e');
    }
  }

  // Fetch all users from Firestore as a stream
  Stream<List<UserFirebaseModel>> getUsers() {
    return _firestore.collection('users').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return UserFirebaseModel.fromFirestore(doc as DocumentSnapshot<Map<String, dynamic>>);
      }).toList();
    });
  }
}