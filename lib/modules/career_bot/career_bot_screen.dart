import 'package:flutter/material.dart';

class CareerBotScreen extends StatelessWidget {
  const CareerBotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CareerBot AI'),
        centerTitle: false,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF3B56F7),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: const Text(
                      'Jangan ragu, tanya semua kepada Saya!\nKonsultasi cepat, jawaban tepat',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Image.asset(
                    'assets/svgs/robot.png', // pastikan kamu punya asset ini
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Pertanyaan Umum',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Lainnya',
                  style: TextStyle(fontSize: 14, color: Colors.blue),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _questionItem('Bagaimana cara mencari pekerjaan di luar negeri?'),
            _questionItem(
              'Apa saja keterampilan yang dicari oleh perusahaan di era digital saat ini?',
            ),
            _questionItem(
              'Apa yang harus saya persiapkan sebelum wawancara kerja?',
            ),
            const SizedBox(height: 24),
            const Text(
              'Riwayat Pertanyaan',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _questionItem('Bagaimana cara mencari pekerjaan di luar negeri?'),
            _questionItem(
              'Apa saja keterampilan yang dicari oleh perusahaan di era digital saat ini?',
            ),
          ],
        ),
      ),
    );
  }

  Widget _questionItem(String question) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F7FA),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.question_answer_outlined, color: Colors.blue),
          const SizedBox(width: 12),
          Expanded(child: Text(question, style: const TextStyle(fontSize: 14))),
        ],
      ),
    );
  }
}
