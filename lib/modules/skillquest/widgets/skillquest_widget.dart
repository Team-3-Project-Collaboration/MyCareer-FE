import 'package:flutter/material.dart';

class SkillQuestWidget extends StatelessWidget {
  final Map<String, dynamic> quest;
  final VoidCallback? onTap;
  const SkillQuestWidget({Key? key, required this.quest, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 56,
                height: 56,
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: quest['color'] ?? Colors.red[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  quest['icon'] ?? Icons.circle,
                  color: quest['color'] == Colors.blue[100] ? Colors.blue : Colors.red,
                  size: 32,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        (quest['title'] ?? 'Bootcamp Title') as String,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'By ${(quest['author'] ?? 'Author') as String} • ${(quest['level'] ?? 'All Level') as String}',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Rp ${(quest['price'] ?? '850.000') as String}',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}