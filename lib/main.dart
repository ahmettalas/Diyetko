import 'package:flutter/material.dart'; // Flutter'ın temel widget'larını içe aktarır.
import 'login_screen.dart'; // LoginScreen dosyasını içe aktarır (Başlangıç ekranı için).

void main() {
  runApp(
      const MyApp()); // Uygulamanın başlangıç noktasıdır. MyApp widget'ını başlatır.
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Stateless widget tanımı.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:
          false, // Sağ üstteki "debug" yazısını kaldırır.
      title: 'Diyetko', // Uygulama başlığı.
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Colors.green), // Tema rengi.
        useMaterial3: true, // Material 3 tasarım bileşenlerini etkinleştirir.
      ),
      home: const LoginScreen(
          title: 'Diyetko'), // LoginScreen başlangıç ekranı olarak ayarlanır.
    );
  }
}
