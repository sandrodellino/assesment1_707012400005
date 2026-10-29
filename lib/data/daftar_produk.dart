import '../models/produk.dart';

const List<Produk> daftarProduk = [
  Produk(nama: 'Pupuk kompos Organik ', harga: 15000),
  Produk(nama: 'Pot Tanaman Daur Ulang', harga: 25000),
  Produk(nama: 'Tas Kemasan Daur ulang', harga: 15000),
];

String rupiah(int nominal) {
  return 'Rp${nominal.toString().replaceAllMapped(
    RegExp(r'\B(?=(\d{3})+(?!\d))'),
    (match) => '.',
  )}';
}
