import 'package:flutter/material.dart';
import 'dart:io';

class MainPage extends StatelessWidget {
  final File? imageFile;

  const MainPage({super.key, this.imageFile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFFFFF6E0),
        child: Column(
          children: [
            // Bagian atas dengan avatar dan selamat siang
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              decoration: const BoxDecoration(
                color: Color(0xFFFFE4C0),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.grey[300],
                        backgroundImage: imageFile != null
                            ? FileImage(imageFile!)
                            : const AssetImage('images/opening1.jpg')
                                as ImageProvider,
                        child: imageFile == null
                            ? const Icon(Icons.person, color: Colors.white)
                            : null,
                      ),
                      const SizedBox(width: 10),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Selamat siang, (nama) 🌟',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Mau lihat katalog apa hari ini?',
                            style:
                                TextStyle(fontSize: 14, color: Colors.black54),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Ketik barang',
                      prefixIcon:
                          const Icon(Icons.search, color: Colors.black54),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Bagian kategori
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CategoryCard(title: 'Ruang tamu', icon: Icons.chair),
                      CategoryCard(title: 'Dapur', icon: Icons.kitchen),
                      CategoryCard(title: 'Kamar tidur', icon: Icons.bed),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Rekomendasi untukmu',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      RecommendationTag(text: 'Sofa'),
                      RecommendationTag(text: 'Rak TV'),
                      RecommendationTag(text: 'Meja makan'),
                      RecommendationTag(text: 'Kursi makan'),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Bagian item rekomendasi
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: const [
                    RecommendationCard(image: 'opening1.jpg'),
                    RecommendationCard(image: 'opening2.jpg'),
                  ],
                ),
              ),
            ),

            // Bagian navigasi bawah
            BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), label: 'Beranda'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.qr_code_scanner), label: 'Scan'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: 'Profil'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const CategoryCard({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: const Color(0xFFECECEC),
          child: Icon(icon, color: Colors.black, size: 30),
        ),
        const SizedBox(height: 5),
        Text(
          title,
          style: const TextStyle(fontSize: 14, color: Colors.black),
        ),
      ],
    );
  }
}

class RecommendationTag extends StatelessWidget {
  final String text;

  const RecommendationTag({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFFFE4C0),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 14, color: Colors.black),
      ),
    );
  }
}

class RecommendationCard extends StatelessWidget {
  final String image;

  const RecommendationCard({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
      ),
    );
  }
}
