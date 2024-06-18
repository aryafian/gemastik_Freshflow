import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Cari Produk Segar...',
            border: InputBorder.none,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  FilterChip(label: Text('Semua'), onSelected: (bool value) {}),
                  SizedBox(width: 10),
                  FilterChip(label: Text('Buah'), onSelected: (bool value) {}),
                  SizedBox(width: 10),
                  FilterChip(label: Text('Sayur'), onSelected: (bool value) {}),
                  SizedBox(width: 10),
                  FilterChip(label: Text('Lainnya'), onSelected: (bool value) {}),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  ProductCard(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'https://example.com/apple.jpg', // Replace with your image URL
              height: 150,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 8),
            Text(
              'Apel',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star_border, color: Colors.amber),
                SizedBox(width: 10),
                Text('40 Min'),
                SizedBox(width: 10),
                Text('Rp. 29.000'),
              ],
            ),
            SizedBox(height: 8),
            Text(
              'Nikmati kelezatan apel segar yang ditanam dengan sepenuh hati dari kebun terbaik. Apel kami kaya akan vitamin dan mineral yang essential untuk kesehatan tubuh Anda.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: Text('Tambah'),
            ),
          ],
        ),
      ),
    );
  }
}
