import 'package:flutter/material.dart';

// Hakkında ekranı için tasarlanan widget
class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFC1FF72), // AppBar'ın arka plan rengi
        title: const Text(
          "Hakkında", // Başlık
          style: TextStyle(color: Colors.black), // Başlık metni rengi
        ),
        centerTitle: true, // Başlığı ortalar
        iconTheme: const IconThemeData(color: Colors.black), // Geri düğmesi rengi
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Ekran kenarlarından boşluk bırakır
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Elemanları sola yaslar
          children: const [
            Text(
              "AI Diyetisyen Uygulaması", // Uygulama adı
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), // Yazı stili
            ),
            SizedBox(height: 10), // Başlık ile açıklama arasında boşluk
            Text(
              "Bu uygulama, kullanıcıların kilo alma, verme veya formunu koruma hedeflerine ulaşmalarına yardımcı olur. Yapay zeka destekli öneri sistemi, kullanıcılara sağlıklı yaşam tarzını destekleyen öğün önerileri sunar.",
              style: TextStyle(fontSize: 16), // Açıklama yazı stili
            ),
            SizedBox(height: 20), // Bölümler arasında boşluk
            Text(
              "Özellikler:", // Alt başlık
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), // Yazı stili
            ),
            SizedBox(height: 10), // Alt başlık ile içerik arasında boşluk
            Text(
              "- Kişiselleştirilmiş diyet planları\n"
              "- Günlük kalori takibi\n"
              "- Yapay zeka destekli öğün önerileri\n"
              "- Kullanıcı dostu arayüz ve ayarlar",
              style: TextStyle(fontSize: 16), // Liste yazı stili
            ),
            SizedBox(height: 20), // Liste ile geliştirici bilgileri arasında boşluk
            Text(
              "Geliştirici Bilgileri:", // Alt başlık
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), // Yazı stili
            ),
            SizedBox(height: 10), // Alt başlık ile içerik arasında boşluk
            Text(
              "Bu uygulama, kullanıcıların sağlık hedeflerine ulaşmalarını desteklemek için Flutter ile geliştirilmiştir.",
              style: TextStyle(fontSize: 16), // Açıklama yazı stili
            ),
          ],
        ),
      ),
    );
  }
}