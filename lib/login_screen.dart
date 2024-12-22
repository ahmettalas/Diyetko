import 'package:ai_diet/main_screen.dart';
import 'package:flutter/material.dart'; // Flutter bileşenlerini getirir.
import 'register_screen.dart'; // Kayıt ekranını içe aktarır.
import 'widgets/custom_textformfield.dart'; // CustomTextFormField'i içe aktarır.
import 'widgets/custom_scaffold.dart';

// LoginScreen Widget'ı
class LoginScreen extends StatefulWidget {
  const LoginScreen(
      {super.key, required this.title}); // Giriş ekranı başlığı için parametre.

  final String title; // Giriş ekranı başlığı.

  @override
  State<LoginScreen> createState() =>
      _LoginScreenState(); // Stateful yapıyı oluşturur.
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey =
      GlobalKey<FormState>(); // Form doğrulama için global anahtar.
  final _emailController = TextEditingController(); // E-posta kontrolcüsü.
  final _passwordController = TextEditingController(); // Şifre kontrolcüsü.
  bool _isPasswordVisible = true; // Şifre gizleme durumu.

  @override
  Widget build(BuildContext context) {
    final mediaQuery =
        MediaQuery.of(context); // Ekran boyutlarına erişim sağlar.

    return CustomScaffold(
      backgroundColor: const Color(0xFFC1FF72), // Arka plan rengi.
      appBar: AppBar(
        backgroundColor: const Color(0xFFC1FF72), // AppBar arka plan rengi.
        title: Text(widget.title), // AppBar başlığı.
      ),
      body: Padding(
        padding: EdgeInsets.all(
            mediaQuery.size.width * 0.05), // Responsive kenar boşluğu.
        child: Form(
          key: _formKey, // Form doğrulama anahtarı atanır.
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.stretch, // Kolon elemanlarını yayar.
            children: [
              // Logo Bölümü
              Center(
                child: Image.asset(
                  'assets/images/logo_hd.png', // Logo yolu.
                  height:
                      mediaQuery.size.height * 0.35, // Responsive yükseklik.
                  errorBuilder: (context, error, stackTrace) {
                    return const Text(
                        "Logo yüklenemedi"); // Logo yüklenemezse gösterilecek metin.
                  },
                ),
              ),
              SizedBox(height: mediaQuery.size.height * 0.03), // Boşluk.

              // E-posta Girişi
              CustomTextFormField(
                controller: _emailController, // Kullanıcı giriş kontrolcüsü.
                labelText: 'Email', // E-posta etiketi.
                prefixIcon: Icons.email, // İkon.
                keyboardType: TextInputType.emailAddress, // Klavye türü.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Lütfen e-posta adresinizi girin'; // Boş doğrulama.
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Geçerli bir e-posta adresi girin'; // Regex doğrulama.
                  }
                  return null;
                },
              ),
              SizedBox(height: mediaQuery.size.height * 0.02), // Boşluk.

              // Şifre Girişi
              CustomTextFormField(
                controller: _passwordController, // Kullanıcı giriş kontrolcüsü.
                labelText: 'Şifre', // Şifre etiketi.
                prefixIcon: Icons.lock, // İkon.
                obscureText: _isPasswordVisible, // Şifre gizleme.
                keyboardType: TextInputType.visiblePassword, // Klavye türü.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Lütfen şifrenizi girin'; // Boş doğrulama.
                  }
                  if (value.length < 6) {
                    return 'Şifre en az 6 karakter olmalı'; // Uzunluk doğrulama.
                  }
                  return null;
                },
              ),
              SizedBox(height: mediaQuery.size.height * 0.03), // Boşluk.

              // Giriş Yap Butonu
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainScreen(title: 'Diyetko'),
                        ));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text(
                              'Başarıyla giriş yapıldı')), // Snackbar mesajı.
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Buton rengi.
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(20), // Yuvarlak kenarlar.
                  ),
                ),
                child: const Text(
                  'Giriş Yap', // Buton yazısı.
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              SizedBox(height: mediaQuery.size.height * 0.02), // Boşluk.

              // Kayıt Ol Ekranına Git Butonu
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterScreen(
                          title: 'Kayıt Ol'), // Kayıt ekranı.
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Buton rengi.
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(20), // Yuvarlak kenarlar.
                  ),
                ),
                child: const Text(
                  'Kayıt Ol', // Buton yazısı.
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ], // Column children kapanışı.
          ), // Column kapanışı.
        ), // Form kapanışı.
      ), // Padding kapanışı.
    ); // Scaffold kapanışı.
  }
}
