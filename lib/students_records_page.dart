
import 'package:flutter/material.dart';

class StudentsRecordsPage extends StatefulWidget {
  const StudentsRecordsPage({super.key});

  @override
  State<StudentsRecordsPage> createState() =>
      _StudentsRecordsPageState();
}

class _StudentsRecordsPageState extends State<StudentsRecordsPage> {
  int? sortColumnIndex;
  bool sortAscending = true;

  final List<Map<String, String>> students = [
    {
      'name': 'Caleb Budi Anak Christopher',
      'id': '102483',
      'programme': 'Software Engineering',
      'faculty': 'FCSIT',
      'email': '102483@siswa.unimas.my',
      'year': 'Year 3',
      'group': 'G03',
    },
    {
      'name': 'Reynoldson Ganing Anak Alfred Jabu',
      'id': '102936',
      'programme': 'Software Engineering',
      'faculty': 'FCSIT',
      'email': '102936@siswa.unimas.my',
      'year': 'Year 3',
      'group': 'G03',
    },
    {
      'name': 'Muhammad Fahdil bin Sulaidi',
      'id': '102733',
      'programme': 'Software Engineering',
      'faculty': 'FCSIT',
      'email': '102733@siswa.unimas.my',
      'year': 'Year 3',
      'group': 'G03',
    },
    {
      'name': 'Joeshua Rangga Anak Joseph',
      'id': '102632',
      'programme': 'Software Engineering',
      'faculty': 'FCSIT',
      'email': '102632@siswa.unimas.my',
      'year': 'Year 3',
      'group': 'G03',
    },
    {
      'name': 'Matthias Lemada Anak Peter',
      'id': '102673',
      'programme': 'Software Engineering',
      'faculty': 'FCSIT',
      'email': '102673@siswa.unimas.my',
      'year': 'Year 3',
      'group': 'G03',
    },
  ];

  void sort<T>(
    Comparable<T> Function(Map<String, String>) getField,
    int columnIndex,
  ) {
    setState(() {
      if (sortColumnIndex == columnIndex) {
        sortAscending = !sortAscending;
      } else {
        sortColumnIndex = columnIndex;
        sortAscending = true;
      }

      students.sort((a, b) {
        final aValue = getField(a);
        final bValue = getField(b);

        return sortAscending
            ? Comparable.compare(aValue, bValue)
            : Comparable.compare(bValue, aValue);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Student Records',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'View and manage registered student records.',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 14,
              ),
            ),

            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.indigo,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.groups,
                    color: Colors.white,
                    size: 35,
                  ),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Total Registered Students',
                        style: TextStyle(color: Colors.white70),
                      ),
                      Text(
                        '${students.length} Students',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Student Academic Records',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            Card(
              elevation: 1,
              clipBehavior: Clip.antiAlias,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  sortColumnIndex: sortColumnIndex,
                  sortAscending: sortAscending,
                  headingRowColor:
                      WidgetStateProperty.all(
                    Colors.indigo.shade50,
                  ),
                  columns: [
                    DataColumn(
                      label: const Text('Student ID'),
                      onSort: (index, ascending) {
                        sort<String>((s) => s['id']!, index);
                      },
                    ),
                    DataColumn(
                      label: const Text('Student Name'),
                      onSort: (index, ascending) {
                        sort<String>((s) => s['name']!, index);
                      },
                    ),
                    const DataColumn(
                      label: Text('Programme'),
                    ),
                    const DataColumn(
                      label: Text('Year'),
                    ),
                    const DataColumn(
                      label: Text('Group'),
                    ),
                  ],
                  rows: students.map((student) {
                    return DataRow(
                      cells: [
                        DataCell(Text(student['id']!)),
                        DataCell(
                          SizedBox(
                            width: 180,
                            child: Text(student['name']!),
                          ),
                        ),
                        DataCell(Text(student['programme']!)),
                        DataCell(Text(student['year']!)),
                        DataCell(Text(student['group']!)),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),

            const SizedBox(height: 15),

            Text(
              'Showing ${students.length} student records',
              style: const TextStyle(
                color: Colors.indigo,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
