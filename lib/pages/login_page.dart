import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawyerup/controllers/auth_controller.dart';
import 'package:lawyerup/pages/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  AuthController? authController;

  bool showPw = true;

  @override
  void initState() {
    authController = Get.put(AuthController(), tag: 'auth');
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
                    padding: const EdgeInsets.only(top: 100),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          //app logo
                          CircleAvatar(
                            radius: 100,
                            backgroundColor: Colors.transparent,
                            child:
                                Image.asset('assets/images/law-scale-logo.png'),
                          ),

                          //logo text
                          const Text(
                            "Adalet Mülkün Temelidir",
                            style: TextStyle(
                                color: Color(0xFFC7A855),
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),

                          //email field
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 40, left: 70, right: 70),
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

                          //LogIn button
                          Padding(
                            padding: const EdgeInsets.only(top: 50),
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
                                  authController!.logIn(_emailController.text,
                                      _passwordController.text);
                                }
                              },
                              child: const Text(
                                "Giriş",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: Colors.white),
                              ),
                            ),
                          ),

                          //go Register button
                          Padding(
                            padding: const EdgeInsets.only(top: 65, left: 20),
                            child: Row(
                              //mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    const Text(
                                      "Hesabınız yok mu?",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.to(
                                          const RegisterPage(),
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
                                                "Kayıt Ol",
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
