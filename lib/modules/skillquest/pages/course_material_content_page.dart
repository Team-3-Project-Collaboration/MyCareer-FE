import 'package:flutter/material.dart';

class CourseMaterialContentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Course Material Content')),
      body: Center(child: Text('This is the Course Material Content page')),
    );
  }
}

class StudyCasePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Study Case')),
      body: Center(child: Text('This is the Study Case page')),
    );
  }
}

