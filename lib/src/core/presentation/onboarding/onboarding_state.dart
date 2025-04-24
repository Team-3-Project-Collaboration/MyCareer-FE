// onboarding_state.dart
import 'package:flutter/material.dart';

class OnboardingState with ChangeNotifier {
  int _currentPage = 0;

  final List<Map<String, dynamic>> _onboardingData = [
    {
      'image': "assets/svgs/onboarding_page1.svg",
      'textTitle': "Lamar Pekerjaan Favorit Anda!",
      'textBody':
          "Temukan Pekerjaan impian Anda di antara \n lebih dari 1 juta tawaran pekerjaan dari klien di \n seluruh dunia.",
      'paginationDots': "assets/svgs/pagination_dots1.svg",
    },
    {
      'image': "assets/svgs/onboarding_page2.svg",
      'textTitle': "Cari Pekerjaan Impian Anda!",
      'textBody':
          "Dengan aplikasi MyCareer Anda bisa mendapatkan pekerjaan sesuai dengan keahlian Anda",
      'paginationDots': "assets/svgs/pagination_dots2.svg",
    },
    {
      'image': "assets/svgs/onboarding_page3.svg",
      'textTitle': "Tentukan Pilihan Karir Anda!",
      'textBody':
          "Anda dapat memilih pekerjaan sesuai dengan kriteria Anda, mulai dari jenis pekerjaan, lokasi, gaji, jadwal",
      'paginationDots': "assets/svgs/pagination_dots3.svg",
    },
  ];

  Map<String, dynamic> get currentPageData => _onboardingData[_currentPage];

  void nextPage() {
    _currentPage = (_currentPage + 1) % _onboardingData.length;
    notifyListeners();
  }

  void previousPage() {
    if (_currentPage > 0) {
      _currentPage--;
    } else {
      _currentPage = _onboardingData.length - 1;
    }
    notifyListeners();
  }

  int get currentPage => _currentPage;
}
