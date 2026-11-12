import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';
import 'student_information_page.dart';
import 'students_records_page.dart';
import 'programme_page.dart';
import 'about_page.dart';
import 'providers/share_state_management.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ShareStateManagement(),
      child: const StudentHubApp(),
    ),
  );
}

class StudentHubApp extends StatelessWidget {
  const StudentHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StudentHub',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
        ),
        scaffoldBackgroundColor: const Color(0xFFF5F6FA),
      ),
      home: const MainNavigationPage(),
    );
  }
}

class MainNavigationPage extends StatelessWidget {
  const MainNavigationPage({super.key});

  final List<String> pageTitles = const [
    'StudentHub',
    'Student Information',
    'Student Records',
    'Programmes',
    'About',
  ];

  @override
  Widget build(BuildContext context) {
    final navigation = context.watch<ShareStateManagement>();
    final currentIndex = navigation.currentIndex;

    final List<Widget> pages = [
      const HomePage(),
      const StudentInformationPage(),
      const StudentsRecordsPage(),
      const ProgrammePage(),
      const AboutPage(),
    ];

    void navigateTo(int index) {
      navigation.setIndex(index);
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitles[currentIndex]),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        elevation: 0,
      ),

      // Navigation Drawer
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.indigo,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.school,
                    color: Colors.white,
                    size: 45,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'StudentHub',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Student Management System',
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

            _buildDrawerItem(
              context,
              icon: Icons.home,
              title: 'Home',
              index: 0,
              currentIndex: currentIndex,
              onTap: navigateTo,
            ),

            _buildDrawerItem(
              context,
              icon: Icons.people,
              title: 'Student Information',
              index: 1,
              currentIndex: currentIndex,
              onTap: navigateTo,
            ),

            _buildDrawerItem(
              context,
              icon: Icons.table_chart,
              title: 'Student Records',
              index: 2,
              currentIndex: currentIndex,
              onTap: navigateTo,
            ),

            _buildDrawerItem(
              context,
              icon: Icons.school,
              title: 'Programmes',
              index: 3,
              currentIndex: currentIndex,
              onTap: navigateTo,
            ),

            const Divider(),

            _buildDrawerItem(
              context,
              icon: Icons.info,
              title: 'About',
              index: 4,
              currentIndex: currentIndex,
              onTap: navigateTo,
            ),
          ],
        ),
      ),

      // Main Pages
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),

      // Bottom Navigation
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          navigation.setIndex(index);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.people_outline),
            selectedIcon: Icon(Icons.people),
            label: 'Students',
          ),
          NavigationDestination(
            icon: Icon(Icons.table_chart_outlined),
            selectedIcon: Icon(Icons.table_chart),
            label: 'Records',
          ),
          NavigationDestination(
            icon: Icon(Icons.school_outlined),
            selectedIcon: Icon(Icons.school),
            label: 'Programmes',
          ),
          NavigationDestination(
            icon: Icon(Icons.info_outline),
            selectedIcon: Icon(Icons.info),
            label: 'About',
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required int index,
    required int currentIndex,
    required Function(int) onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      selected: currentIndex == index,
      selectedTileColor: Colors.indigo.withValues(alpha: 0.1),
      onTap: () => onTap(index),
    );
  }
}
