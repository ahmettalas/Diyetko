import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body; // Sayfanın ana içeriği
  final String? title; // AppBar başlığı (isteğe bağlı)
  final bool resizeToAvoidBottomInset; // Klavye açıldığında yeniden boyutlandırma
  final Color? backgroundColor; // Arka plan rengi
  final AppBar? appBar; // Özel AppBar ekleme

  const CustomScaffold({
    super.key,
    required this.body,
    this.title,
    this.resizeToAvoidBottomInset = true,
    this.backgroundColor, // Varsayılan null, theme'e bağlı kalır.
    this.appBar, // Varsayılan null, özel bir AppBar eklenebilir.
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset, // Klavye ile ekran boyutlandırma
      backgroundColor: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor, // Arka plan rengi
      appBar: appBar ??
          (title != null
              ? AppBar(
                  title: Text(title!),
                )
              : null), // Eğer AppBar verilmişse özel, yoksa başlık gösterilir.
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Kenarlardan boşluk
          child: body, // Sayfanın içeriği
        ),
      ),
    );
  }
}