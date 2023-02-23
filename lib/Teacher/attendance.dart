import 'package:flutter/material.dart';

class Attendance extends StatelessWidget {
  const Attendance({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      appBar: AppBar(
        title: const Text('Attendance Record'),
      ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const Text('Number of days : '),
              Table(
                border:TableBorder.all(),
                children: const [
                  TableRow(
                    children: [
                      Text('Row 1, Column 1'),
                      Text('Row 1, Column 2'),
                      Text('Row 1, Column 3'),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text('Row 2, Column 1'),
                      Text('Row 2, Column 2'),
                      Text('Row 2, Column 3'),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text('Row 3, Column 1'),
                      Text('Row 3, Column 2'),
                      Text('Row 3, Column 3'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
