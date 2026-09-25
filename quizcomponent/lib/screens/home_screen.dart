import 'package:flutter/material.dart';
import '../models/food.dart';
import '../widgets/primary_text.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/food_card.dart';
import 'detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FoodKita"),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const PrimaryText(
              text: "Mau makan apa hari ini?",
              size: 22,
            ),

            const SizedBox(height: 15),

            const CustomTextField(
              hint: "Cari makanan...",
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: foods.length,

                itemBuilder: (context, index) {
                  final food = foods[index];

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15),

                    child: FoodCard(
                      food: food,

                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return DetailScreen(food: food);
                            },
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}