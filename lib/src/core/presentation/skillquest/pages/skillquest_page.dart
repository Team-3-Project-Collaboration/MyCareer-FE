import 'package:flutter/material.dart';
import '../widgets/skillquest_widget.dart';
import 'course_detail_page.dart';

// Dummy data for bootcamps, courses, and myclass
final List<Map<String, dynamic>> allBootcamps = [
  {
    'title': 'Digital Marketing: Fullstack Intensive Bootcamp',
    'author': 'Sarah William',
    'level': 'IT',
    'price': '850.000',
    'color': Colors.red[100],
    'icon': Icons.campaign,
    'type': 'Bootcamp',
  },
  {
    'title': 'Human Capital Staff: Intensive Training',
    'author': 'Sarah William',
    'level': 'HRD',
    'price': '850.000',
    'color': Colors.red[100],
    'icon': Icons.campaign,
    'type': 'Bootcamp',
  },
  {
    'title': 'Data Analysis: Fullstack Intensive Bootcamp',
    'author': 'Sarah William',
    'level': 'Finansial',
    'price': '850.000',
    'color': Colors.red[100],
    'icon': Icons.campaign,
    'type': 'Bootcamp',
  },
];

final List<Map<String, dynamic>> allCourses = [
  {
    'title': 'Marketing Introduction',
    'author': 'Sarah William',
    'level': 'Finansial',
    'price': '850.000',
    'color': Colors.red[100],
    'icon': Icons.campaign,
    'type': 'Course',
  },
  {
    'title': 'Human Resources Introduction',
    'author': 'Sarah William',
    'level': 'HRD',
    'price': '850.000',
    'color': Colors.blue[100],
    'icon': Icons.people,
    'type': 'Course',
  },
  {
    'title': 'Data Analysis Fundamental',
    'author': 'Sarah William',
    'level': 'Finansial',
    'price': '850.000',
    'color': Colors.red[100],
    'icon': Icons.analytics,
    'type': 'Course',
  },
];

class SkillQuestPage extends StatefulWidget {
  const SkillQuestPage({Key? key}) : super(key: key);

  @override
  State<SkillQuestPage> createState() => _SkillQuestPageState();
}

class _SkillQuestPageState extends State<SkillQuestPage> {
  final List<String> filters = [
    'All', 'IT', 'HRD', 'Finansial', 'Programer', 'Swift', 'Java', 'React'
  ];
  final List<String> tabs = ['Bootcamp', 'Course', 'MyClass'];

  String selectedFilter = 'All';
  int selectedTab = 0;
  String searchQuery = '';
  final List<Map<String, dynamic>> myClass = [];

  @override
  Widget build(BuildContext context) {
    // Filtering logic
    List<Map<String, dynamic>> filteredBootcamps = allBootcamps.where((bootcamp) {
      final matchesFilter = selectedFilter == 'All' ||
          (bootcamp['level'] as String).toLowerCase() == selectedFilter.toLowerCase() ||
          (bootcamp['title'] as String).toLowerCase().contains(selectedFilter.toLowerCase()) ||
          (bootcamp['author'] as String).toLowerCase().contains(selectedFilter.toLowerCase());
      final matchesSearch = searchQuery.isEmpty ||
          (bootcamp['title'] as String).toLowerCase().contains(searchQuery.toLowerCase()) ||
          (bootcamp['author'] as String).toLowerCase().contains(searchQuery.toLowerCase());
      return matchesFilter && matchesSearch;
    }).toList();

    List<Map<String, dynamic>> filteredCourses = allCourses.where((course) {
      final matchesFilter = selectedFilter == 'All' ||
          (course['level'] as String).toLowerCase() == selectedFilter.toLowerCase() ||
          (course['title'] as String).toLowerCase().contains(selectedFilter.toLowerCase()) ||
          (course['author'] as String).toLowerCase().contains(selectedFilter.toLowerCase());
      final matchesSearch = searchQuery.isEmpty ||
          (course['title'] as String).toLowerCase().contains(searchQuery.toLowerCase()) ||
          (course['author'] as String).toLowerCase().contains(searchQuery.toLowerCase());
      return matchesFilter && matchesSearch;
    }).toList();

    List<Map<String, dynamic>> filteredMyClass = myClass.where((item) {
      final matchesFilter = selectedFilter == 'All' ||
          (item['level'] as String).toLowerCase() == selectedFilter.toLowerCase() ||
          (item['title'] as String).toLowerCase().contains(selectedFilter.toLowerCase()) ||
          (item['author'] as String).toLowerCase().contains(selectedFilter.toLowerCase());
      final matchesSearch = searchQuery.isEmpty ||
          (item['title'] as String).toLowerCase().contains(searchQuery.toLowerCase()) ||
          (item['author'] as String).toLowerCase().contains(searchQuery.toLowerCase());
      return matchesFilter && matchesSearch;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('SkillQuest'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).maybePop();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.timer_outlined, color: Colors.black),
            onPressed: () {
              // TODO: Implement timer/history action
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Asah keahlian',
                prefixIcon: Icon(Icons.search, color: Color(0xFF3355FF)),
                filled: true,
                fillColor: Color(0xFFF5F8FF),
                contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide.none,
                ),
              ),
              style: TextStyle(fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Wrap(
              spacing: 12,
              runSpacing: 12,
              children: filters.map((filter) {
                final isSelected = selectedFilter == filter;
                return ChoiceChip(
                  label: Text(
                    filter,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Color(0xFF3355FF),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  selected: isSelected,
                  selectedColor: Color(0xFF3355FF),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                    side: BorderSide(color: Color(0xFF3355FF)),
                  ),
                  onSelected: (_) {
                    setState(() {
                      selectedFilter = filter;
                    });
                  },
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24, left: 16, right: 16, bottom: 0),
            child: Row(
              children: List.generate(tabs.length, (i) {
                final isSelected = selectedTab == i;
                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTab = i;
                      });
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          tabs[i],
                          style: TextStyle(
                            color: isSelected ? Color(0xFF743DF5) : Color(0xFFBCBCBC),
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 4),
                        Container(
                          height: 3,
                          width: 40,
                          decoration: BoxDecoration(
                            color: isSelected ? Color(0xFF743DF5) : Colors.transparent,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
          if (selectedTab == 0) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Text(
                'Rekomendasi Bootcamp',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            Expanded(
              child: filteredBootcamps.isEmpty
                  ? Center(child: Text('No bootcamps found.'))
                  : ListView.builder(
                      itemCount: filteredBootcamps.length,
                      itemBuilder: (context, index) {
                        final item = filteredBootcamps[index];
                        return SkillQuestWidget(
                          quest: item,
                          onTap: () async {
                            final added = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => CourseDetailPage(item: item),
                              ),
                            );
                            if (added == true && !myClass.any((e) => e['title'] == item['title'])) {
                              setState(() {
                                myClass.add(item);
                                selectedTab = 2;
                              });
                            }
                          },
                        );
                      },
                    ),
            ),
          ] else if (selectedTab == 1) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Text(
                'Rekomendasi Course',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            Expanded(
              child: filteredCourses.isEmpty
                  ? Center(child: Text('No courses found.'))
                  : ListView.builder(
                      itemCount: filteredCourses.length,
                      itemBuilder: (context, index) {
                        final item = filteredCourses[index];
                        return SkillQuestWidget(
                          quest: item,
                          onTap: () async {
                            final added = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => CourseDetailPage(item: item),
                              ),
                            );
                            if (added == true && !myClass.any((e) => e['title'] == item['title'])) {
                              setState(() {
                                myClass.add(item);
                                selectedTab = 2;
                              });
                            }
                          },
                        );
                      },
                    ),
            ),
          ] else ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Text(
                'Kelas Saya',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            Expanded(
              child: filteredMyClass.isEmpty
                  ? Center(child: Text('No classes found.'))
                  : ListView.builder(
                      itemCount: filteredMyClass.length,
                      itemBuilder: (context, index) {
                        final item = filteredMyClass[index];
                        return SkillQuestWidget(
                          quest: item,
                          onTap: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => CourseDetailPage(item: item, inMyClass: true),
                              ),
                            );
                          },
                        );
                      },
                    ),
            ),
          ],
        ],
      ),
      backgroundColor: Color(0xFFF5F8FF),
    );
  }
}