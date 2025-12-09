import 'package:flutter/material.dart';

class CardSparePartUsage extends StatelessWidget {
  const CardSparePartUsage({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 14.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Spare Part Usage",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            DropdownButton<String>(
              value: "Alloy Casting",
              items: const [
                DropdownMenuItem(
                  value: "Alloy Casting",
                  child: Text("Alloy Casting"),
                ),
                DropdownMenuItem(value: "Steel", child: Text("Steel")),
              ],
              onChanged: (val) {
              },
            ),
            const SizedBox(height: 12),
            Container(
              height: 150,
              decoration: BoxDecoration(
                color: Colors.orange[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text("Monthly Usage Chart Placeholder"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
