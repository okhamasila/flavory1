import 'package:flutter/material.dart';

void main() {
  runApp(const ProfilePage());
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade100, // Latar belakang abu-abu terang
        body: Padding(
          padding: const EdgeInsets.only(top: 50.0), // Padding tambahan di bagian atas
          child: Column(
            children: [
              // Profil Pengguna
              Align(
                alignment: Alignment.topCenter, // Position the container at the top center
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9, // Lebar 90% dari layar
                  padding: const EdgeInsets.all(16.0), // Padding internal
                  decoration: BoxDecoration(
                    color: Colors.white, // Warna background putih
                    borderRadius: BorderRadius.circular(12.0), // Border melengkung
                    border: Border.all(
                      color: Colors.orange, // Warna border oranye
                      width: 2.0,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8.0,
                        offset: Offset(0, 4),
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min, // Ukuran menyesuaikan konten
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.grey.shade300,
                        child: const Icon(
                          Icons.person,
                          size: 60,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Nama Pengguna',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'email@example.com',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Detail Profil:',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '• Hobi: Membaca Buku\n'
                              '• Keterampilan: Menulis\n'
                              '• Kota Asal: Jakarta\n'
                              '• Pekerjaan: Pengembang Aplikasi',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              // Padding agar tidak terlalu rapat dengan profil
              const SizedBox(height: 20),

              // Waitlist Resep yang ingin dicoba
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9, // Lebar 90% dari layar
                  padding: const EdgeInsets.all(16.0), // Padding internal
                  decoration: BoxDecoration(
                    color: Colors.white, // Warna background putih
                    borderRadius: BorderRadius.circular(12.0), // Border melengkung
                    border: Border.all(
                      color: Colors.orange, // Warna border oranye
                      width: 2.0,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8.0,
                        offset: Offset(0, 4),
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Waitlist Resep:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        '• Pizza Margherita\n• Roti Jala\n• Sushi\n• Rendang Daging Sapi\n• Salad Caesar',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
