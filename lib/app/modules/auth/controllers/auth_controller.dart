import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecosan/app/constants/firebase_constants.dart';
import 'package:ecosan/app/models/user/user_model.dart' as user_model;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  static AuthController authInstance = Get.find();
  late Rx<User?> firebaseUser;

  late Rx<user_model.User> user;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  @override
  void onClose() {
    super.onClose();
  }

  _setInitialScreen(User? user) async {
    if (user != null) {
      // user is logged in
      DocumentSnapshot<Map<String, dynamic>> userData =
          await firestore.collection("users").doc(user.uid).get();

      print(userData.data());

      if (userData.exists) {
        this.user = user_model.User.fromJson(userData.data()!).obs;
        print(this.user);
        Get.offAllNamed("/home");
      } else {
        Get.offAllNamed("/auth/register/data-diri");
      }
    } else {
      // user is null as in user is not available or not logged in
      Get.offAllNamed("/auth/login");
    }
  }

  void register(String email, String password) async {
    try {
      // create user with email and password (register user)
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // show success snackbar
      Get.snackbar(
        "Success",
        "Account created successfully",
        snackPosition: SnackPosition.BOTTOM,
      );

      // set isNewuser to true
    } on FirebaseAuthException catch (e) {
      // this is solely for the Firebase Auth Exception
      // for example : password did not match
      print(e);
      // Get.snackbar("Error", e.message!);
      Get.snackbar(
        "Error",
        e.message!,
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      // this is temporary. you can handle different kinds of activities
      //such as dialogue to indicate what's wrong
      print(e.toString());
    }
  }

  void login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      Get.snackbar(
        "Success",
        "Logged in successfully",
        snackPosition: SnackPosition.BOTTOM,
      );
    } on FirebaseAuthException catch (e) {
      // this is solely for the Firebase Auth Exception
      // for example : password did not match
      print(e.message);
      Get.snackbar(
        "Error",
        e.message!,
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      print(e.toString());
    }
  }

  void googleSignIn() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to firebase with the credential
      await auth.signInWithCredential(credential);

      Get.snackbar(
        "Success",
        "Logged in successfully",
        snackPosition: SnackPosition.BOTTOM,
      );
    } on FirebaseAuthException catch (e) {
      // this is solely for the Firebase Auth Exception
      // for example : password did not match
      print(e.message);
      Get.snackbar(
        "Error",
        e.message!,
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      print(e.toString());
    }
  }

  void signOut() {
    try {
      GoogleSignIn().signOut();
      auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> addUserToFirestore(user_model.User user) async {
    try {
      final currentUserId = auth.currentUser!.uid;
      await firestore.collection('users').doc(currentUserId).set(user.toJson());
      Get.snackbar(
        "Success",
        "User added successfully",
        snackPosition: SnackPosition.BOTTOM,
      );
      Get.offAllNamed("/home");
      this.user = user.obs;
    } on FirebaseAuthException catch (e) {
      print(e.message);
      Get.snackbar(
        "Error",
        e.message!,
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      print(e.toString());
    }
  }
}
