import 'package:flutter/material.dart'; // Flutter bileşenlerini içe aktarır.
import 'widgets/custom_textformfield.dart'; // CustomTextFormField widget'ını içe aktarır.
import 'widgets/custom_scaffold.dart';

// RegisterScreen sınıfı
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key, required this.title}); // Stateless widget.

  final String title; // Ekranın başlığını tutar.

  @override
  Widget build(BuildContext context) {
    // Form için global bir anahtar. Doğrulama ve form durumunu yönetmek için kullanılır.
    final _formKey = GlobalKey<FormState>();

    // Kullanıcı girdilerini kontrol etmek için kullanılan kontrolcüler.
    final _nameController =
        TextEditingController(); // Ad Soyad alanı için kontrolcü.
    final _emailController =
        TextEditingController(); // E-posta alanı için kontrolcü.
    final _passwordController =
        TextEditingController(); // Şifre alanı için kontrolcü.

    return CustomScaffold(
      backgroundColor: const Color(0xFFC1FF72), // Arka plan rengi.
      appBar: AppBar(
        backgroundColor: const Color(0xFFC1FF72), // AppBar arka plan rengi.
        title:
            Text(title), // AppBar başlığı olarak verilen parametreyi kullanır.
      ),
      body: Padding(
        padding: const EdgeInsets.all(
            16.0), // Tüm kenarlardan 16 birim boşluk ekler.
        child: Form(
          key: _formKey, // Form doğrulama anahtarı atanır.
          child: Column(
            crossAxisAlignment: CrossAxisAlignment
                .stretch, // Kolon elemanlarını genişliğe yayar.
            children: [
              // Logo
              Center(
                child: Image.asset(
                  'assets/images/logo_hd.png', // Logo dosyasının yolu.
                  height: 150, // Logonun yüksekliği 150 birim.
                  errorBuilder: (context, error, stackTrace) {
                    return const Text(
                        "Logo yüklenemedi"); // Logo yüklenemezse bu mesaj gösterilir.
                  },
                ),
              ),
              const SizedBox(
                  height: 24), // Logodan sonra 24 birim boşluk bırakır.

              // Ad Soyad Girişi
              CustomTextFormField(
                controller:
                    _nameController, // Ad Soyad alanını kontrol eden kontrolcü.
                labelText: 'Ad Soyad', // Kullanıcıya gösterilen etiket.
                prefixIcon: Icons.person, // Alanın başındaki kişi ikonu.
                keyboardType: TextInputType.name, // Klavye türü: isim girişi.
                validator: (value) {
                  // Kullanıcı girdisini doğrulayan fonksiyon.
                  if (value == null || value.isEmpty) {
                    return 'Lütfen adınızı girin'; // Eğer boş bırakılırsa hata mesajı.
                  }
                  return null; // Eğer doğruysa hata mesajı yok.
                },
              ),
              const SizedBox(
                  height: 16), // Ad Soyad girişinden sonra 16 birim boşluk.

              // E-posta Girişi
              CustomTextFormField(
                controller:
                    _emailController, // E-posta alanını kontrol eden kontrolcü.
                labelText: 'Email', // Kullanıcıya gösterilen etiket.
                prefixIcon: Icons.email, // Alanın başındaki e-posta ikonu.
                keyboardType:
                    TextInputType.emailAddress, // Klavye türü: e-posta girişi.
                validator: (value) {
                  // Kullanıcı girdisini doğrulayan fonksiyon.
                  if (value == null || value.isEmpty) {
                    return 'Lütfen e-posta adresinizi girin'; // Eğer boş bırakılırsa hata mesajı.
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Geçerli bir e-posta adresi girin'; // Eğer format yanlışsa hata mesajı.
                  }
                  return null; // Eğer doğruysa hata mesajı yok.
                },
              ),
              const SizedBox(
                  height: 16), // E-posta girişinden sonra 16 birim boşluk.

              // Şifre Girişi
              CustomTextFormField(
                controller:
                    _passwordController, // Şifre alanını kontrol eden kontrolcü.
                labelText: 'Şifre', // Kullanıcıya gösterilen etiket.
                prefixIcon: Icons.lock, // Alanın başındaki kilit ikonu.
                obscureText:
                    true, // Girilen metin gizlenir (örneğin şifre yıldız olarak görünür).
                keyboardType:
                    TextInputType.visiblePassword, // Klavye türü: şifre girişi.
                validator: (value) {
                  // Kullanıcı girdisini doğrulayan fonksiyon.
                  if (value == null || value.isEmpty) {
                    return 'Lütfen şifrenizi girin'; // Eğer boş bırakılırsa hata mesajı.
                  }
                  if (value.length < 6) {
                    return 'Şifre en az 6 karakter olmalı'; // Eğer şifre 6 karakterden azsa hata mesajı.
                  }
                  return null; // Eğer doğruysa hata mesajı yok.
                },
              ),
              const SizedBox(
                  height: 24), // Şifre girişinden sonra 24 birim boşluk.

              // Kayıt Ol Butonu
              ElevatedButton(
                onPressed: () {
                  // Butona tıklandığında çalışacak fonksiyon.
                  if (_formKey.currentState!.validate()) {
                    // Eğer formdaki tüm alanlar doğrulanırsa.
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text(
                              'Başarıyla kayıt olundu')), // Kayıt başarılı mesajı.
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Buton arka plan rengi.
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        20), // Butonun kenarlarını yuvarlar.
                  ),
                ),
                child: const Text(
                  'Kayıt Ol', // Butonun üzerinde yazan metin.
                  style: TextStyle(
                      color: Colors.white, fontSize: 16), // Metin stili.
                ),
              ),
            ], // Column children kapanışı.
          ), // Column kapanışı.
        ), // Form kapanışı.
      ), // Padding kapanışı.
    ); // Scaffold kapanışı.
  }
}
