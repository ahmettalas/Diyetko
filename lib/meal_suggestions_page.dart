import 'package:flutter/material.dart';

class MealSuggestionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFC1FF72),
        title: const Text(
          "Öğün Önerileri",
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
              "Size Uygun Öğünler",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  _buildSuggestionCard("Avokado Tost", "Kalori: 250 kcal"),
                  _buildSuggestionCard("Sebzeli Omlet", "Kalori: 300 kcal"),
                  _buildSuggestionCard("Izgara Hindi", "Kalori: 400 kcal"),
                  _buildSuggestionCard("Smoothie Bowl", "Kalori: 350 kcal"),
                  _buildSuggestionCard("Izgara Balık", "Kalori: 450 kcal"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSuggestionCard(String meal, String calories) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      child: ListTile(
        title: Text(meal, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(calories),
      ),
    );
  }
}