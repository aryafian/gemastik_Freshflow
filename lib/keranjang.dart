import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CartPage(),
    );
  }
}

class CartPage extends StatelessWidget {
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
          'Keranjang',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            OrderInfoSection(),
            SizedBox(height: 16),
            Expanded(child: OrderList()),
          ],
        ),
      ),
      bottomNavigationBar: BottomOrderBar(),
    );
  }
}

class OrderInfoSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Informasi Pemesan',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        ListTile(
          title: Text('Jalan Kebenaran'),
          trailing: TextButton(
            onPressed: () {},
            child: Text('Ubah'),
          ),
        ),
        ListTile(
          title: Text('Pesan lainnya'),
          trailing: TextButton(
            onPressed: () {},
            child: Text('Ubah'),
          ),
        ),
        SizedBox(height: 16),
        Text(
          'Daftar Pesanan',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class OrderList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        OrderListItem(),
        OrderListItem(),
      ],
    );
  }
}

class OrderListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(
          'https://example.com/apple.jpg', // Replace with your image URL
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        title: Text('Apel'),
        subtitle: Text('Rp. 29000'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {},
            ),
            Text('5'),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class BottomOrderBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Jumlah Item',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                '15 Item',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Pesanan',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'Rp. 150k',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text('Pesan Sekarang'),
          ),
        ],
      ),
    );
  }
}
