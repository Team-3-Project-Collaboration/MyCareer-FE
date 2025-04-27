import 'package:flutter/material.dart';
import '../widgets/personal_data_form.dart';

class PersonalDataPage extends StatelessWidget {
  const PersonalDataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Data Diri'),
        centerTitle: true,
        elevation: 0,
      ),
      body: const PersonalDataForm(),
    );
  }
} 