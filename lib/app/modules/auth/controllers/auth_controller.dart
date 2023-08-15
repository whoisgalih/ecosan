import 'package:ecosan/app/constants/firebase_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController authInstance = Get.find();
  late Rx<User?> firebaseUser;
  late RxBool isNewuser;

  var user = null.obs;

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

  _setInitialScreen(User? user) {
    if (user != null) {
      // user is logged in
      Get.offAllNamed("/home");
    } else {
      // user is null as in user is not available or not logged in
      Get.offAllNamed("/auth/login");
    }
  }

  void register(String email, String password) async {
    try {
      // create user with email and password (register user)
      final UserCredential userCredential =
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
      isNewuser = true.obs;
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
    } on FirebaseAuthException catch (e) {
      // this is solely for the Firebase Auth Exception
      // for example : password did not match
      print(e.message);
    } catch (e) {
      print(e.toString());
    }
  }

  void signOut() {
    try {
      auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
