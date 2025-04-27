import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 200.h,
                decoration: BoxDecoration(
                  color: Color(0xFF3D5CFF),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.r),
                    bottomRight: Radius.circular(30.r),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 40.r,
                      backgroundColor: Colors.grey[300],
                      child: Icon(Icons.person, size: 40.r, color: Colors.grey),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'Arkavidia',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              _buildSectionTitle('Akun'),
              _buildMenuItem(Icons.description_outlined, 'My Resume'),
              _buildMenuItem(Icons.person_outline, 'Edit profile'),
              _buildMenuItem(Icons.security_outlined, 'Keamanan'),
              _buildMenuItem(Icons.notifications_outlined, 'Notifikasi'),
              _buildMenuItem(Icons.lock_outline, 'Privasi'),
              SizedBox(height: 20.h),
              _buildSectionTitle('Aksi'),
              _buildMenuItem(Icons.flag_outlined, 'Laporkan Masalah'),
              _buildMenuItem(Icons.group_add_outlined, 'Tambah akun'),
              _buildMenuItem(Icons.logout, 'Keluar', color: Colors.red),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Container(
      width: double.infinity,
      color: Color(0xFFF5F7FF),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Text(
        title,
        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildMenuItem(
    IconData icon,
    String title, {
    Color color = const Color(0xFF3D5CFF),
  }) {
    return ListTile(
      leading: Icon(icon, color: color, size: 24.r),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
      onTap: () {},
    );
  }

  Widget _buildNavBarItem(IconData icon, String label, bool selected) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: selected ? Color(0xFF3D5CFF) : Colors.grey,
          size: 24.r,
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12.sp,
            color: selected ? Color(0xFF3D5CFF) : Colors.grey,
          ),
        ),
      ],
    );
  }
}
