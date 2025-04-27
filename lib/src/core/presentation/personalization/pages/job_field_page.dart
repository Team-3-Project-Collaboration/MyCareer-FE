import 'package:flutter/material.dart';
import '../widgets/dropdown_field.dart';
import 'completion_page.dart';

class JobFieldPage extends StatefulWidget {
  const JobFieldPage({Key? key}) : super(key: key);

  @override
  State<JobFieldPage> createState() => _JobFieldPageState();
}

class _JobFieldPageState extends State<JobFieldPage> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedJobField;
  String? _selectedRole;

  final List<String> _jobFields = [
    'Teknologi Informasi',
    'Keuangan',
    'Pendidikan',
    'Kesehatan',
    'Lainnya',
  ];
  final List<String> _roles = [
    'Software Engineer',
    'Data Analyst',
    'Guru',
    'Dokter',
    'Lainnya',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Bidang Pekerjaan'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(bottom: 16),
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
                        'Beri tahu pekerjaan yang kamu inginkan agar kami bisa rekomendasikan lowongan yang sesuai',
                        style: TextStyle(fontSize: 13, color: Colors.black87),
                      ),
                    ),
                  ],
                ),
              ),
              Text('Bidang Pekerjaan*', style: TextStyle(fontWeight: FontWeight.w600)),
              DropdownField(
                value: _selectedJobField,
                hint: 'Pilih bidang pekerjaan',
                items: _jobFields,
                onChanged: (val) => setState(() => _selectedJobField = val),
              ),
              const SizedBox(height: 16),
              Text('Role Pekerjaan*', style: TextStyle(fontWeight: FontWeight.w600)),
              DropdownField(
                value: _selectedRole,
                hint: 'Masukkan nama instansi',
                items: _roles,
                onChanged: (val) => setState(() => _selectedRole = val),
              ),
              const SizedBox(height: 32),
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
                    if (_formKey.currentState!.validate()) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const CompletionPage(),
                        ),
                      );
                    }
                  },
                  child: const Text('Selanjutnya', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 