import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lawyerup/models/user_model.dart';
import 'package:lawyerup/pages/login_page.dart';
import 'package:lawyerup/pages/logout_page.dart';

class AuthController extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  var verificationId = '';

  //Email ile Kullanıcı Oluşturma
  Future<User?> createUserWithEmail(
    UserModel userModel,
    String password,
  ) async {
    //Fİrebase fonksiyonu ile email passwordle user oluşturma
    try {
      await _firebaseAuth
          .createUserWithEmailAndPassword(
        email: userModel.email!,
        password: password,
      )
          //Oluşturma işleminden sonra dataların nereye kaydedileceği
          .then(
        (value) async {
          userModel.userId = value.user!.uid;
          await _firestore.collection('users').doc(userModel.userId).set({
            'username': userModel.username,
            'email': userModel.email,
            'phone': userModel.phone,
            'token': userModel.token,
          });
        },
      );
      _firebaseAuth.currentUser!.sendEmailVerification();

      debugPrint(
          "KULLANICI BASARIYLA KAYDEDILDI ---> createUserWithEmailAndPassword");
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  //Giriş yapma
  Future<User?> logIn(
    String email,
    String password,
  ) async {
    //Firebase fonksiyonu ile email ve passwordle giriş yapma
    try {
      User? user = (await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      ))
          .user;

      if (user != null) {
        debugPrint("Login Succesfull.");
        Get.offAll(const LogoutPage());
        return user;
      } else {
        debugPrint("Login Failed.");
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
    return null;
  }

  //Çıkış yapma
  logOut() async {
    //Firebase fonksiyonu ile çıkış yapma
    try {
      await _firebaseAuth.signOut().then(
            (value) => Get.offAll(
              const LoginPage(),
            ),
          );
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
