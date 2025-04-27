import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  final String title;
  final String message;
  final String time;
  final IconData icon;
  final bool isHighlighted;

  const NotificationCard({
    Key? key,
    required this.title,
    required this.message,
    required this.time,
    required this.icon,
    this.isHighlighted = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: ShapeDecoration(
        color: isHighlighted ? const Color(0x0C0056FF) : Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            strokeAlign: BorderSide.strokeAlignCenter,
            color:
                isHighlighted
                    ? const Color(0x190057FF)
                    : const Color(0xFFEBEBEB),
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: ShapeDecoration(
              color: const Color(0x190057FF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(360),
              ),
            ),
            child: Icon(icon, size: 16, color: const Color(0xFF0056FF)),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          color: Color(0xFF0F1728),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          height: 1.43,
                        ),
                      ),
                    ),
                    Text(
                      time,
                      style: TextStyle(
                        color:
                            isHighlighted
                                ? const Color(0xFF0056FF)
                                : const Color(0xFFA6A6A6),
                        fontSize: 10,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        height: 1.60,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: isHighlighted ? 4 : 6),
                Text(
                  message,
                  style: TextStyle(
                    color: const Color(0xFF0F1728),
                    fontSize: 12,
                    fontFamily: isHighlighted ? 'Poppins' : 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 1.50,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
