import 'package:flutter/material.dart';

class EndCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 182, 223),
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[400]!,
            offset: const Offset(0, -4),
            blurRadius: 4,
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildInfoRow('Email', 'your@email.com'),
                    buildInfoRow('Phone Number', '+123 456 789'),
                    buildInfoRow('Location', 'Your Location'),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Founded in',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    '2020', // Replace with the actual founding year
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Row(
            children: [
              Expanded(
                child: Text(
                  'Rhapsody in Rose',
                  style: TextStyle(
                    fontSize: 36,
                    fontFamily: 'cursive', // Set the cursive font
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildInfoRow(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 14),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
