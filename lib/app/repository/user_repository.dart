import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecosan/app/constants/firebase_constants.dart' as constants;
import 'package:ecosan/app/models/user/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class UserRepository {
  static CollectionReference get userCollection =>
      constants.firestore.collection('users');

  static auth.User? get currentUser => constants.auth.currentUser;

  get _id => currentUser!.uid;

  // get user
  Future<DocumentSnapshot> get() async {
    return await userCollection.doc(_id).get();
  }

  Future<void> update(Map<String, dynamic> data) async {
    await userCollection.doc(_id).update(data);
  }

  // add point
  Future<void> addPoint(int point) async {
    DocumentSnapshot user = await get();
    User userObj = User.fromJson(user.data() as Map<String, dynamic>);
    int currentPoint = userObj.poin;
    await update({"poin": currentPoint + point});

  }
}

final UserRepository userRepository = UserRepository();
