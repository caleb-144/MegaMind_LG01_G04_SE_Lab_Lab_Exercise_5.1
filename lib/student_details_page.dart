
import 'package:flutter/material.dart';

class StudentDetailsPage extends StatelessWidget {
  final String name;
  final String id;
  final String programme;
  final String faculty;
  final String email;
  final String year;
  final String group;

  const StudentDetailsPage({
    super.key,
    required this.name,
    required this.id,
    required this.programme,
    required this.faculty,
    required this.email,
    required this.year,
    required this.group,
  });

  static const Color accentColor = Colors.indigo;
  static const Color backgroundColor = Color(0xFFF5F6FA);

  Widget buildDetail(
    String label,
    String value,
    IconData icon,
  ) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.black12,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: accentColor.withValues(alpha: 0.1),
            child: Icon(
              icon,
              color: accentColor,
              size: 21,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 6),
                SelectableText(
                  value,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text(
          'Student Details',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: accentColor,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),

            // Student Profile Icon
            CircleAvatar(
              radius: 48,
              backgroundColor: accentColor.withValues(alpha: 0.1),
              child: const Icon(
                Icons.person,
                color: accentColor,
                size: 55,
              ),
            ),

            const SizedBox(height: 16),

            // Student Name
            Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            // Student ID
            Text(
              'Student ID: $id',
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 14,
              ),
            ),

            const SizedBox(height: 28),

            // Student Details
            buildDetail(
              'Full Name',
              name,
              Icons.person_outline,
            ),

            buildDetail(
              'Student ID Number',
              id,
              Icons.badge_outlined,
            ),

            buildDetail(
              'Programme',
              programme,
              Icons.school_outlined,
            ),

            buildDetail(
              'Faculty',
              faculty,
              Icons.account_balance_outlined,
            ),

            buildDetail(
              'Email Address',
              email,
              Icons.email_outlined,
            ),

            buildDetail(
              'Year of Study',
              year,
              Icons.calendar_today_outlined,
            ),

            buildDetail(
              'Tutorial Group',
              group,
              Icons.groups_outlined,
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
