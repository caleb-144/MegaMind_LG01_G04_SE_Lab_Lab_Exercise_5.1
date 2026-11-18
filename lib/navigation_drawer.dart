import 'package:flutter/material.dart';

class StudentNavigationDrawer extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onItemSelected;

  const StudentNavigationDrawer({
    super.key,
    required this.currentIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.indigo),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.school, color: Colors.white, size: 45),
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
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
          _buildDrawerItem(context, icon: Icons.home, title: 'Home', index: 0),
          _buildDrawerItem(
            context,
            icon: Icons.people,
            title: 'Student Information',
            index: 1,
          ),
          _buildDrawerItem(
            context,
            icon: Icons.table_chart,
            title: 'Student Records',
            index: 2,
          ),
          _buildDrawerItem(
            context,
            icon: Icons.school,
            title: 'Programmes',
            index: 3,
          ),
          const Divider(),
          _buildDrawerItem(context, icon: Icons.info, title: 'About', index: 4),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required int index,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      selected: currentIndex == index,
      selectedTileColor: Colors.indigo.withValues(alpha: 0.1),
      onTap: () {
        onItemSelected(index);
        Navigator.pop(context);
      },
    );
  }
}
