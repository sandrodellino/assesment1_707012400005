import 'package:flutter/material.dart';


import 'form_pemesanan_page.dart';
import 'katalog_page.dart';
import 'lokasi_page.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EcoMart'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.eco, size: 90, color: Colors.green),
              const SizedBox(height: 20),
              const Text(
                'Selamat Datang di EcoMart-Produk Daur Ulang ',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              const Text(
                'Komunitas Bank Sampah hijau di Kota Bandung.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const KatalogPage()),
                  ),
                  child: const Text('Lihat Katalog'),
                ),
              ),
              const SizedBox(height: 8),
              OutlinedButton.icon(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const FormPemesananPage()),
                ),
                icon: const Icon(Icons.receipt_long),
                label: const Text('Form Pemesanan'),
              ),
              OutlinedButton.icon(
                onPressed: () => Navigator.pop(
                  context,
                  MaterialPageRoute(builder: (_) => const LokasiPage()),
                ),
                icon: const Icon(Icons.location_on),
                label: const Text('Lokasi Komunitas'),
              ),
              const SizedBox(height: 12),
              //const RingkasanStateWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
