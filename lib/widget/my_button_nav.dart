import 'package:myapp/page/home.dart';

import '../core.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index) {
        if (index == 0) {
          Get.to(const Home());
        } else if (index == 1) {
          _showComingSoonDialog(context);
        } else if (index == 2) {
          _showAboutDialog(context);
        }
      },
      items: const [
// Suggested code may be subject to a license. Learn more: ~LicenseLog:2186305377.
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Beranda',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: 'Bookmark',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.info),
          label: 'Tentang',
        ),
      ],
    );
  }
}

// Show a "Coming Soon" dialog for the Bookmark tab
void _showComingSoonDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Segera Hadir"),
        content: const Text("Fitur ini sedang dalam pengembangan."),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text("Tutup"),
          ),
        ],
      );
    },
  );
}

// Show an "About" dialog box with app details and developer information
void _showAboutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Tentang Aplikasi Ini"),
        content: const Text(
          "Aplikasi Mobile Learning untuk Universitas Negeri Semarang\n\n"
          "Aplikasi ini menyediakan sumber daya pendidikan bagi mahasiswa, "
          "termasuk kursus, video, dan konten interaktif. "
          "Tujuan aplikasi ini adalah untuk meningkatkan pembelajaran melalui teknologi mobile.\n\n"
          "Pengembang: Ilham Maulana\n"
          "Email: k4ilham@gmail.com\n"
          "Website: www.inercorp.com",
          style: TextStyle(fontSize: 16),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text("Tutup"),
          ),
        ],
      );
    },
  );
}
