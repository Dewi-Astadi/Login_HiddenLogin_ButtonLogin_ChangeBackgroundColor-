import 'package:flutter/material.dart';

class Login2Screen extends StatefulWidget {
  const Login2Screen({super.key});

  @override
  State<Login2Screen> createState() => _Login2ScreenState();
}

class _Login2ScreenState extends State<Login2Screen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool tampilPassword = true;

  showPassword() {
    setState(() {
      tampilPassword = !tampilPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(controller: emailController),
            TextField(
              obscureText: tampilPassword,
              controller: passwordController,
              decoration: InputDecoration(
                labelText: "password",
                hintText: "masukkan password",
                // suffixIcon:Icon(
                //   tampilPassword ? Icons.visibility_off: Icons.visibility_off),
                suffixIcon: IconButton(
                  onPressed: () {
                    showPassword();
                  },
                  icon: Icon(
                    tampilPassword
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                ),
              ),
            ),
            ElevatedButton(onPressed: () {}, child: Text('Login'))
          ],
        ),
      ),
    );
  }
}
