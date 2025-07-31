import 'package:flutter/material.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  Widget buildSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: const TextStyle(fontSize: 14, height: 1.5),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const Expanded(
                      child: Text(
                        "Privacy Policy",
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
                buildSection(
                  "1. Types of Data We Collect",
                  "We may collect various types of personal information, including but not limited to your name, email address, contact information, usage data, and preferences.\n\n"
                      "We may also collect technical data such as your IP address, browser type, device information, and activity logs when you interact with our app.",
                ),
                buildSection(
                  "2. Use of Your Personal Data",
                  "Your personal data is used to provide and improve our services, personalize your experience, communicate with you, and ensure the security of our platform.\n\n"
                      "We may also use the data for analytics purposes to enhance app performance and understand user behavior.",
                ),
                buildSection(
                  "3. Disclosure of Your Personal Data",
                  "We do not sell or share your personal information with third parties without your consent, except as required by law or to protect our rights.\n\n"
                      "In some cases, we may work with trusted service providers who assist us in delivering our services. These parties are contractually obligated to protect your data.\n\n"
                      "We take all reasonable steps to ensure your data remains secure and is not accessed or disclosed without authorization.",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
