import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawyerup/controllers/auth_controller.dart';
import 'package:lawyerup/models/user_model.dart';
import 'package:lawyerup/pages/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  AuthController? authController;

  bool showPw = true;

  @override
  void initState() {
    authController = Get.find(tag: 'auth');
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Container(
            width: size.width,
            height: size.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                stops: [
                  0.1,
                  0.4,
                  0.6,
                ],
                colors: [
                  Colors.pink,
                  Color.fromARGB(255, 30, 104, 165),
                  Color.fromARGB(255, 34, 55, 66),
                ],
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 10,
                sigmaY: 10,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 170),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          //username field
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 40, left: 70, right: 70),
                            child: TextFormField(
                              controller: _usernameController,
                              key: const ValueKey('username'),
                              validator: (username) {
                                if (username!.isEmpty) {
                                  return "Lütfen kullanıcı adın girin.";
                                } else if (username.length < 2) {
                                  return "Lütfen en az 2 karakter girin.";
                                }
                                return null;
                              },
                              style: const TextStyle(color: Colors.white),
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 20,
                                ),
                                label: const Text(
                                  "Kullanıcı Adı",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                    width: 2,
                                    color: Colors.white,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                    width: 2,
                                    color: Colors.white,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                    width: 2,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          //email field
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 20, left: 70, right: 70),
                            child: TextFormField(
                              controller: _emailController,
                              key: const ValueKey('email'),
                              validator: (email) {
                                if (email!.isEmpty || !email.contains('@')) {
                                  return "Lütfen e-mail adresi girin.";
                                }
                                return null;
                              },
                              style: const TextStyle(color: Colors.white),
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 20,
                                ),
                                label: const Text(
                                  "E-mail",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                    width: 2,
                                    color: Colors.white,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                    width: 2,
                                    color: Colors.white,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                    width: 2,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          //phone field
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 20, left: 70, right: 70),
                            child: TextFormField(
                              controller: _phoneController,
                              key: const ValueKey('phone'),
                              validator: (phone) {
                                if (phone!.isEmpty) {
                                  return "Lütfen telefon numarası girin.";
                                } else if (phone.length < 5) {
                                  return "Lütfen en az 5 karakter girin.";
                                }
                                return null;
                              },
                              style: const TextStyle(color: Colors.white),
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 20,
                                ),
                                label: const Text(
                                  "Telefon",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                    width: 2,
                                    color: Colors.white,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                    width: 2,
                                    color: Colors.white,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                    width: 2,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          //password field
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 20.0, right: 70, left: 70),
                            child: TextFormField(
                              controller: _passwordController,
                              key: const ValueKey('password'),
                              validator: (password) {
                                if (password!.isEmpty) {
                                  return "Lütfen şifre girin.";
                                } else if (password.length < 6) {
                                  return "Lütfen en az 6 karakter girin.";
                                }
                                return null;
                              },
                              style: const TextStyle(color: Colors.white),
                              cursorColor: Colors.white,
                              obscureText: showPw,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 20,
                                ),
                                label: const Text(
                                  "Şifre",
                                  style: TextStyle(color: Colors.white),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                    width: 2,
                                    color: Colors.white,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                    width: 2,
                                    color: Colors.white,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                    width: 2,
                                    color: Colors.red,
                                  ),
                                ),
                                suffixIcon: IconButton(
                                  onPressed: (() {
                                    setState(() {
                                      showPw = !showPw;
                                    });
                                  }),
                                  icon: Icon(
                                    showPw
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          //register button
                          Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                minimumSize: const Size(150, 25),
                                backgroundColor: const Color(0xFFC7A855),
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  UserModel userModel = UserModel();
                                  userModel.username = _usernameController.text;
                                  userModel.email = _emailController.text;
                                  userModel.phone = _phoneController.text;
                                  authController!.createUserWithEmail(
                                    userModel,
                                    _passwordController.text,
                                  );
                                  debugPrint("ADI:${_usernameController.text}");
                                  debugPrint("EMAIL:${_emailController.text}");
                                  debugPrint(
                                      "TELEFON:${_phoneController.text}");
                                  Get.rawSnackbar(
                                    titleText:
                                        const Icon(Icons.notifications_active),
                                    messageText: const Center(
                                      child: Text(
                                          "Başarıyla Kayıt Olundu. Lütfen emailinizi doğrulayın."),
                                    ),
                                    duration: const Duration(seconds: 3),
                                    borderRadius: 20,
                                    backgroundColor: Colors.green,
                                    snackPosition: SnackPosition.TOP,
                                  );

                                  Get.to(const LoginPage());
                                }
                              },
                              child: const Text(
                                "Kayıt Ol",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: Colors.white),
                              ),
                            ),
                          ),

                          //go login button
                          Padding(
                            padding: const EdgeInsets.only(top: 65, left: 20),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    const Text(
                                      "Zaten Üye misiniz?",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.to(
                                          const LoginPage(),
                                          transition: Transition.cupertino,
                                          duration:
                                              const Duration(milliseconds: 400),
                                        );
                                      },
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Row(
                                          children: const [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 5),
                                              child: Text(
                                                "Giriş Yap",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Icon(
                                              Icons.arrow_circle_right_outlined,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
