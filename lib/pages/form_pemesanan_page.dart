import 'package:flutter/material.dart';

class FormPemesananPage extends StatefulWidget {
  const FormPemesananPage({super.key});

  @override
  State<FormPemesananPage> createState() => _FormPemesananPageState();
}

class _FormPemesananPageState extends State<FormPemesananPage> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController addresController = TextEditingController();

  String metodePembayaran = 'Tunai';
  bool setuju = false;

  @override
  void dispose() {
    namaController.dispose();
    addresController.dispose();
    super.dispose();
  }

  void kirimPesanan() {
    if (namaController.text.trim().isEmpty ||
        addresController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Nama dan nomor alamat wajib diisi')),
      );
      return;
    }
    if (!setuju) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Silakan setujui pembelian terlebih dahulu')),
      );
      return;
    }
    FocusScope.of(context).unfocus();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Pesanan berhasil dikirim')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Pemesanan'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Data Pembeli',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: namaController,
            decoration: const InputDecoration(
              labelText: 'Nama Pembeli',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.person),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: addresController,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              labelText: 'Alamat',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.streetview),
            ),
          ),
          const SizedBox(height: 20),
          const Text('Metode Pembayaran', style: TextStyle(fontWeight: FontWeight.bold)),
          RadioListTile<String>(
            title: const Text('Tunai'),
            value: 'Tunai',
            groupValue: metodePembayaran,
            onChanged: (value) => setState(() => metodePembayaran = value!),
          ),
          RadioListTile<String>(
            title: const Text('Transfer'),
            value: 'Transfer',
            groupValue: metodePembayaran,
            onChanged: (value) => setState(() => metodePembayaran = value!),
          ),
          CheckboxListTile(
            value: setuju,
            controlAffinity: ListTileControlAffinity.leading,
            title: const Text('Saya menyetujui pembelian ini'),
            onChanged: (value) => setState(() => setuju = value ?? false),
          ),
          const SizedBox(height: 12),
          FilledButton.icon(
            onPressed: kirimPesanan,
            icon: const Icon(Icons.send),
            label: const Text('Kirim Pesanan'),
          ),
          OutlinedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Kembali'),
          ),
          const SizedBox(height: 12),
          const Text(
            'Pesanan pada latihan ini hanya disimulasikan dan belum disimpan ke server.',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
