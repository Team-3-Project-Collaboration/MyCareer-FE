import 'package:get/get.dart';
import 'package:mycareer/core/utils/route_utils.dart';

class OnboardingController extends GetxController {
  var currentPage = 0.obs;

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

  Map<String, dynamic> get currentPageData =>
      _onboardingData[currentPage.value];

  void nextPage() {
    if (currentPage.value == _onboardingData.length - 1) {
      // If it's the last page, navigate to SignIn
      Get.toNamed(NavigationRoutes.signIn);
    } else {
      currentPage.value = (currentPage.value + 1) % _onboardingData.length;
    }
  }

  void previousPage() {
    if (currentPage.value > 0) {
      currentPage.value--;
    } else {
      currentPage.value = _onboardingData.length - 1;
    }
  }
}
