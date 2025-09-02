// lib/screens/explorasi.dart

import 'package:flutter/material.dart';
import 'package:interview_app/screens/detail.dart';
import 'package:intl/intl.dart';

// 1. Model Data yang Diperkaya
class ExplorationItem {
  final String imageUrl; // Gambar untuk daftar
  final String imageDetailUrl; // Gambar untuk halaman detail
  final String date;
  final String title;
  final String description; // Deskripsi singkat
  final String location;
  final String fullDescription; // Deskripsi lengkap

  const ExplorationItem({
    required this.imageUrl,
    required this.imageDetailUrl,
    required this.date,
    required this.title,
    required this.description,
    required this.location,
    required this.fullDescription,
  });
}

// 2. Data Dummy yang Lebih Lengkap dan Bervariasi
final List<ExplorationItem> explorationData = [
  const ExplorationItem(
    imageUrl: 'assets/astronot.png',
    imageDetailUrl: 'assets/astronot.png',
    date: '19 Agustus 2024',
    title: 'Penemuan Mengejutkan di Bulan',
    description: 'Bulan, satelit alami yang paling dekat dengan...',
    location: 'Jakarta, Indonesia',
    fullDescription:
        'Jakarta, 19 Agustus 2024 – Bulan, satelit alami yang paling dekat dengan Bumi, telah mengejutkan para ilmuwan dengan penemuan terbaru yang membuka babak baru dalam penelitian luar angkasa. Data yang diperoleh dari misi Artemis dan teleskop canggih menunjukkan temuan signifikan tentang geologi dan potensi sumber daya di permukaan Bulan.',
  ),
  const ExplorationItem(
    imageUrl: 'assets/astronot.png',
    imageDetailUrl: 'assets/astronot.png',
    date: '21 Agustus 2024',
    title: 'Keajaiban Cincin Saturnus',
    description: 'Saturnus, planet yang terkenal dengan sistem...',
    location: 'Bandung, Indonesia',
    fullDescription:
        'Bandung, 21 Agustus 2024 – Penelitian terbaru terhadap cincin Saturnus mengungkapkan komposisi partikel es yang lebih kompleks dari perkiraan sebelumnya. Wahana Cassini berhasil mengirimkan data yang menunjukkan adanya jejak material organik, memicu perdebatan baru tentang asal-usul kehidupan di tata surya.',
  ),
  // Tambahkan data lain dengan cara yang sama
];

class ExplorasiScreen extends StatelessWidget {
  const ExplorasiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F2F5),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(24.0),
          children: [
            const Text(
              'Hai, Mulai Eksplorasi Kamu 🚀',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF333333),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Masuk ke aplikasi untuk mulai eksplorasi bersama kami sekarang',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
                height: 1.4,
              ),
            ),
            const SizedBox(height: 32),
            ...explorationData.map((item) {
              return ExplorationCard(item: item);
            }),
          ],
        ),
      ),
    );
  }
}

class ExplorationCard extends StatelessWidget {
  final ExplorationItem item;
  const ExplorationCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    // 3. Menggunakan InkWell untuk feedback visual saat di-tap
    return Card(
      elevation: 4,
      shadowColor: Colors.black.withOpacity(0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      margin: const EdgeInsets.only(bottom: 16.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(16.0),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(item: item),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.asset(
                    item.imageUrl,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateFormat('EEEE, d MMMM yyyy', 'id_ID').format(DateFormat('d MMMM yyyy', 'id_ID').parse(item.date)),
                      style: TextStyle(color: Colors.grey[600], fontSize: 13, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 6),
                    Text(item.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Color(0xFF333333))),
                    const SizedBox(height: 6),
                    Text(item.description, style: TextStyle(color: Colors.grey[800], fontSize: 14), overflow: TextOverflow.ellipsis, maxLines: 1),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}