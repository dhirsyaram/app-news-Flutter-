import 'package:flutter/material.dart';

class CardCorrectiveMachine extends StatelessWidget {
  const CardCorrectiveMachine({super.key});

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
              "Corrective (Machine)",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Row(
              children: [
                DropdownButton<String>(
                  value: "Building A",
                  icon: Icon(Icons.arrow_downward),
                  items: const [
                    DropdownMenuItem(
                      value: "Building A",
                      child: Text("Building A"),
                    ),
                    DropdownMenuItem(
                      value: "Building B",
                      child: Text("Building B"),
                    ),
                  ],
                  onChanged: (val) {},
                ),
                DropdownButton<String>(
                  value: "Building B",
                  items: const [
                    DropdownMenuItem(
                      value: "Building A",
                      child: Text("Building A"),
                    ),
                    DropdownMenuItem(
                      value: "Building B",
                      child: Text("Building B"),
                    ),
                  ],
                  onChanged: (val) {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
