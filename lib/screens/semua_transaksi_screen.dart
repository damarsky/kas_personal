import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kas_personal/models/kas.dart';
import 'package:kas_personal/providers/kas_provider.dart';
import 'package:kas_personal/widgets/kas_item.dart';
import 'package:kas_personal/widgets/card_kas_info_all.dart'; // Pastikan Anda mengimpor widget ini

class SemuaTransaksiScreen extends StatelessWidget {
  const SemuaTransaksiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Semua Transaksi'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Consumer<KasProvider>(
              builder: (context, provider, child) {
                final items = provider.items;
                return CardKasInfoAll(items: items);
              },
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Consumer<KasProvider>(
                builder: (context, provider, child) {
                  final masukItems = provider.masukItems;
                  final keluarItems = provider.keluarItems;
                  final semuaTransaksi = [
                    ...masukItems.map((kas) => {'jenis': JenisKas.kasMasuk, 'kas': kas}),
                    ...keluarItems.map((kas) => {'jenis': JenisKas.kasKeluar, 'kas': kas}),
                  ];

                  return ListView.separated(
                    itemCount: semuaTransaksi.length,
                    separatorBuilder: (context, index) => Divider(
                      height: 0,
                      color: Colors.amber.shade200,
                    ),
                    itemBuilder: (context, index) {
                      final transaksi = semuaTransaksi[index];
                      final kas = transaksi['kas'] as Kas;
                      final jenis = transaksi['jenis'] as JenisKas;

                      return KasItem(
                        kas: kas,
                        onTap: () => _onItemTap(context, kas, jenis),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onItemTap(BuildContext context, Kas kas, JenisKas jenis) async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Hapus'),
        content: Text(
          'Anda yakin ingin menghapus transaksi ${jenis == JenisKas.kasMasuk ? 'kas masuk' : 'kas keluar'} ini?',
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Provider.of<KasProvider>(context, listen: false).hapus(kas);
              Navigator.of(context).pop();
            },
            child: const Text('Ya'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Tidak'),
          ),
        ],
      ),
    );
  }
}
