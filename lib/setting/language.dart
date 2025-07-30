import 'package:flutter/material.dart';

class LanguageSettings extends StatefulWidget {
  const LanguageSettings({super.key});

  @override
  State<LanguageSettings> createState() => _LanguageSettingsState();
}

class _LanguageSettingsState extends State<LanguageSettings> {
  String selectedLanguage = 'English (UK)';

  final List<String> suggestedLanguages = [
    'English (US)',
    'English (UK)',
  ];

  final List<String> otherLanguages = [
    'Mandarin',
    'Hindi',
    'Spanish',
    'French',
    'Arabic',
    'Russian',
    'Indonesia',
    'Vietnamese',
  ];

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }

  Widget buildLanguageOption(String language) {
    return ListTile(
      title: Text(language),
      trailing: Radio<String>(
        value: language,
        groupValue: selectedLanguage,
        onChanged: (value) {
          setState(() {
            selectedLanguage = value!;
          });
        },
        activeColor: Colors.red,
        fillColor: WidgetStateProperty.all(Colors.red),
      ),
      onTap: () {
        setState(() {
          selectedLanguage = language;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: ListView(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Expanded(
                    child: Text(
                      "Language",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(width: 45),
                ],
              ),
              const SizedBox(height: 16),
              buildSectionTitle("Suggested"),
              ...suggestedLanguages.map(buildLanguageOption),
              const SizedBox(height: 16),
              buildSectionTitle("Others"),
              ...otherLanguages.map(buildLanguageOption),
            ],
          ),
        ),
      ),
    );
  }
}