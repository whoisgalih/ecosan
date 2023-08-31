import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecosan/app/constants/firebase_constants.dart' as constants;
import 'package:ecosan/app/models/user/user_model.dart';
import 'package:ecosan/app/modules/auth/controllers/auth_controller.dart';
import 'package:get/get.dart';

class UserRepository {
  static CollectionReference get userCollection =>
      constants.firestore.collection('users');

  // get current user
  Rx<User> currentUser = AuthController.authInstance.user;

  get _id => currentUser.value.uid;

  // get user
  Future<DocumentSnapshot> get() async {
    return await userCollection.doc(_id).get();
  }

  Future<void> update(Map<String, dynamic> data) async {
    await userCollection.doc(_id).update(data);
  }

  // add point
  Future<void> addPoint(int point) async {
    await update({"poin": currentUser.value.poin + point});
    currentUser.value.poin += point;
    currentUser.refresh();
  }

  // reduce point
  Future<void> reducePoint(int point) async {
    await update({"poin": currentUser.value.poin - point});
    currentUser.value.poin -= point;
    currentUser.refresh();
  }
}

final UserRepository userRepository = UserRepository();
