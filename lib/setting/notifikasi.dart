import 'package:flutter/material.dart';

class NotificationSettings extends StatefulWidget {
  const NotificationSettings({super.key});

  @override
  State<NotificationSettings> createState() => _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettings> {
  bool generalNotification = true;
  bool sound = false;
  bool vibrate = true;

  bool appUpdates = false;
  bool promotion = true;

  bool newServiceAvailable = false;
  bool newTipsAvailable = true;

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }

  Widget buildSwitchTile(String title, bool value, Function(bool) onChanged) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      onChanged: onChanged,
      activeColor: Colors.red,
      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
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
                      "Notifications",
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
              buildSectionTitle("Common"),
              buildSwitchTile("General Notification", generalNotification,
                  (value) => setState(() => generalNotification = value)),
              buildSwitchTile(
                  "Sound", sound, (value) => setState(() => sound = value)),
              buildSwitchTile("Vibrate", vibrate,
                  (value) => setState(() => vibrate = value)),
              const Divider(height: 32),
              buildSectionTitle("System & services update"),
              buildSwitchTile("App updates", appUpdates,
                  (value) => setState(() => appUpdates = value)),
              buildSwitchTile("Promotion", promotion,
                  (value) => setState(() => promotion = value)),
              const Divider(height: 32),
              buildSectionTitle("Others"),
              buildSwitchTile("New Service Available", newServiceAvailable,
                  (value) => setState(() => newServiceAvailable = value)),
              buildSwitchTile("New Tips Available", newTipsAvailable,
                  (value) => setState(() => newTipsAvailable = value)),
            ],
          ),
        ),
      ),
    );
  }
}
