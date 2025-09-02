// lib/screens/detail.dart

import 'package:flutter/material.dart';
import 'package:interview_app/screens/explorasi.dart'; // Import ExplorationItem

class DetailScreen extends StatelessWidget {
  final ExplorationItem item;

  const DetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. Latar Belakang Utama
      backgroundColor: const Color(0xFF43A39D),
      body: Stack(
        children: [
          // Gambar pola di latar belakang dengan opasitas
          

          // 2. Konten Utama
          SafeArea(
            bottom: false, // SafeArea tidak berlaku untuk bagian bawah
            child: Column(
              children: [
                // Bagian atas untuk tombol kembali
                _buildCustomAppBar(context),
                
                // Kontainer putih yang bisa di-scroll
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.only(top: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Gambar utama di dalam container
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image.asset(
                                item.imageDetailUrl,
                                width: double.infinity,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          
                          // Konten teks dan tombol
                          Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(item.title, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Color(0xFF222939))),
                                const SizedBox(height: 12),
                                Text('Tanggal: ${item.date}', style: TextStyle(fontSize: 15, color: Colors.grey[700])),
                                const SizedBox(height: 8),
                                Text('Lokasi: ${item.location}', style: TextStyle(fontSize: 15, color: Colors.grey[700])),
                                const SizedBox(height: 20),
                                Text(item.fullDescription, style: const TextStyle(fontSize: 16, height: 1.6, color: Color(0xFF454F63))),
                                const SizedBox(height: 24),
                                Row(
                                  children: [
                                    _buildActionButton(icon: Icons.favorite, label: 'Suka', color: Colors.redAccent),
                                    const SizedBox(width: 24),
                                    _buildActionButton(icon: Icons.chat_bubble_outline, label: 'Komentar', color: Colors.blueAccent),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Widget helper untuk AppBar kustom
  Widget _buildCustomAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
            onPressed: () => Navigator.of(context).pop(),
          ),
          // Anda bisa menambahkan ikon lain di kanan jika perlu
          // IconButton(icon: const Icon(Icons.more_vert, color: Colors.white, size: 28), onPressed: () {}),
        ],
      ),
    );
  }

  /// Widget helper untuk membuat tombol aksi 'Suka' dan 'Komentar'
  Widget _buildActionButton({required IconData icon, required String label, required Color color}) {
    return InkWell(
      onTap: () {}, // Tambahkan logika di sini
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          children: [
            Icon(icon, color: color, size: 22),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                color: Color(0xFF454F63),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}