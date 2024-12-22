import 'package:flutter/material.dart';

class DietProgramPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFC1FF72),
        title: const Text(
          "Diyet Programım",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Günlük Diyet Programınız",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  _buildMealCard("Kahvaltı", "Yulaf, süt, muz", "400 kcal"),
                  _buildMealCard("Ara Öğün", "Meyveli yoğurt", "150 kcal"),
                  _buildMealCard(
                      "Öğle Yemeği", "Izgara tavuk, bulgur pilavı", "600 kcal"),
                  _buildMealCard("Ara Öğün", "Kuruyemiş", "200 kcal"),
                  _buildMealCard(
                      "Akşam Yemeği", "Izgara somon, sebzeler", "500 kcal"),
                  _buildMealCard("Gece", "Süt, ceviz", "200 kcal"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMealCard(String mealName, String details, String calories) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      child: ListTile(
        title:
            Text(mealName, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(details),
        trailing:
            Text(calories, style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}
