import 'package:flutter/material.dart';
import 'package:buzz/widget/whatsapp.dart';
import 'package:buzz/widget/telegram.dart';
import '../cm/cm.dart';
import '../widget/bn.dart';
import '../widget/groupcard.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String selectedPlatform = 'WhatsApp';

  final Map<String, List<String>> groupList = {
    'WhatsApp': [
      'Group Arifin Ahmad',
      'Group GSD',
      'Group Sudirman',
      'Group Grapari',
    ],
    'Telegram': [
      'Group Sudirman',
      'Group GSD',
      'Group Arifin Ahmad',
      'Group Grapari',
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      WhatsApp(
                        isSelected: selectedPlatform == 'WhatsApp',
                        onPressed: () {
                          setState(() {
                            selectedPlatform = 'WhatsApp';
                          });
                        },
                      ),
                      const SizedBox(width: 30),
                      Telegram(
                        isSelected: selectedPlatform == 'Telegram',
                        onPressed: () {
                          setState(() {
                            selectedPlatform = 'Telegram';
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 35),
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: ListView.builder(
                  key: ValueKey(selectedPlatform),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: groupList[selectedPlatform]!.length,
                  itemBuilder: (context, index) {
                    final groupName = groupList[selectedPlatform]![index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: GroupCard(
                        name: groupName,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => CreateMessage(
                                groupName: groupName,
                                platform: selectedPlatform,
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNav(currentIndex: 0),
    );
  }
}