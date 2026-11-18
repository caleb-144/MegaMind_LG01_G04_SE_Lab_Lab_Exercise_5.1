
import 'package:flutter/material.dart';

class ProgrammePage extends StatelessWidget {
  const ProgrammePage({super.key});

  static const Color primaryColor = Color(0xFF4053B5);
  static const Color backgroundColor = Color(0xFFF5F6FA);

  static const List<Map<String, String>> students = [
    {
      'name': 'Caleb Budi Anak Christopher',
      'id': '102483',
      'programme': 'Software Engineering',
      'year': 'Year 3',
      'group': 'G03',
    },
    {
      'name': 'Reynoldson Ganing Anak Alfred Jabu',
      'id': '102936',
      'programme': 'Software Engineering',
      'year': 'Year 3',
      'group': 'G03',
    },
    {
      'name': 'Muhammad Fahdil bin Sulaidi',
      'id': '102733',
      'programme': 'Software Engineering',
      'year': 'Year 3',
      'group': 'G03',
    },
    {
      'name': 'Joeshua Rangga Anak Joseph',
      'id': '102632',
      'programme': 'Software Engineering',
      'year': 'Year 3',
      'group': 'G03',
    },
    {
      'name': 'Matthias Lemada Anak Peter',
      'id': '102673',
      'programme': 'Software Engineering',
      'year': 'Year 3',
      'group': 'G03',
    },
  ];

  static const List<Map<String, dynamic>> programmes = [
    {
      'short': 'Software Eng.',
      'name': 'Bachelor of Software Engineering with Honours',
      'icon': Icons.code,
      'description':
          'Focuses on systematic software design, full-stack architecture, mobile application engineering, quality assurance, and agile project management.',
      'duration': '4 Years (8 Semesters)',
      'code': 'FCSIT',
      'type': 'Software Engineering',
    },
    {
      'short': 'Network Comp.',
      'name': 'Computer Network Programme',
      'icon': Icons.account_tree,
      'description':
          'Explore computer networks, network infrastructure, communication systems, cybersecurity, and network administration.',
      'duration': 'Programme Details',
      'code': 'FCSIT',
      'type': 'Network Computing',
    },
    {
      'short': 'Info. Systems',
      'name': 'Information Systems Programme',
      'icon': Icons.storage,
      'description':
          'Learn about information systems, database management, business technology, information management, and system development.',
      'duration': 'Programme Details',
      'code': 'FCSIT',
      'type': 'Information Systems',
    },
    {
      'short': 'Data Science',
      'name': 'Data Science Programme',
      'icon': Icons.analytics,
      'description':
          'Explore data analysis, statistical methods, data management, machine learning, and data-driven decision making.',
      'duration': 'Programme Details',
      'code': 'FCSIT',
      'type': 'Data Science',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: programmes.length,
      child: Container(
        color: backgroundColor,
        child: Column(
          children: [
            // Programme Tabs
            Container(
              color: Colors.white,
              child: TabBar(
                isScrollable: true,
                labelColor: primaryColor,
                unselectedLabelColor: Colors.grey,
                indicatorColor: primaryColor,
                indicatorWeight: 3,
                tabAlignment: TabAlignment.start,
                tabs: programmes.map((programme) {
                  return Tab(
                    icon: Icon(programme['icon']),
                    text: programme['short'],
                  );
                }).toList(),
              ),
            ),

            // Programme Content
            Expanded(
              child: TabBarView(
                children: programmes.map((programme) {
                  final programmeStudents = students
                      .where(
                        (student) =>
                            student['programme'] == programme['type'],
                      )
                      .toList();

                  return ProgrammeContent(
                    programme: programme,
                    students: programmeStudents,
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Individual Programme Content
class ProgrammeContent extends StatelessWidget {
  final Map<String, dynamic> programme;
  final List<Map<String, String>> students;

  const ProgrammeContent({
    super.key,
    required this.programme,
    required this.students,
  });

  static const Color primaryColor = Color(0xFF4053B5);

  void showAllStudents(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Enrolled Students',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                ...students.map(
                  (student) => ListTile(
                    leading: const CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                    title: Text(student['name']!),
                    subtitle: Text('Matric: ${student['id']}'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 22, 20, 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Programme Information Card
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Programme Icon and Code
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      programme['icon'],
                      color: Colors.white,
                      size: 40,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Text(
                        programme['code'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                // Programme Name
                Text(
                  programme['name'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    height: 1.4,
                  ),
                ),

                const SizedBox(height: 12),

                // Programme Description
                Text(
                  programme['description'],
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    height: 1.6,
                  ),
                ),

                const SizedBox(height: 20),

                // Programme Statistics
                Wrap(
                  spacing: 18,
                  runSpacing: 12,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.people_outline,
                          color: Colors.white,
                          size: 19,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '${students.length} Students',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.access_time,
                          color: Colors.white,
                          size: 19,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          programme['duration'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 40),

          // Enrolled Students Heading
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Enrolled Students',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF252525),
                ),
              ),

              TextButton.icon(
                onPressed: students.isEmpty
                    ? null
                    : () => showAllStudents(context),
                icon: const Icon(
                  Icons.people,
                  size: 18,
                ),
                label: const Text('View All'),
                style: TextButton.styleFrom(
                  foregroundColor: primaryColor,
                ),
              ),
            ],
          ),

          const SizedBox(height: 15),

          // Student Cards
          if (students.isEmpty)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Column(
                children: [
                  Icon(
                    Icons.people_outline,
                    size: 45,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 12),
                  Text(
                    'No student records available.',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            )
          else
            ...students.map((student) {
              return Container(
                margin: const EdgeInsets.only(bottom: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(19),
                  border: Border.all(
                    color: Colors.black.withValues(alpha: 0.05),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),
                      blurRadius: 3,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),

                  leading: CircleAvatar(
                    radius: 23,
                    backgroundColor: primaryColor.withValues(alpha: 0.1),
                    child: const Icon(
                      Icons.person,
                      color: primaryColor,
                      size: 24,
                    ),
                  ),

                  title: Text(
                    student['name']!,
                    style: const TextStyle(
                      color: Color(0xFF252525),
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),

                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      'Matric: ${student['id']} • '
                      '${student['year']} • '
                      'Group ${student['group']}',
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 13,
                        height: 1.5,
                      ),
                    ),
                  ),
                ),
              );
            }),
        ],
      ),
    );
  }
}
