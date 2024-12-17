import 'package:ai_diet/main.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.title});

  final String title;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    ScreenUtil ekran = ScreenUtil(context);
    return Scaffold(
      backgroundColor: Color(0xFFC1FF72),
      appBar: AppBar(
        backgroundColor: Color(0xFFC1FF72),
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Logo Section
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(60.0),
                  child: Image.asset(
                    'assets/images/logo_hd.jpeg', // Replace with your logo path
                    height: ekran.ekranYuksekligi / 3.5,
                  ),
                ),
              ),

              // Email TextFormField
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  prefixIcon: const Icon(Icons.email, color: Colors.black),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Lütfen e-posta adresinizi girin';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Geçerli bir e-posta adresi girin';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20.0),

              // Password TextFormField
              TextFormField(
                controller: _passwordController,
                obscureText: _isPasswordVisible,
                decoration: InputDecoration(
                  labelText: 'Şifre',
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  prefixIcon: const Icon(Icons.lock, color: Colors.black),
                  suffixIcon: GestureDetector(
                    onLongPress: () {
                      setState(() {
                        _isPasswordVisible = false;
                      });
                    },
                    onLongPressUp: () {
                      setState(() {
                        _isPasswordVisible = true;
                      });
                    },
                    child: Icon(
                      _isPasswordVisible
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.black,
                    ),
                  ),
                ),
                keyboardType: TextInputType.visiblePassword,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Lütfen şifrenizi girin';
                  }
                  if (value.length < 6) {
                    return 'Şifre en az 6 karakter olmalı';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 50.0),

              // Login Button
              Center(
                child: SizedBox(
                  width: ekran.ekranGenisligi / 1.65,
                  height: ekran.ekranYuksekligi / 20, // Genişliğin yarısı
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print('E-posta Doğru: ${_emailController.text}');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      // padding: const EdgeInsets.symmetric(vertical: 16.0),
                      // padding text yapısını bozuyor
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                    child: const Text(
                      'Giriş Yap',
                      style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 23),
              Center(
                child: SizedBox(
                  width: ekran.ekranGenisligi / 1.65,
                  height: ekran.ekranYuksekligi / 20, // Genişliğin yarısı
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      // padding: const EdgeInsets.symmetric(vertical: 16.0),
                      // padding text yapısını bozuyor
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    child: const Text(
                      'Kayıt Ol',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
