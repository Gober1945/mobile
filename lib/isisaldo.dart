import 'package:flutter/material.dart';
import 'profil_data.dart';
import 'isiberhasil.dart';

class IsiSaldoPage extends StatefulWidget {
  const IsiSaldoPage({super.key});

  @override
  State<IsiSaldoPage> createState() => _IsiSaldoPageState();
}

class _IsiSaldoPageState extends State<IsiSaldoPage> {
  final TextEditingController _controller =
      TextEditingController(text: '50000');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Isi Saldo', style: TextStyle(color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Nominal tambah saldo',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                prefixText: 'Rp ',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),
            ValueListenableBuilder<int>(
              valueListenable: saldoNotifier,
              builder: (context, saldo, _) {
                return Text(
                  'Saldo Tersedia : Rp $saldo',
                  style: const TextStyle(color: Colors.grey),
                );
              },
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  final nominal = int.tryParse(_controller.text) ?? 0;

                  // tambah saldo
                  saldoNotifier.value += nominal;

                  // pindah ke halaman isiberhasil.dart
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => IsiBerhasilPage(nominal: nominal),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Lanjut'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
