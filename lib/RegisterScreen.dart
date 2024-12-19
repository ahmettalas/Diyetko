import 'package:ai_diet/main.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key, required this.title});

  final String title;

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    final screenUtil = ScreenUtil(context);

    return Scaffold(
      backgroundColor: Color(0xFFC1FF72),
      appBar: AppBar(
        backgroundColor: Color(0xFFC1FF72),
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenUtil.yukseklikOranla(1 / 70)),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Logo Bölümü
              Center(
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: screenUtil.yukseklikOranla(1 / 20),
                      top: screenUtil.yukseklikOranla(1 / 25)),
                  child: Image.asset(
                    'assets/images/logo_hd.png', // Replace with your logo path
                    height: screenUtil.yukseklikOranla(1 / 3.5),
                  ),
                ),
              ),

              // Ad Soyad TextFormField
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Ad Soyad',
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  prefixIcon: const Icon(Icons.person, color: Colors.black),
                ),
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Lütfen adınızı ve soyadınızı girin';
                  }
                  return null;
                },
              ),
              SizedBox(height: screenUtil.yukseklikOranla(0.02)),

              // Email TextFormField
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
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
              SizedBox(height: screenUtil.yukseklikOranla(0.02)),

              // Şifre TextFormField
              TextFormField(
                controller: _passwordController,
                obscureText: _isPasswordVisible,
                decoration: InputDecoration(
                  labelText: 'Şifre',
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
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
              SizedBox(height: screenUtil.yukseklikOranla(0.07)),

              // Kayıt Ol Butonu
              Center(
                child: SizedBox(
                  width: screenUtil.genislikOranla(0.54),
                  height: screenUtil.yukseklikOranla(0.07),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print('Ad Soyad: ${_nameController.text}');
                        print('E-posta: ${_emailController.text}');
                        print('Şifre: ${_passwordController.text}');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: const Text(
                      'Kayıt Ol',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenUtil.yukseklikOranla(0.02)),

              // Giriş Yap Butonu
            ],
          ),
        ),
      ),
    );
  }
}
