import 'package:flutter/material.dart';
import 'package:kas_personal/models/kas.dart';

class CardKasInfo extends StatelessWidget {
  const CardKasInfo({super.key, required this.items, required this.jenis});

  final List<Kas>items;
  final JenisKas jenis;

  double countTotal() {
    if (jenis == JenisKas.kasMasuk) {
      var masukList = items.where((e) => e.jenis == JenisKas.kasMasuk);
      var masuk = masukList.isNotEmpty
      ? masukList
      .map((e) => e.nominal)
      .reduce((value,element) => value + element)
      :0.0;
      return masuk;
    } else if (jenis == JenisKas.kasKeluar) {
      var keluarList = items.where((e) => e.jenis == JenisKas.kasKeluar);
      var keluar = keluarList.isNotEmpty
      ? keluarList
      .map((e) => e.nominal)
      .reduce((value, element) => value + element)
      : 0.0;
      return keluar;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
     padding: const EdgeInsets.all(10),
     child: Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                const Text(
                  'Total Transaksi',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  items.length.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Builder(
                  builder: (context) {
                    var text = '';
                    if (jenis == JenisKas.kasMasuk) {
                      text = 'Total Pemasukan';
                    } else if (jenis == JenisKas.kasKeluar) {
                      text = 'Total Pengeluaran';
                    }
                    return Text(
                      text,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
                Text(
                'IDR ${countTotal().round()}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                ),
              ],
            ),
          ),
        ),
      ],
     ),
     );
  }
}