import 'package:flutter/material.dart';
import 'avatar_picker.dart';
import 'dropdown_field.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../pages/education_form_page.dart';

class IndonesiaRegionService {
  static const _baseUrl = 'https://www.emsifa.com/api-wilayah-indonesia/api';

  Future<List<dynamic>> getProvinces() async {
    final response = await http.get(Uri.parse('$_baseUrl/provinces.json'));
    return jsonDecode(response.body);
  }

  Future<List<dynamic>> getRegencies(String provinceId) async {
    final response = await http.get(Uri.parse('$_baseUrl/regencies/$provinceId.json'));
    return jsonDecode(response.body);
  }

  Future<List<dynamic>> getDistricts(String regencyId) async {
    final response = await http.get(Uri.parse('$_baseUrl/districts/$regencyId.json'));
    return jsonDecode(response.body);
  }
}

class PersonalDataForm extends StatefulWidget {
  const PersonalDataForm({Key? key}) : super(key: key);

  @override
  State<PersonalDataForm> createState() => _PersonalDataFormState();
}

class _PersonalDataFormState extends State<PersonalDataForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  String? _selectedGender;
  String? _selectedProvinceId;
  String? _selectedRegencyId;
  String? _selectedDistrictId;

  List<dynamic> _provinces = [];
  List<dynamic> _regencies = [];
  List<dynamic> _districts = [];

  final List<String> _genders = ['Laki-laki', 'Perempuan'];
  final IndonesiaRegionService _regionService = IndonesiaRegionService();

  @override
  void initState() {
    super.initState();
    _loadProvinces();
  }

  void _loadProvinces() async {
    final data = await _regionService.getProvinces();
    setState(() {
      _provinces = data;
    });
  }

  void _onProvinceChanged(String? provinceId) async {
    setState(() {
      _selectedProvinceId = provinceId;
      _regencies = [];
      _districts = [];
      _selectedRegencyId = null;
      _selectedDistrictId = null;
    });
    if (provinceId != null) {
      final data = await _regionService.getRegencies(provinceId);
      setState(() {
        _regencies = data;
      });
    }
  }

  void _onRegencyChanged(String? regencyId) async {
    setState(() {
      _selectedRegencyId = regencyId;
      _districts = [];
      _selectedDistrictId = null;
    });
    if (regencyId != null) {
      final data = await _regionService.getDistricts(regencyId);
      setState(() {
        _districts = data;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 8),
            const AvatarPicker(),
            const SizedBox(height: 24),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Tanggal Lahir*', style: TextStyle(fontWeight: FontWeight.w600)),
            ),
            TextFormField(
              controller: _dobController,
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
                  _dobController.text = "${picked.month}/${picked.day}/${picked.year}";
                }
              },
              validator: (value) => value == null || value.isEmpty ? 'Wajib diisi' : null,
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Jenis Kelamin*', style: TextStyle(fontWeight: FontWeight.w600)),
            ),
            DropdownField(
              value: _selectedGender,
              hint: 'Pilih jenis kelamin',
              items: _genders,
              onChanged: (val) => setState(() => _selectedGender = val),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Email*', style: TextStyle(fontWeight: FontWeight.w600)),
            ),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'Masukkan email',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
              validator: (value) => value == null || value.isEmpty ? 'Wajib diisi' : null,
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Lokasi Saat Ini*', style: TextStyle(fontWeight: FontWeight.w600)),
            ),
            DropdownButtonFormField<String>(
              value: _selectedProvinceId,
              hint: const Text('Pilih Provinsi'),
              items: _provinces.map<DropdownMenuItem<String>>((e) => DropdownMenuItem<String>(
                value: e['id'],
                child: Text(e['name']),
              )).toList(),
              onChanged: _onProvinceChanged,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
              validator: (val) => val == null || val.isEmpty ? 'Wajib diisi' : null,
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: _selectedRegencyId,
              hint: const Text('Pilih Kabupaten/Kota'),
              items: _regencies.map<DropdownMenuItem<String>>((e) => DropdownMenuItem<String>(
                value: e['id'],
                child: Text(e['name']),
              )).toList(),
              onChanged: _onRegencyChanged,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
              validator: (val) => val == null || val.isEmpty ? 'Wajib diisi' : null,
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: _selectedDistrictId,
              hint: const Text('Pilih Kecamatan'),
              items: _districts.map<DropdownMenuItem<String>>((e) => DropdownMenuItem<String>(
                value: e['id'],
                child: Text(e['name']),
              )).toList(),
              onChanged: (val) => setState(() => _selectedDistrictId = val),
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
              validator: (val) => val == null || val.isEmpty ? 'Wajib diisi' : null,
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
                        builder: (context) => const EducationFormPage(),
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
    );
  }
} 