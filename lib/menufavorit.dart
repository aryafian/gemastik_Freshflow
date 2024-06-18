import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MenuFavoritScreen(),
    );
  }
}

class MenuFavoritScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Favorit'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FavoriteItem(
              imageUrl: 'https://via.placeholder.com/400x200.png?text=Apel',
              title: 'Apel',
              description:
                  'Nikmati kelezatan apel segar yang ditanam dengan sepenuh hati dari kebun terbaik. Apel kami kaya akan vitamin dan mineral, yang esensial untuk ...',
            ),
            FavoriteItem(
              imageUrl: 'https://via.placeholder.com/400x200.png?text=Beras',
              title: 'Beras',
              description:
                  'Beras berkualitas tinggi yang dipilih secara hati-hati untuk memastikan cita rasa dan nutrisi terbaik bagi keluarga Anda...',
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
        ],
      ),
    );
  }
}

class FavoriteItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;

  FavoriteItem({
    required this.imageUrl,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.network(
                imageUrl,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                description,
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.favorite,
                color: Colors.pink,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
