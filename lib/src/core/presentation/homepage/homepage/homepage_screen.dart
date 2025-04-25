import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sample carousel data
    final List<Map<String, dynamic>> carouselItems = [
      {
        'title': 'Temukan pekerjaan baru yang lebih tepat!',
        'gradient': const [Color(0xFFF89047), Color(0xFFFFF07B)],
        'textColor': const Color(0xFFBA2A42),
        'imageUrl': 'https://picsum.photos/106/100?random=12',
      },
      {
        'title': 'Tingkatkan keterampilan untuk karir masa depan',
        'gradient': const [Color(0xFF3355FF), Color(0xFF88A1FF)],
        'textColor': Colors.white,
        'imageUrl': 'https://picsum.photos/106/100?random=13',
      },
      {
        'title': 'Konsultasi karir dengan ahli industri',
        'gradient': const [Color(0xFF25C06D), Color(0xFFA5F5C6)],
        'textColor': const Color(0xFF116438),
        'imageUrl': 'https://picsum.photos/106/100?random=14',
      },
      {
        'title': 'Dapatkan tawaran pekerjaan terbaik minggu ini',
        'gradient': const [Color(0xFFFF6B6B), Color(0xFFFFBBBB)],
        'textColor': Colors.white,
        'imageUrl': 'https://picsum.photos/106/100?random=15',
      },
    ];

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: const Color(0xFF3355FF),
        child: Stack(
          children: [
            // White bottom container
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: MediaQuery.of(context).size.height * 0.72,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
              ),
            ),

            // Status bar and app bar
            const SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8),
                    // Welcome message
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hai, Arkav!',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'Wujudkan pekerjaan impian Anda!',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        CircleAvatar(
                          backgroundColor: Color(0xFFF6F8FF),
                          radius: 24,
                          child: Icon(
                            Icons.notifications_outlined,
                            color: Color(0xFF3355FF),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Content
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 70),
                child: ListView(
                  children: [
                    // Search Bar
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        height: 44,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF6F8FF),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.search, color: Color(0xFFA3A3A3)),
                            const SizedBox(width: 10),
                            Text(
                              'Cari pekerjaan disini...',
                              style: TextStyle(
                                color: const Color(0xFFA3A3A3),
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Banner Slider (Carousel)
                    Container(
                      height: 180,
                      margin: const EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          Expanded(
                            child: CarouselSlider.builder(
                              itemCount: carouselItems.length,
                              itemBuilder: (context, index, realIndex) {
                                final item = carouselItems[index];
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 4,
                                  ),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width - 40,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: item['gradient'],
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          right: 20,
                                          bottom: 20,
                                          child: Container(
                                            width: 100,
                                            height: 100,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                  item['imageUrl'],
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 20,
                                          top: 20,
                                          width:
                                              MediaQuery.of(
                                                context,
                                              ).size.width *
                                              0.5,
                                          child: Text(
                                            item['title'],
                                            style: TextStyle(
                                              color: item['textColor'],
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              options: CarouselOptions(
                                height: 140,
                                viewportFraction: 0.92,
                                autoPlay: true,
                                autoPlayInterval: const Duration(seconds: 4),
                                autoPlayAnimationDuration: const Duration(
                                  milliseconds: 800,
                                ),
                                autoPlayCurve: Curves.fastOutSlowIn,
                                enlargeCenterPage: true,
                                onPageChanged: (index, reason) {
                                  // You can add state management here if needed
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:
                                carouselItems.asMap().entries.map((entry) {
                                  return Container(
                                    width: 8,
                                    height: 8,
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 3,
                                    ),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color:
                                          entry.key == 0
                                              ? const Color(0xFF3355FF)
                                              : const Color(0xFFD7D7D7),
                                    ),
                                  );
                                }).toList(),
                          ),
                        ],
                      ),
                    ),

                    // Feature Icons
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildFeatureItem(
                            'assets/svgs/homepage-skill-quest.svg',
                            'SkillQuest',
                          ),
                          _buildFeatureItem(
                            'assets/svgs/homepage-counsel.svg',
                            'Counsel',
                          ),
                          _buildFeatureItem(
                            'assets/svgs/homepage-job-pulse.svg',
                            'JobPulse',
                          ),
                          _buildFeatureItem(
                            'assets/svgs/homepage-job-trend.svg',
                            'JobTrend',
                          ),
                        ],
                      ),
                    ),

                    // Trending Jobs Section
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          // Title and "See more"
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Trending Job',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF112B2C),
                                ),
                              ),
                              Text(
                                'Lainnya',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF112B2C),
                                ),
                              ),
                            ],
                          ),

                          // Category filters
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Row(
                              children: [
                                _buildCategoryChip('All', isSelected: true),
                                _buildCategoryChip('IT'),
                                _buildCategoryChip('HRD'),
                                _buildCategoryChip('Manajemen'),
                                _buildCategoryChip('Bisnis'),
                              ],
                            ),
                          ),

                          // Job Cards
                          const SizedBox(height: 16),
                          _buildJobCard(
                            logoUrl: 'https://picsum.photos/48/48?random=1',
                            company: 'Gojek',
                            title: 'Software Engineer',
                            salary: 'IDR 10,000K',
                            location: 'Jakarta, Indonesia',
                          ),
                          const SizedBox(height: 16),
                          _buildJobCard(
                            logoUrl: 'https://picsum.photos/48/48?random=2',
                            company: 'Traveloka',
                            title: 'IT Project Manager',
                            salary: '\$40000',
                            location: 'Jakarta, Indonesia',
                          ),
                          const SizedBox(height: 16),
                          _buildJobCard(
                            logoUrl: 'https://picsum.photos/48/48?random=3',
                            company: 'Tokopedia',
                            title: 'UI/UX Designer',
                            salary: 'IDR 12,000K',
                            location: 'Jakarta, Indonesia',
                          ),
                        ],
                      ),
                    ),

                    // Extra space for bottom navigation bar
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureItem(String svgAssetPath, String label) {
    return Column(
      children: [
        Container(
          width: 68,
          height: 68,
          decoration: BoxDecoration(
            color: const Color(0xFFF6F8FF),
            borderRadius: BorderRadius.circular(99),
          ),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: SvgPicture.asset(
              svgAssetPath,
              colorFilter: const ColorFilter.mode(
                Color(0xFF3355FF),
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF262626),
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryChip(String label, {bool isSelected = false}) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF3355FF) : Colors.transparent,
        borderRadius: BorderRadius.circular(99),
        border: isSelected ? null : Border.all(color: const Color(0xFFC9C9C9)),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: isSelected ? Colors.white : const Color(0xFF262626),
        ),
      ),
    );
  }

  Widget _buildJobCard({
    required String logoUrl,
    required String company,
    required String title,
    required String salary,
    required String location,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              image: DecorationImage(
                image: NetworkImage(logoUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  company,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black.withOpacity(0.4),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(salary, style: const TextStyle(fontSize: 12)),
                    const SizedBox(width: 8),
                    Container(
                      width: 4,
                      height: 4,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFC9C9C9),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(location, style: const TextStyle(fontSize: 12)),
                  ],
                ),
              ],
            ),
          ),
          const Icon(Icons.bookmark_border, color: Color(0xFF3355FF)),
        ],
      ),
    );
  }
}
