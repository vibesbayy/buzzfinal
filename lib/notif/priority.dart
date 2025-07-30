import 'package:flutter/material.dart';
import '../notif/groupcard.dart';
import '../widget/bn.dart';

class Priority extends StatefulWidget {
  const Priority({super.key});

  @override
  State<Priority> createState() => _PriorityState();
}

class _PriorityState extends State<Priority> {
  String selectedPlatform = 'WhatsApp';

  final Map<String, List<Map<String, String>>> groupList = {
    'WhatsApp': [
      {'name': 'Group Arifin Ahmad', 'message': 'Halo, sudah sampai mana?'},
      {'name': 'Group GSD', 'message': 'Siap dikirim hari ini.'},
      {'name': 'Group Sudirman', 'message': 'Tolong konfirmasi ulang.'},
      {'name': 'Group Grapari', 'message': 'Terima kasih atas kerjasamanya.'},
    ],
    'Telegram': [
      {'name': 'Group Sudirman', 'message': 'Jangan lupa laporan sore ini.'},
      {'name': 'Group GSD', 'message': 'Meeting jam 10 ya.'},
      {'name': 'Group Arifin Ahmad', 'message': 'Sudah diinput semua datanya.'},
      {'name': 'Group Grapari', 'message': 'Pengajuan sudah disetujui.'},
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                  top: 120, bottom: 35, right: 15, left: 15),
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/background.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "HAI, BAYU EVRI SAPUTRA",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Stack(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.yellow.shade600,
                                  blurRadius: 8,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                            child: const Icon(Icons.mail, color: Colors.red),
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color: Colors.yellow,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Text(
                                '177',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.75),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.search, color: Colors.white),
                        SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: 'Search Group',
                              hintStyle: TextStyle(color: Colors.white70),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildPlatformButton('WhatsApp'),
                      const SizedBox(width: 35),
                      _buildPlatformButton('Telegram'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 35),
            Expanded(
              child: ListView.builder(
                itemCount: groupList[selectedPlatform]!.length,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) {
                  final group = groupList[selectedPlatform]![index];
                  return Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: GroupCard(
                      name: group['name']!,
                      message: group['message']!,
                      onTap: () {
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //   SnackBar(content: Text('Membuka ${group['name']}')),
                        // );
                      },
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const BottomNav(
        currentIndex: 2,
      ),
    );
  }

  Widget _buildPlatformButton(String platform) {
    final bool isSelected = selectedPlatform == platform;
    return SizedBox(
      width: 170,
      height: 40,
      child: ElevatedButton.icon(
        onPressed: () => setState(() => selectedPlatform = platform),
        label: Text(
          platform,
          style: TextStyle(
            color: isSelected ? Colors.black : Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor:
              isSelected ? Colors.white : Colors.black.withOpacity(0.6),
          padding: const EdgeInsets.symmetric(vertical: 3),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}