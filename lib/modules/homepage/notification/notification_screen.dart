import 'package:flutter/material.dart';
import 'package:mycareer/modules/homepage/notification/widgets/notification_card.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifikasi'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        // padding: const EdgeInsets.only(16),
        children: const [
          NotificationCard(
            title: 'Job Match',
            message:
                'Anda memiliki 5 pekerjaan baru yang sesuai dengan profil Anda.',
            time: '5 Menit',
            isHighlighted: true,
            icon: Icons.work,
          ),
          // SizedBox(height: 12),
          NotificationCard(
            title: 'Undangan Wawancara',
            message: 'Selamat! Anda telah diundang untuk wawancara oleh Gojek.',
            time: '10 Menit',
            icon: Icons.mail,
          ),
          // SizedBox(height: 12),
          NotificationCard(
            title: 'Status Aplikasi',
            message: 'Status lamaran Anda sedang ditinjau.',
            time: '1 Jam',
            icon: Icons.check_circle,
          ),
        ],
      ),
    );
  }
}
