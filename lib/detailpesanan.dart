import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OrderDetailPage(),
    );
  }
}

class OrderDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Detail Pesanan',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Stack(
        children: [
          BackgroundDesign(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                OrderInfoSection(),
                SizedBox(height: 16),
                Expanded(child: OrderList()),
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

class OrderInfoSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Informasi Pemesan',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Martono Ca'),
                Text('Semarang'),
              ],
            ),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Nomor Pesanan'),
                Text('2134A8394F984'),
              ],
            ),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Waktu Pemesanan'),
                Text('19 Mar 2024 | 08:00'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class OrderList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        OrderListItem(
          name: 'Apel',
          quantity: '2x',
          price: 'Rp. 29.000',
          imageUrl: 'https://example.com/apple.jpg', // Replace with your image URL
        ),
        OrderListItem(
          name: 'Beras',
          quantity: '1x',
          price: 'Rp. 15.000',
          imageUrl: 'https://example.com/rice.jpg', // Replace with your image URL
        ),
        TotalPriceItem(
          total: 'Rp. 73.000',
        ),
      ],
    );
  }
}

class OrderListItem extends StatelessWidget {
  final String name;
  final String quantity;
  final String price;
  final String imageUrl;

  OrderListItem({
    required this.name,
    required this.quantity,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: Image.network(
          imageUrl,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        title: Text('$name $quantity'),
        trailing: Text(price),
      ),
    );
  }
}

class TotalPriceItem extends StatelessWidget {
  final String total;

  TotalPriceItem({required this.total});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        title: Text('TOTAL'),
        trailing: Text(total),
      ),
    );
  }
}
