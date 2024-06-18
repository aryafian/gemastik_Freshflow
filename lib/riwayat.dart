import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HistoryPage(),
    );
  }
}

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Riwayat',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Stack(
        children: [
          BackgroundDesign(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                HistorySection(
                  month: 'January',
                  items: [
                    HistoryItem(date: '18 Des 2021', itemCount: 2),
                    HistoryItem(date: '18 Des 2021', itemCount: 2),
                  ],
                ),
                HistorySection(
                  month: 'February',
                  items: [
                    HistoryItem(date: '20 Feb 2022', itemCount: 3),
                    HistoryItem(date: '21 Feb 2022', itemCount: 1),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }
}

class BackgroundDesign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class HistorySection extends StatelessWidget {
  final String month;
  final List<HistoryItem> items;

  HistorySection({required this.month, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          month,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        ...items,
        SizedBox(height: 16),
      ],
    );
  }
}

class HistoryItem extends StatelessWidget {
  final String date;
  final int itemCount;

  HistoryItem({required this.date, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 2,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        title: Text('$itemCount Item'),
        subtitle: Text(date),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
