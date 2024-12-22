import 'package:flutter/material.dart';

class CalorieTrackingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFC1FF72),
        title: const Text(
          "Kalori Takibi",
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
              "Günlük Kalori Alımınız",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  _buildCalorieEntry("Kahvaltı", "400 kcal"),
                  _buildCalorieEntry("Ara Öğün", "150 kcal"),
                  _buildCalorieEntry("Öğle Yemeği", "600 kcal"),
                  _buildCalorieEntry("Ara Öğün", "200 kcal"),
                  _buildCalorieEntry("Akşam Yemeği", "500 kcal"),
                  _buildCalorieEntry("Gece", "200 kcal"),
                ],
              ),
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Toplam Kalori:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  "2050 kcal",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCalorieEntry(String meal, String calories) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 3,
      child: ListTile(
        title: Text(meal),
        trailing: Text(calories),
      ),
    );
  }
}
