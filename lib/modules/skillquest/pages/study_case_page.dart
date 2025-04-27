import 'package:flutter/material.dart';

class StudyCasePage extends StatefulWidget {
  const StudyCasePage({Key? key}) : super(key: key);

  @override
  State<StudyCasePage> createState() => _StudyCasePageState();
}

class _StudyCasePageState extends State<StudyCasePage> {
  bool submitted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SkillQuest'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: BackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Studi Kasus I (Perkenalan dan Function)',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Text(
                'Sebuah startup bernama Fresh+ ingin meluncurkan produk minuman teh herbal dingin ke pasar Indonesia. Produk ini memiliki rasa unik, mengandung kemasan ramah lingkungan, dan diklaim sangat bermanfaat untuk menjaga tubuh pada kesehatan. Namun, mereka menghadapi tantangan karena merek mereka belum dikenal luas dan terdapat kompetitor besar di pasar minuman teh.\n\nLakukan analisis SWOT sederhana untuk Fresh+ berdasarkan informasi di atas. Sebutkan masing-masing satu poin untuk Strength, Weakness, Opportunity, dan Threat!\n\nBerdasarkan konsep Marketing Mix, strategi apa yang sebaiknya digunakan oleh Fresh+ untuk memasarkan produk ini secara efektif?',
                style: TextStyle(fontSize: 14),
              ),
            ),
            SizedBox(height: 24),
            Text('Pengumpulan', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: Column(
                children: [
                  Icon(Icons.upload_file, color: Colors.grey, size: 32),
                  SizedBox(height: 8),
                  Text('Click to upload or drag and drop', style: TextStyle(color: Colors.blue)),
                  SizedBox(height: 4),
                  Text('.pdf, .doc, .docx atau .word (maks. 2MB)', style: TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
            ),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF3355FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                minimumSize: Size(double.infinity, 48),
              ),
              onPressed: () {
                setState(() {
                  submitted = true;
                });
                Future.delayed(Duration(milliseconds: 500), () {
                  Navigator.pop(context, true); // Return true to indicate completion
                });
              },
              child: Text('Lanjutkan'),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
      backgroundColor: Color(0xFFF5F8FF),
    );
  }
}
