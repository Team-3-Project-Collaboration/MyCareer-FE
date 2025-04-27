import 'package:flutter/material.dart';
import 'course_material_content_page.dart';
import 'study_case_page.dart' as scp;

class CourseDetailPage extends StatefulWidget {
  final Map<String, dynamic> item;
  final bool inMyClass;
  const CourseDetailPage({super.key, required this.item, this.inMyClass = false});

  @override
  State<CourseDetailPage> createState() => _CourseDetailPageState();
}

class _CourseDetailPageState extends State<CourseDetailPage> {
  int selectedTab = 0; // 0: Materi, 1: Sertifikat
  late List<Map<String, dynamic>> sections;

  @override
  void initState() {
    super.initState();
    sections = [
      {
        'title': 'Introduction',
        'progress': 0.6,
        'image': 'lib/src/core/presentation/skillquest/assets/studycase_1.png',
        'completed': false,
        'isStudyCase': false,
      },
      {
        'title': 'Studi Kasus I',
        'progress': 0.0,
        'image': 'lib/src/core/presentation/skillquest/assets/book.png',
        'completed': false,
        'isStudyCase': true,
      },
      {
        'title': 'Marketing Mix',
        'progress': 0.4,
        'image': 'lib/src/core/presentation/skillquest/assets/marketing.png',
        'completed': false,
        'isStudyCase': false,
      },
      {
        'title': 'Studi Kasus II',
        'progress': 0.0,
        'image': 'lib/src/core/presentation/skillquest/assets/book.png',
        'completed': false,
        'isStudyCase': true,
      },
    ];
  }

  double get currentProgress {
    int completedCount = 0;
    for (var section in sections) {
      if (section['isStudyCase'] == true && section['completed'] == true) {
        completedCount++;
      }
      if (section['isStudyCase'] == false && (section['progress'] as double) >= 1.0) {
        completedCount++;
      }
    }
    return completedCount / sections.length;
  }

  @override
  Widget build(BuildContext context) {
    // Dummy progress and sections with asset images
    final certificateProgress = 0.7;
    final certificateImage = 'lib/src/core/presentation/skillquest/assets/certificate.png';

    return Scaffold(
      backgroundColor: Color(0xFF3355FF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(color: Colors.white),
        title: Text('Course', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: widget.inMyClass ? _buildTabbedLayout(sections, certificateProgress, certificateImage) : _buildPreviewLayout(),
    );
  }

  Widget _buildPreviewLayout() {
    return Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 32),
              // Card
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                      widget.item['title'] ?? '',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Icon(Icons.person_outline, color: Colors.grey),
                          SizedBox(width: 8),
                          Text('Current Progress'),
                          Spacer(),
                          Text('0%', style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      SizedBox(height: 8),
                      LinearProgressIndicator(
                      value: currentProgress,
                        backgroundColor: Colors.grey[200],
                        color: Color(0xFF743DF5),
                        minHeight: 8,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24),
            // Tabs (disabled look)
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text('Materi', style: TextStyle(
                          color: Color(0xFF743DF5), fontWeight: FontWeight.bold
                        )),
                        Container(
                          height: 3,
                          width: 40,
                          color: Color(0xFF743DF5),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text('Sertifikat', style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.normal
                        )),
                        Container(
                          height: 3,
                          width: 40,
                          color: Colors.transparent,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
            // Sections preview (first 3)
              Expanded(
                child: ListView.builder(
                itemCount: 4,
                  itemBuilder: (context, index) {
                  final section = [
                    {
        'title': 'Introduction',
        'progress': 0.6,
        'image': 'lib/src/core/presentation/skillquest/assets/studycase_1.png',
        'completed': false,
        'isStudyCase': false,
      },
      {
        'title': 'Studi Kasus I',
        'progress': 0.0,
        'image': 'lib/src/core/presentation/skillquest/assets/book.png',
        'completed': false,
        'isStudyCase': true,
      },
      {
        'title': 'Marketing Mix',
        'progress': 0.4,
        'image': 'lib/src/core/presentation/skillquest/assets/marketing.png',
        'completed': false,
        'isStudyCase': false,
      },
      {
        'title': 'Studi Kasus II',
        'progress': 0.0,
        'image': 'lib/src/core/presentation/skillquest/assets/book.png',
        'completed': false,
        'isStudyCase': true,
      },
                  ][index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                      child: Container(
                        decoration: BoxDecoration(
                        color: section['progress'] == 0.0 ? Color(0xFFF5F8FF) : Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              section['image'] as String,
                                width: 56,
                                height: 56,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                Text(section['title'] as String, style: TextStyle(fontWeight: FontWeight.bold)),
                                  SizedBox(height: 8),
                                  LinearProgressIndicator(
                                  value: section['progress'] as double,
                                    backgroundColor: Colors.grey[200],
                                    color: Color(0xFF743DF5),
                                    minHeight: 6,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 16),
                          Text('${((section['progress'] as double) * 100).toInt()}%'),
                            SizedBox(width: 16),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 80),
            ],
          ),
          // Bottom bar
          Positioned(
            left: 0, right: 0, bottom: 0,
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                    '1 kursus dipilih\nRp ${widget.item['price'] ?? ''}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF3355FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    ),
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    child: Text('Lanjutkan'),
                  ),
                ],
              ),
            ),
          ),
        ],
    );
  }

  Widget _buildTabbedLayout(List<Map<String, dynamic>> sections, double certificateProgress, String certificateImage) {
    return Stack(
      children: [
        Column(
          children: [
            SizedBox(height: 32),
            // Card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.item['title'] ?? '',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Icon(Icons.person_outline, color: Colors.grey),
                        SizedBox(width: 8),
                        Text('Current Progress'),
                        Spacer(),
                        Text('0%', style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(height: 8),
                    LinearProgressIndicator(
                      value: currentProgress,
                      backgroundColor: Colors.grey[200],
                      color: Color(0xFF743DF5),
                      minHeight: 8,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),
            // Tabs
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => selectedTab = 0),
                    child: Column(
                      children: [
                        Text('Materi', style: TextStyle(
                          color: selectedTab == 0 ? Color(0xFF743DF5) : Colors.grey,
                          fontWeight: selectedTab == 0 ? FontWeight.bold : FontWeight.normal,
                        )),
                        Container(
                          height: 3,
                          width: 40,
                          color: selectedTab == 0 ? Color(0xFF743DF5) : Colors.transparent,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => selectedTab = 1),
                    child: Column(
                      children: [
                        Text('Sertifikat', style: TextStyle(
                          color: selectedTab == 1 ? Color(0xFF743DF5) : Colors.grey,
                          fontWeight: selectedTab == 1 ? FontWeight.bold : FontWeight.normal,
                        )),
                        Container(
                          height: 3,
                          width: 40,
                          color: selectedTab == 1 ? Color(0xFF743DF5) : Colors.transparent,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            if (selectedTab == 0)
              // Materi Tab
              Expanded(
                child: ListView.builder(
                  itemCount: sections.length,
                  itemBuilder: (context, index) {
                    final section = sections[index];
                    final isIntroduction = section['title'] == 'Introduction';
                    final isStudyCase = section['title'].toString().toLowerCase().contains('studi kasus');
                    final isMarketingMix = section['title'] == 'Marketing Mix';

                    Widget content = Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                      child: Container(
                        decoration: BoxDecoration(
                          color: section['progress'] == 0.0 ? Color(0xFFF5F8FF) : Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                section['image'] as String,
                                width: 56,
                                height: 56,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(section['title'] as String, style: TextStyle(fontWeight: FontWeight.bold)),
                                  SizedBox(height: 8),
                                  LinearProgressIndicator(
                                    value: section['progress'] as double,
                                    backgroundColor: Colors.grey[200],
                                    color: Color(0xFF743DF5),
                                    minHeight: 6,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 16),
                            Text('${((section['progress'] as double) * 100).toInt()}%'),
                            SizedBox(width: 16),
                          ],
                        ),
                      ),
                    );

                    if (isIntroduction) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_) => CourseMaterialContentPage()));
                        },
                        child: content,
                      );
                    } else if (isStudyCase) {
                      return InkWell(
                        onTap: () async {
                          final result = await Navigator.push(context, MaterialPageRoute(builder: (_) => scp.StudyCasePage()));
                          if (result == true) {
                            setState(() {
                              sections[index]['completed'] = true;
                            });
                          }
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                          decoration: BoxDecoration(
                            color: section['completed'] ? Colors.white : Color(0xFFF5F8FF),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: section['completed'] ? Colors.green : Color(0xFF3355FF),
                              width: 1.5,
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.assignment, color: section['completed'] ? Colors.green : Color(0xFF3355FF)),
                              SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  section['title'],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              if (section['completed'])
                                Icon(Icons.check_circle, color: Colors.green),
                            ],
                          ),
                        ),
                      );
                    } else if (isMarketingMix) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_) => CourseMaterialContentPage()));
                        },
                        child: content,
                      );
                    } else {
                      return content;
                    }
                  },
                ),
              )
            else
              // Sertifikat Tab
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              certificateImage,
                              width: double.infinity,
                              height: 180,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 16),
                          LinearProgressIndicator(
                            value: certificateProgress,
                            backgroundColor: Colors.grey[200],
                            color: Color(0xFF743DF5),
                            minHeight: 6,
                          ),
                          SizedBox(height: 8),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text('${(certificateProgress * 100).toInt()}%'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            SizedBox(height: 80),
          ],
        ),
        // Bottom bar
        if (selectedTab == 1)
          Positioned(
            left: 0, right: 0, bottom: 0,
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      '',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    ),
                    onPressed: null,
                    icon: Icon(Icons.download, color: Colors.white),
                    label: Text('Download Sertifikat', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

