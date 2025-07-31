import 'package:flutter/material.dart';
import '../widget/bn.dart';
import 'edit_profile.dart';
import 'notifikasi.dart';
import 'language.dart';
import 'privacy.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNav(currentIndex: 3),
      body: SafeArea(
        child: SingleChildScrollView( // Tambahkan scroll di sini
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Center(
                  child: Stack(
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/avatar.jpg'),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 4,
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          padding: const EdgeInsets.all(4),
                          child: const Icon(Icons.edit, size: 20),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Bayu Evri',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'bayu**@gmail.com',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 30),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.edit),
                        title: const Text('Edit profile information'),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const EditProfile()),
                          );
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.notifications),
                        title: const Text('Notifications'),
                        trailing:
                            const Text('ON', style: TextStyle(color: Colors.red)),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const NotificationSettings()),
                          );
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.language),
                        title: const Text('Language'),
                        trailing: const Text('English'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const LanguageSettings()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    children: const [
                      ListTile(
                        leading: Icon(Icons.security),
                        title: Text('Security'),
                        trailing: Icon(Icons.chevron_right),
                      ),
                      ListTile(
                        leading: Icon(Icons.brightness_6),
                        title: Text('Theme'),
                        trailing: Text('Light mode',
                            style: TextStyle(color: Colors.red)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    children: [
                      const ListTile(
                        leading: Icon(Icons.help_outline),
                        title: Text('Help & Support'),
                        trailing: Icon(Icons.chevron_right),
                      ),
                      const ListTile(
                        leading: Icon(Icons.email_outlined),
                        title: Text('Contact us'),
                        trailing: Icon(Icons.chevron_right),
                      ),
                      ListTile(
                        leading: const Icon(Icons.privacy_tip_outlined),
                        title: const Text('Privacy policy'),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PrivacyPolicy()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
