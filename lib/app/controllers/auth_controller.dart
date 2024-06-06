// ignore_for_file: unnecessary_overrides, unused_import, unused_local_variable, avoid_web_libraries_in_flutter, unrelated_type_equality_checks, avoid_print, unused_catch_clause

import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:uas_flutter_absen/app/routes/app_pages.dart';

class AuthController extends GetxController {
  Stream authStatus = FirebaseAuth.instance.authStateChanges();
  final count = 0.obs;
  FirebaseFirestore rs = FirebaseFirestore.instance;
  FirebaseAuth rm = FirebaseAuth.instance;

  // Future<void> login(String emailAddress, String password) async {
  //   try {
  //     final credential = await FirebaseAuth.instance
  //         .signInWithEmailAndPassword(email: emailAddress, password: password);

  //     User? user = credential.user;
  //     if (user != null) {
  //       DocumentSnapshot admin = rs.collection("role").doc(user.uid).get();

  //       if (admin.exists && admin['role'] == 'role') {
  //         Get.defaultDialog(middleText: "Berhasil Masuk Ke Halaman Admin");
  //         Get.offAllNamed(Routes.CRUD_JADWAL);
  //       } else {
  //         Get.offAllNamed(Routes.HOME);
  //       }
  //     } else {
  //       Get.defaultDialog(middleText: "Gagal Masuk");
  //     }
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //     } else if (e.code == 'wrong-password') {
  //       Get.defaultDialog(middleText: "Email Dan Password Tidak Sama");
  //     }
  //   }
  // }

  // login(String emailAddress, String password) async {
  //   try {
  //     final credential = await FirebaseAuth.instance
  //         .signInWithEmailAndPassword(email: emailAddress, password: password);

  //     User? user = FirebaseAuth.instance.currentUser;

  //     print(user);

  //     Future<DocumentSnapshot> mm = rs.collection("admin").doc(user?.uid).get();

  //     if (mm == "admin") {
  //       Get.defaultDialog(middleText: "Berhasil Masuk Ke Dalam Admin");
  //       Get.offAllNamed(Routes.CRUD_JADWAL);
  //     } else {
  //       Get.defaultDialog(middleText: "Gagal Masuk");
  //     }
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       Get.defaultDialog(middleText: "User Tidak Dapat Ditemukan");
  //     } else if (e.code == 'wrong-password') {
  //       Get.defaultDialog(middleText: "Email Dan Password Tidak Sama");
  //     } else {
  //       Get.defaultDialog(middleText: "Gagal Login");
  //     }
  //   }
  // }

  login(String email, String password,) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      Get.back();

      List<String> adminEmails = [
        'faisal216093@gmail.com',
        'faisalsmk234@gmail.com'
      ];
      if (adminEmails.contains(email)) {
        Get.offAllNamed(Routes.CRUD_JADWAL);
      } else {
        Get.offAllNamed(Routes.HOME);
      }
    } on FirebaseAuthException catch (e) {
       Get.defaultDialog(middleText: "Gagal Login", title: "Error");
    } catch (e) {
      print(e);
    }
  }
  

//   Future<void> login(String email, String password) async {
//     try {
//       UserCredential userCredential =
//           await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );

//       if (userCredential.user != null) {
//         navigateBasedOnRole(userCredential.user!.uid);
//       }
//     } catch (e) {
//       Get.defaultDialog(middleText: "Login Failed: $e");
//     }
//   }
// Future<void> navigateBasedOnRole(String uid) async {
//   try {
//     DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('role').doc(uid).get();

//     if (userDoc.exists) {
//       String role = userDoc['role'];
//       if (role == 'admin') {
//         Get.offAllNamed(Routes.CRUD_JADWAL);
//       }  else {
//         Get.defaultDialog(middleText: "Unknown role: $role");
//       }
//     } else {
//       Get.defaultDialog(middleText: "User role not found");
//     }
//   } catch (e, stackTrace) {
//     print("Error navigating based on role: $e\n$stackTrace");
//     Get.defaultDialog(middleText: "Error navigating based on role");
//   }
// }

  register(String emailAddress, String password, String confirmPassword) async {
    try {
      if (password != confirmPassword) {
        Get.defaultDialog(
            middleText: "Password Dan Konfirmasi Password Tidak Sama");
      }
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailAddress, password: password);
      Get.defaultDialog(middleText: "Berhasil Register, Silahkan Masuk");
      Get.offAllNamed(Routes.LOGIN);
    } catch (e) {
      Get.defaultDialog(middleText: "Gagal Register");
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }

  resetpass(String emailAddress) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailAddress);
      Get.defaultDialog(middleText: "Email Terkirim", title: "Berhasil");
    } catch (e) {
      Get.defaultDialog(middleText: "Email Gagal Terkirim");
    }
  }
}
