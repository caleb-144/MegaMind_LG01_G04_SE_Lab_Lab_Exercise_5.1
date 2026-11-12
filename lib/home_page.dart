import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/share_state_management.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void navigateTo(BuildContext context, int index) {
    context.read<ShareStateManagement>().setIndex(index);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Welcome Section
          const Text(
            'Welcome to StudentHub!',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.indigo,
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            'Your student management platform. '
            'Access student information, academic records '
            'and programme details in one place.',
            style: TextStyle(
              fontSize: 15,
              color: Colors.black54,
              height: 1.5,
            ),
          ),

          const SizedBox(height: 25),

          // Dashboard Banner
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: Colors.indigo,
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.school,
                  color: Colors.white,
                  size: 45,
                ),
                SizedBox(height: 15),
                Text(
                  'StudentHub Dashboard',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Manage and explore student academic '
                  'information efficiently.',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 28),

          // Quick Access Heading
          const Text(
            'Quick Access',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 15),

          // Quick Access Cards
          _buildMenuCard(
            context,
            icon: Icons.people,
            title: 'Student Information',
            description: 'View the list of registered students.',
            index: 1,
          ),

          const SizedBox(height: 12),

          _buildMenuCard(
            context,
            icon: Icons.table_chart,
            title: 'Student Records',
            description: 'Explore and sort student academic records.',
            index: 2,
          ),

          const SizedBox(height: 12),

          _buildMenuCard(
            context,
            icon: Icons.school,
            title: 'Programmes',
            description: 'Explore available academic programmes.',
            index: 3,
          ),

          const SizedBox(height: 25),

          // Information Section
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Colors.black12,
              ),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'About StudentHub',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'StudentHub provides a centralised platform '
                  'for accessing student information, records '
                  'and academic programme details.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildMenuCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String description,
    required int index,
  }) {
    return Card(
      elevation: 1,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 12,
        ),
        leading: CircleAvatar(
          backgroundColor: Colors.indigo.withValues(alpha: 0.1),
          child: Icon(
            icon,
            color: Colors.indigo,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(description),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
        ),
        onTap: () => navigateTo(context, index),
      ),
    );
  }
}
