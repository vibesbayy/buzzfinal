import 'package:flutter/material.dart';
import '../notif/bubble_notification.dart';
import '../widget/bn.dart';
import '../widget/whatsapp.dart';
import '../widget/telegram.dart';

class CreateMessage extends StatefulWidget {
  final String? groupName;
  final String? platform;

  const CreateMessage({super.key, this.groupName, this.platform});

  @override
  State<CreateMessage> createState() => _CreateMessageState();
}

class _CreateMessageState extends State<CreateMessage> {
  late String selectedPlatform;
  late String selectedGroup;
  late TextEditingController groupController;
  final TextEditingController descriptionController = TextEditingController();

  final Map<String, List<String>> groupList = {
    'WhatsApp': [
      'Group Arifin Ahmad',
      'Group GSD',
      'Group Sudirman',
      'Group Grapari',
    ],
    'Telegram': [
      'Group Arifin Ahmad',
      'Group GSD',
      'Group Sudirman',
      'Group Grapari',
    ],
  };

  int? selectedYear, selectedMonth, selectedDay;
  int? selectedHour, selectedMinute;
  String? selectedAmPm;

  final List<int> years = List.generate(100, (index) => 2025 - index);
  final List<int> months = List.generate(12, (index) => index + 1);
  final List<int> days = List.generate(31, (index) => index + 1);
  final List<int> hours = List.generate(12, (index) => index + 1);
  final List<int> minutes = List.generate(60, (index) => index);
  final List<String> amPm = ['AM', 'PM'];

  @override
  void initState() {
    super.initState();
    selectedPlatform = widget.platform ?? 'WhatsApp';
    selectedGroup = widget.groupName ?? groupList[selectedPlatform]!.first;
    groupController = TextEditingController(text: selectedGroup);
  }

  @override
  void dispose() {
    groupController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!groupList[selectedPlatform]!.contains(selectedGroup)) {
      selectedGroup = groupList[selectedPlatform]!.first;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            buildHeader(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 30),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Add Message',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 16),
                    buildGroupDropdown(),
                    const SizedBox(height: 20),
                    buildDescriptionField(),
                    const SizedBox(height: 16),
                    buildDateSelector(),
                    const SizedBox(height: 16),
                    buildTimeSelector(),
                    const SizedBox(height: 25),
                    buildSendButton(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNav(currentIndex: 1),
    );
  }

  Widget buildHeader() {
    return Container(
      padding: const EdgeInsets.only(top: 120, bottom: 35, right: 15, left: 15),
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
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
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
                    selectedGroup = groupList[selectedPlatform]!.first;
                    groupController.text = selectedGroup;
                  });
                },
              ),
              const SizedBox(width: 30),
              Telegram(
                isSelected: selectedPlatform == 'Telegram',
                onPressed: () {
                  setState(() {
                    selectedPlatform = 'Telegram';
                    selectedGroup = groupList[selectedPlatform]!.first;
                    groupController.text = selectedGroup;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildGroupDropdown() {
    return DropdownButtonHideUnderline(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: MediaQuery.of(context).size.width * 0.90,
        decoration: BoxDecoration(
          color: const Color(0xFFEEEEEE),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: DropdownButton<String>(
          value: selectedGroup,
          isExpanded: true,
          icon: const SizedBox.shrink(),
          items: groupList[selectedPlatform]!
              .map((group) => DropdownMenuItem<String>(
                    value: group,
                    child: Text(group),
                  ))
              .toList(),
          onChanged: (value) {
            if (value != null) {
              setState(() {
                selectedGroup = value;
                groupController.text = value;
              });
            }
          },
        ),
      ),
    );
  }

  Widget buildDescriptionField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFEEEEEE),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: TextField(
          controller: descriptionController,
          maxLines: 2,
          decoration: InputDecoration(
            hintText: 'Add Description',
            filled: true,
            fillColor: const Color(0xFFEEEEEE),
            contentPadding: const EdgeInsets.all(16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDateSelector() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Set Date', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: invisibleDropdown("Year", years, selectedYear,
                    (val) => setState(() => selectedYear = val)),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: invisibleDropdown("Month", months, selectedMonth,
                    (val) => setState(() => selectedMonth = val)),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: invisibleDropdown("Date", days, selectedDay,
                    (val) => setState(() => selectedDay = val)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildTimeSelector() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Set Time', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: invisibleDropdown("Hour", hours, selectedHour,
                    (val) => setState(() => selectedHour = val)),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: invisibleDropdown("Minute", minutes, selectedMinute,
                    (val) => setState(() => selectedMinute = val)),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: invisibleDropdown("AM/PM", amPm, selectedAmPm,
                    (val) => setState(() => selectedAmPm = val)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget invisibleDropdown<T>(String label, List<T> items, T? selectedValue,
      void Function(T) onChanged) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFEEEEEE),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () async {
          T? selectedItem = await showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                content: SingleChildScrollView(
                  child: Column(
                    children: items.map((val) {
                      return ListTile(
                        title: Text(val.toString()),
                        onTap: () => Navigator.of(context).pop(val),
                      );
                    }).toList(),
                  ),
                ),
              );
            },
          );
          if (selectedItem != null) {
            onChanged(selectedItem);
          }
        },
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            selectedValue?.toString() ?? label,
            style: const TextStyle(color: Colors.black, fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget buildSendButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            width: 150,
            height: 40,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 39, 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                if (selectedYear == null ||
                    selectedMonth == null ||
                    selectedDay == null ||
                    selectedHour == null ||
                    selectedMinute == null ||
                    selectedAmPm == null ||
                    descriptionController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Lengkapi semua field terlebih dahulu.'),
                    ),
                  );
                  return;
                }

                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    Future.delayed(const Duration(milliseconds: 500), () {
                      showSystemNotification(
                        '$selectedPlatform - $selectedGroup',
                        '📩 Pesan baru masuk',
                      );
                    });
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      contentPadding: const EdgeInsets.all(25),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.check_circle,
                              size: 120, color: Colors.green),
                          const SizedBox(height: 20),
                          const Text(
                            'Pesan terkirim',
                            style: TextStyle(color: Colors.brown, fontSize: 18),
                          ),
                          const SizedBox(height: 25),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                              ),
                              child: const Text(
                                'DONE',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: const Text(
                'SEND',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
