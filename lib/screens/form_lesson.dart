import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormLesson extends StatefulWidget {
  const FormLesson({super.key});

  @override
  State<FormLesson> createState() => _FormLessonState();
}

class _FormLessonState extends State<FormLesson> {
  final TextEditingController emailController =
      TextEditingController();
  final TextEditingController passwordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String request = '';
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 130),

                /// Email Field
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email is required";
                    }
                    if (!value.endsWith("@gmail.com")) {
                      return 'Write Email In Right Format';
                    }
                    return null;
                  },
                  controller: emailController,
                  style: const TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "Email Address",
                    prefixIcon: const Icon(Icons.email_outlined),
                    hintStyle: const TextStyle(
                      color: Colors.white54,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                /// Password Field
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Fill The Password';
                    }
                    if (value.length < 9) {
                      return 'Password Must be 9 numbers';
                    }
                    return null;
                  },
                  controller: passwordController,
                  maxLength: 9,
                  obscureText:
                      true, // Typically used for passwords
                  style: const TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: const Icon(Icons.lock_open),
                    suffixIcon: const Icon(CupertinoIcons.eye),
                    hintStyle: const TextStyle(
                      color: Colors.white54,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                /// Login Button
                GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        request = "Request";
                      });
                    } else {
                      return;
                    }
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: const Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 120),

                /// Static Display Labels
                Text(
                  "Request : $request ",
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Email : ",
                  style: TextStyle(color: Colors.white),
                ),
                const Text(
                  "Password : ",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
