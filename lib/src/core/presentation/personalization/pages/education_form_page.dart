import 'package:flutter/material.dart';
import '../widgets/dropdown_field.dart';
import 'work_experience_page.dart';

class EducationFormPage extends StatefulWidget {
  const EducationFormPage({Key? key}) : super(key: key);

  @override
  State<EducationFormPage> createState() => _EducationFormPageState();
}

class _EducationFormPageState extends State<EducationFormPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _schoolController = TextEditingController();
  final TextEditingController _majorController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  final TextEditingController _orgExpController = TextEditingController();

  String? _selectedEducationLevel;
  bool _isStillStudying = false;

  final List<String> _educationLevels = [
    'SMA/SMK',
    'D3',
    'S1',
    'S2',
    'S3',
    'Lainnya',
  ];

  @override
  void dispose() {
    _schoolController.dispose();
    _majorController.dispose();
    _startDateController.dispose();
    _endDateController.dispose();
    _orgExpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Pendidikan Terakhir'),
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
              const SizedBox(height: 8),
              Text('Jenjang Pendidikan*', style: TextStyle(fontWeight: FontWeight.w600)),
              DropdownField(
                value: _selectedEducationLevel,
                hint: 'Pilih jenjang pendidikan',
                items: _educationLevels,
                onChanged: (val) => setState(() => _selectedEducationLevel = val),
              ),
              const SizedBox(height: 16),
              Text('Sekolah/Perguruan Tinggi*', style: TextStyle(fontWeight: FontWeight.w600)),
              TextFormField(
                controller: _schoolController,
                decoration: InputDecoration(
                  hintText: 'Masukkan nama instansi',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
                validator: (value) => value == null || value.isEmpty ? 'Wajib diisi' : null,
              ),
              const SizedBox(height: 16),
              Text('Jurusan/Program Studi*', style: TextStyle(fontWeight: FontWeight.w600)),
              TextFormField(
                controller: _majorController,
                decoration: InputDecoration(
                  hintText: 'Pilih jenjang pendidikan',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
                validator: (value) => value == null || value.isEmpty ? 'Wajib diisi' : null,
              ),
              const SizedBox(height: 16),
              Text('Tanggal Mulai Pendidikan*', style: TextStyle(fontWeight: FontWeight.w600)),
              TextFormField(
                controller: _startDateController,
                readOnly: true,
                decoration: InputDecoration(
                  hintText: 'mm/dd/yy',
                  suffixIcon: Icon(Icons.calendar_today),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
                onTap: () async {
                  DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (picked != null) {
                    _startDateController.text = "${picked.month}/${picked.day}/${picked.year}";
                  }
                },
                validator: (value) => value == null || value.isEmpty ? 'Wajib diisi' : null,
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Checkbox(
                    value: _isStillStudying,
                    onChanged: (val) => setState(() => _isStillStudying = val ?? false),
                  ),
                  const Text('Saya masih bersekolah/berkuliah saat ini'),
                ],
              ),
              if (!_isStillStudying) ...[
                Text('Tanggal Selesai Pendidikan*', style: TextStyle(fontWeight: FontWeight.w600)),
                TextFormField(
                  controller: _endDateController,
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: 'mm/dd/yy',
                    suffixIcon: Icon(Icons.calendar_today),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                  onTap: () async {
                    DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (picked != null) {
                      _endDateController.text = "${picked.month}/${picked.day}/${picked.year}";
                    }
                  },
                  validator: (value) => value == null || value.isEmpty ? 'Wajib diisi' : null,
                ),
                const SizedBox(height: 16),
              ],
              Text('Pengalaman Organisasi', style: TextStyle(fontWeight: FontWeight.w600)),
              TextFormField(
                controller: _orgExpController,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: 'Masukkan pengalaman',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Jika ada, ceritakan pengalaman organisasi atau pengembangan diri Anda.',
                style: TextStyle(fontSize: 12, color: Colors.black54),
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
                          builder: (context) => const WorkExperiencePage(),
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