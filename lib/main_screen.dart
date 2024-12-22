import 'package:ai_diet/about_page.dart';
import 'package:ai_diet/profile_page.dart';
import 'package:flutter/material.dart';
import 'diet_program_page.dart'; // Diyet Programı ekranını içe aktarın.
import 'calorie_tracking_page.dart'; // Kalori Takibi ekranını içe aktarın.
import 'meal_suggestions_page.dart'; // Öğün Önerileri ekranını içe aktarın.
import 'settings_page.dart'; // Ayarlar ekranını içe aktarın.

class MainScreen extends StatelessWidget {
  final String title;

  const MainScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context); // Ekran boyutlarına erişim

    return Scaffold(
      backgroundColor: const Color(0xFFC1FF72), // Ana ekran arka plan rengi
      appBar: AppBar(
        backgroundColor: const Color(0xFFC1FF72), // AppBar arka plan rengi
        elevation: 0,
        title: Text(
          title, // Başlık
          style: const TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding:
            EdgeInsets.all(mediaQuery.size.width * 0.05), // Kenar boşlukları
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hoş Geldiniz Mesajı
            const Text(
              "Hoş Geldiniz!",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Sağlıklı yaşam hedeflerinize ulaşmak için buradayız.",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),

            // Hızlı Erişim Kartları
            Expanded(
              child: GridView.count(
                crossAxisCount: 2, // İki sütunlu grid
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  _buildFeatureCard(
                    icon: Icons.restaurant,
                    title: "Diyet Programı",
                    context: context,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DietProgramPage()),
                      );
                    },
                  ),
                  _buildFeatureCard(
                    icon: Icons.bar_chart,
                    title: "Kalori Takibi",
                    context: context,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CalorieTrackingPage()),
                      );
                    },
                  ),
                  _buildFeatureCard(
                    icon: Icons.food_bank,
                    title: "Öğün Önerileri",
                    context: context,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MealSuggestionsPage()),
                      );
                    },
                  ),
                  _buildFeatureCard(
                    icon: Icons.settings,
                    title: "Ayarlar",
                    context: context,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SettingsPage()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // Alt Gezinme Menüsü
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFFC1FF72),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Ana Sayfa",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profil",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: "Hakkında",
          ),
        ],
        onTap: (index) {
          if (index == 1) {
            // Profil sekmesine tıklanırsa
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          } else if (index == 2) {
            // Hakkında sekmesine tıklanırsa
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AboutPage()),
            );
          }
        },
      ),
    );
  }

  // Hızlı Erişim Kartı
  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required BuildContext context,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // Yuvarlatılmış köşeler
        ),
        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.black),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
