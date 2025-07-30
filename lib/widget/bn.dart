import 'package:flutter/material.dart';
import '../dashboard/dashboard.dart';
import '../cm/cm.dart';
import '../notif/priority.dart';
import '../setting/profile.dart';

class BottomNav extends StatefulWidget {
  final int currentIndex;

  const BottomNav({super.key, required this.currentIndex});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  late int _currentIndex;

  get selectedPlatform => null;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex;
  }

  void _onItemTapped(BuildContext context, int index) {
    if (index == _currentIndex) return;

    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const Dashboard()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (_) => CreateMessage(
                    groupName: '',
                    platform: 'WhatsApp',
                  )),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const Priority()),
        );
        break;
      case 3:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const Profile()),
        );
        break;
    }

    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildIconButton(Icons.home, 0, context),
          _buildIconButton(
              _currentIndex == 1 ? Icons.article : Icons.article_outlined,
              1,
              context),
          _buildIconButton(
            _currentIndex == 2 ? Icons.chat_rounded : Icons.chat_bubble_outline,
            2,
            context,
          ),
          _buildIconButton(Icons.person, 3, context),
        ],
      ),
    );
  }

  IconButton _buildIconButton(IconData icon, int index, BuildContext context) {
    return IconButton(
      icon: Icon(icon),
      iconSize: 30,
      onPressed: () => _onItemTapped(context, index),
      color: _currentIndex == index ? Colors.red : Colors.grey,
    );
  }
}