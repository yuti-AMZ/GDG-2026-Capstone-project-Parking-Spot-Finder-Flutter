import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final Map spot;

  const DetailScreen({super.key, required this.spot});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      // 🔹 Bottom Button
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "\$5.00",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 30, vertical: 12),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.orange, Colors.deepOrange],
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Text(
                "Book Now →",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // 🔹 HEADER
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Text(
                    "Parking Details",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),

              const SizedBox(height: 10),

              // 🔹 IMAGE
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      "assets/parking.jpg",
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text("⭐ 4.8"),
                    ),
                  )
                ],
              ),

              const SizedBox(height: 20),

              // 🔹 TITLE + PRICE
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    spot["name"],
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "\$5.00/hr",
                    style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),

              const SizedBox(height: 5),

              Text(
                spot["location"],
                style: const TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 20),

              // 🔹 STATS
              Row(
                children: [
                  _box("12 Slots", Colors.grey[200]!),
                  const SizedBox(width: 10),
                  _box("0.8 mi", Colors.orange[200]!),
                ],
              ),

              const SizedBox(height: 20),

              // 🔹 MINI MAP
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 120,
                  color: Colors.grey[300],
                  child: const Center(child: Text("View on Map")),
                ),
              ),

              const SizedBox(height: 20),

              // 🔹 FACILITIES
              const Text(
                "Facilities",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  _facility("Security"),
                  _facility("CCTV"),
                  _facility("Access"),
                  _facility("EV Hub"),
                ],
              ),

              const SizedBox(height: 20),

              // 🔹 DESCRIPTION
              const Text(
                "About this location",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              const Text(
                "City Center Parking offers a premium, high-security facility located in the heart of the business district...",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _box(String text, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(child: Text(text)),
      ),
    );
  }

  Widget _facility(String name) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(name),
    );
  }
}