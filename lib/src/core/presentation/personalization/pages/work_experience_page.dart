import 'package:flutter/material.dart';
import 'work_experience_form_page.dart';
import 'job_field_page.dart';

class WorkExperiencePage extends StatefulWidget {
  const WorkExperiencePage({Key? key}) : super(key: key);

  @override
  State<WorkExperiencePage> createState() => _WorkExperiencePageState();
}

class _WorkExperiencePageState extends State<WorkExperiencePage> {
  final List<Map<String, String>> _experiences = [];

  Future<void> _addExperience() async {
    final result = await Navigator.of(context).push<Map<String, String>>(
      MaterialPageRoute(
        builder: (context) => const WorkExperienceFormPage(),
      ),
    );
    if (result != null) {
      setState(() {
        _experiences.add(result);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Pengalaman Kerja'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            const Text('Pengalaman Kerja', style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 12),
            if (_experiences.isNotEmpty) ...[
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _experiences.length,
                separatorBuilder: (_, __) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final exp = _experiences[index];
                  return Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF3F6FD),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0xFF2563EB), width: 1),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(exp['position'] ?? '', style: const TextStyle(fontWeight: FontWeight.bold)),
                        Text(exp['location'] ?? '', style: const TextStyle(color: Colors.black54)),
                        Text('${exp['startDate']} - ${exp['endDate']}', style: const TextStyle(color: Colors.black54)),
                        if ((exp['description'] ?? '').isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Text(exp['description'] ?? '', style: const TextStyle(fontSize: 13)),
                          ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 12),
            ],
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 18),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFF2563EB), width: 1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: TextButton.icon(
                  onPressed: _addExperience,
                  icon: const Icon(Icons.add, color: Color(0xFF2563EB)),
                  label: const Text('Tambah Pengalaman', style: TextStyle(color: Color(0xFF2563EB), fontWeight: FontWeight.w600)),
                ),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Menambah pengalaman kerja adalah nilai plus. Namun tenang, sebagian rekruter tetap mempertimbangkan pelamar yang belum memiliki pengalaman',
              style: TextStyle(fontSize: 13, color: Colors.black87),
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Color(0xFFEFF4FF),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: const [
                  Icon(Icons.info, color: Color(0xFF2563EB), size: 20),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Anda bisa melewati halaman ini jika belum memiliki pengalaman kerja',
                      style: TextStyle(fontSize: 13, color: Color(0xFF2563EB)),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2563EB),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                  elevation: 0,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const JobFieldPage(),
                    ),
                  );
                },
                child: const Text('Selanjutnya', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 