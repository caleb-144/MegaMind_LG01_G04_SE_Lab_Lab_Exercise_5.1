
import 'package:flutter/material.dart';
import 'student_details_page.dart';

class StudentInformationPage extends StatelessWidget {
  const StudentInformationPage({super.key});

  static const Color accentColor = Colors.indigo;
  static const Color backgroundColor = Color(0xFFF5F6FA);

  static const List<Map<String, String>> students = [
    {
      'name': 'Caleb Budi Anak Christopher',
      'id': '102483',
      'programme': 'Bachelor of Software Engineering with Honours',
      'faculty':
          'Faculty of Computer Science and Information Technology',
      'email': '102483@siswa.unimas.my',
      'year': 'Year 3',
      'group': 'G03',
    },
    {
      'name': 'Reynoldson Ganing Anak Alfred Jabu',
      'id': '102936',
      'programme': 'Bachelor of Software Engineering with Honours',
      'faculty':
          'Faculty of Computer Science and Information Technology',
      'email': '102936@siswa.unimas.my',
      'year': 'Year 3',
      'group': 'G03',
    },
    {
      'name': 'Muhammad Fahdil bin Sulaidi',
      'id': '102733',
      'programme': 'Bachelor of Software Engineering with Honours',
      'faculty':
          'Faculty of Computer Science and Information Technology',
      'email': '102733@siswa.unimas.my',
      'year': 'Year 3',
      'group': 'G03',
    },
    {
      'name': 'Joeshua Rangga Anak Joseph',
      'id': '102632',
      'programme': 'Bachelor of Software Engineering with Honours',
      'faculty':
          'Faculty of Computer Science and Information Technology',
      'email': '102632@siswa.unimas.my',
      'year': 'Year 3',
      'group': 'G03',
    },
    {
      'name': 'Matthias Lemada Anak Peter',
      'id': '102673',
      'programme': 'Bachelor of Software Engineering with Honours',
      'faculty':
          'Faculty of Computer Science and Information Technology',
      'email': '102673@siswa.unimas.my',
      'year': 'Year 3',
      'group': 'G03',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text(
          'Student Information',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: accentColor,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // Page Heading
          const Text(
            'Student Directory',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            'View information about all registered students.',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 14,
              height: 1.5,
            ),
          ),

          const SizedBox(height: 22),

          // Total Students Banner
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: accentColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.groups,
                  color: Colors.white,
                  size: 42,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Registered Students',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '${students.length} Students',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          // Student List Heading
          const Text(
            'Student List',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 15),

          // Student Cards
          ...students.map((student) {
            return Card(
              elevation: 1,
              color: Colors.white,
              margin: const EdgeInsets.only(bottom: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: const BorderSide(
                  color: Colors.black12,
                ),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),

                // Student Avatar
                leading: CircleAvatar(
                  backgroundColor:
                      accentColor.withValues(alpha: 0.1),
                  child: const Icon(
                    Icons.person,
                    color: accentColor,
                  ),
                ),

                // Student Name
                title: Text(
                  student['name']!,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),

                // Student Information
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 7),
                  child: Text(
                    'Student ID: ${student['id']}\n'
                    'Software Engineering • ${student['year']}\n'
                    'Group: ${student['group']}',
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 12,
                      height: 1.7,
                    ),
                  ),
                ),

                // Navigation Icon
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: accentColor,
                  size: 16,
                ),

                // Navigate to Student Details
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StudentDetailsPage(
                        name: student['name']!,
                        id: student['id']!,
                        programme: student['programme']!,
                        faculty: student['faculty']!,
                        email: student['email']!,
                        year: student['year']!,
                        group: student['group']!,
                      ),
                    ),
                  );
                },
              ),
            );
          }),

          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
