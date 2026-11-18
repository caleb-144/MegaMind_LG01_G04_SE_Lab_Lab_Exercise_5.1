import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  static const Color accentColor = Colors.indigo;
  static const Color backgroundColor = Color(0xFFF5F6FA);

  static const List<Map<String, String>> team = [
    {'name': 'Caleb Budi Anak Christopher', 'id': '102483'},
    {'name': 'Reynoldson Ganing Anak Alfred Jabu', 'id': '102936'},
    {'name': 'Muhammad Fahdil bin Sulaidi', 'id': '102733'},
    {'name': 'Joeshua Rangga Anak Joseph', 'id': '102632'},
    {'name': 'Matthias Lemada Anak Peter', 'id': '102673'},
  ];

  static const List<String> features = [
    'Home dashboard with quick access',
    'Student list and detailed profiles',
    'Sortable student records table',
    'Programme information',
    'Drawer and bottom navigation',
  ];

  static const List<String> techStack = [
    'Flutter',
    'Dart',
    'Provider',
    'Material 3',
    'GitHub Actions',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildProfileHeader(),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSection(
                    title: 'About the App',
                    icon: Icons.info_outline,
                    child: const Text(
                      'StudentHub is a student management app that works '
                          'like a university student portal. Students can check '
                          'their details, view academic records and learn more '
                          'about their programme.',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                        height: 1.6,
                      ),
                    ),
                  ),
                  _buildSection(
                    title: 'Key Features',
                    icon: Icons.check_circle_outline,
                    child: Column(
                      children: features
                          .map(
                            (f) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.check,
                                color: Colors.green,
                                size: 18,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  f,
                                  style: const TextStyle(
                                    color: Colors.black87,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                          .toList(),
                    ),
                  ),
                  _buildSection(
                    title: 'Development Team',
                    icon: Icons.groups_outlined,
                    child: Column(
                      children: team.map(_buildMember).toList(),
                    ),
                  ),
                  _buildSection(
                    title: 'Built With',
                    icon: Icons.build_outlined,
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: techStack
                          .map(
                            (t) => Chip(
                          label: Text(t),
                          labelStyle: const TextStyle(
                            color: accentColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                          backgroundColor:
                          accentColor.withValues(alpha: 0.08),
                          side: BorderSide.none,
                        ),
                      )
                          .toList(),
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Center(
                    child: Text(
                      'TMA3084 Software Engineering Laboratory\n'
                          'Lab Exercise 5.1 • UNIMAS',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 12,
                        height: 1.6,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Stack-based profile header: gradient background, decorative circles,
  // a watermark icon and an avatar overlapping the bottom edge.
  Widget _buildProfileHeader() {
    return SizedBox(
      height: 290,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          // Layer 1: gradient background
          Container(
            height: 200,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF3949AB), Color(0xFF1A237E)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36),
              ),
            ),
          ),

          // Layer 2: decorative circles
          Positioned(top: -35, right: -30, child: _circle(130, 0.08)),
          Positioned(top: 70, left: -45, child: _circle(110, 0.06)),

          // Layer 3: watermark icon
          Positioned(
            top: 28,
            right: 24,
            child: Icon(
              Icons.school,
              size: 70,
              color: Colors.white.withValues(alpha: 0.15),
            ),
          ),

          // Layer 4: tagline text
          const Positioned(
            top: 34,
            left: 24,
            child: Text(
              'Student Management\nSystem',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 15,
                height: 1.4,
              ),
            ),
          ),

          // Layer 5: avatar overlapping the header edge
          Positioned(
            top: 140,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.15),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const CircleAvatar(
                radius: 48,
                backgroundColor: accentColor,
                child: Icon(Icons.school, color: Colors.white, size: 50),
              ),
            ),
          ),

          // Layer 6: app name and version below the avatar
          Positioned(
            top: 252,
            child: Column(
              children: [
                const Text(
                  'StudentHub',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Version 1.0.0',
                  style: TextStyle(
                    color: Colors.black.withValues(alpha: 0.5),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _circle(double size, double alpha) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withValues(alpha: alpha),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required IconData icon,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.black12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: accentColor, size: 22),
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }

  Widget _buildMember(Map<String, String> member) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      dense: true,
      leading: CircleAvatar(
        backgroundColor: accentColor.withValues(alpha: 0.1),
        child: const Icon(Icons.person, color: accentColor),
      ),
      title: Text(
        member['name']!,
        style: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
      ),
      subtitle: Text(
        'Student ID: ${member['id']}',
        style: const TextStyle(color: Colors.black54, fontSize: 12),
      ),
    );
  }
}