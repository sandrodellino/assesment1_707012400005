import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../cubits/belanja_cubit.dart';
import '../data/daftar_produk.dart';
import '../providers/favorit_provider.dart';
import 'form_pemesanan_page.dart';

class KatalogPage extends StatefulWidget {
  const KatalogPage({super.key});

  @override
  State<KatalogPage> createState() => _KatalogPageState();
}

class _KatalogPageState extends State<KatalogPage> {
  final List<int> jumlahProduk = [1, 1, 1];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Katalog Produk'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ...List.generate(daftarProduk.length, (index) {
            final produk = daftarProduk[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      produk.nama,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(rupiah(produk.harga)),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              if (jumlahProduk[index] > 1) {
                                jumlahProduk[index]--;
                              }
                            });
                          },
                          icon: const Icon(Icons.remove_circle_outline),
                        ),
                        Text('${jumlahProduk[index]}'),
                        IconButton(
                          onPressed: () {
                            setState(() => jumlahProduk[index]++);
                          },
                          icon: const Icon(Icons.add_circle_outline),
                        ),
                        const Spacer(),
                        IconButton(
                          tooltip: 'Tambah favorit',
                          onPressed: () {
                            context.read<FavoritProvider>().tambahFavorit();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Produk ditambahkan ke favorit'),
                              ),
                            );
                          },
                          icon: const Icon(Icons.favorite_border, color: Colors.red),
                        ),
                      ],
                    ),
                    Text(
                      'Subtotal: ${rupiah(produk.harga * jumlahProduk[index])}',
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: () {
                          context.read<BelanjaCubit>().tambahBarang();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Barang ditambahkan ke keranjang'),
                            ),
                          );
                        },
                        child: const Text('Tambah ke Keranjang'),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Consumer<FavoritProvider>(
                builder: (context, favorit, child) {
                  return Text('Total favorit: ${favorit.jumlahFavorit}');
                },
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: BlocBuilder<BelanjaCubit, int>(
                builder: (context, jumlah) => Row(
                  children: [
                    Expanded(child: Text('Keranjang: $jumlah barang')),
                    IconButton(
                      onPressed: () => context.read<BelanjaCubit>().kurangiBarang(),
                      icon: const Icon(Icons.remove),
                    ),
                    IconButton(
                      onPressed: () => context.read<BelanjaCubit>().tambahBarang(),
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          FilledButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const FormPemesananPage()),
            ),
            child: const Text('Lanjut ke Pemesanan'),
          ),
          OutlinedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Kembali'),
          ),
        ],
      ),
    );
  }
}
