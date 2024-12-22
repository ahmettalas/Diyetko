import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller; // Kullanıcının girdisini yönetir.
  final String labelText; // TextField üzerindeki açıklama metni.
  final IconData prefixIcon; // TextField'in başındaki ikon.
  final bool
      obscureText; // Şifre gibi alanlarda metni gizlemek için kullanılır.
  final TextInputType
      keyboardType; // Klavye türünü belirler (örn. email, number).
  final String? Function(String?)
      validator; // Kullanıcı girdisini doğrulayan bir fonksiyon.

  const CustomTextFormField({
    super.key,
    required this.controller, // Kontrolcü zorunlu bir parametre.
    required this.labelText, // Label zorunlu bir parametre.
    required this.prefixIcon, // Prefix ikon zorunlu bir parametre.
    this.obscureText = false, // Varsayılan olarak metin gizlenmez.
    required this.keyboardType, // Klavye türü zorunlu bir parametre.
    required this.validator, // Doğrulama fonksiyonu zorunlu bir parametre.
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller, // TextField'in girişlerini kontrol eder.
      obscureText: obscureText, // Metni gizleyip gizlemeyeceğini belirler.
      keyboardType: keyboardType, // Klavye türünü ayarlar.
      decoration: InputDecoration(
        labelText: labelText, // Kullanıcıya gösterilecek etiket.
        labelStyle: const TextStyle(color: Colors.black), // Etiketin rengi.
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0), // Kenarların yuvarlaklığı.
        ),
        prefixIcon: Icon(prefixIcon, color: Colors.black), // Başlangıç ikonu.
      ),
      validator: validator, // Kullanıcı girdisini doğrular.
    );
  }
}
