import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kas_personal/models/kas.dart';

class CardKasInfoAll extends StatelessWidget {
  const CardKasInfoAll({super.key, required this.items});

  final List<Kas> items;

  double countMasuk() {
    final list = items.where((e) => e.jenis == JenisKas.kasMasuk);
    final hasil = list.isNotEmpty
      ? list.map((e) => e.nominal).reduce((value, element) => value + element)
      :0.0;
      return hasil;
  }

   double countKeluar() {
    final list = items.where((e) => e.jenis == JenisKas.kasKeluar);
    final hasil = list.isNotEmpty
      ? list.map((e) => e.nominal).reduce((value, element) => value + element)
      :0.0;
      return hasil;
  }

  double countSisa() {
    return countMasuk() - countKeluar();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                const Text(
                  'Pemasukan',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                  Text(
                    'IDR ${countMasuk().round()}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 19,
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
                color: Colors.brown,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  const Text(
                    'Pengeluaran',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'IDR ${countKeluar().round()}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 19,
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
                color: Colors.red,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  const Text(
                    'Sisa',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'IDR ${countSisa().round()}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
               ],
              ),
            ),
          ),
        ],
      );
    }
  }


  
