import 'package:flutter/material.dart';

class _StudentRecord {
  final String name;
  final String id;
  final double cgpa;

  const _StudentRecord({
    required this.name,
    required this.id,
    required this.cgpa,
  });
}

class StudentsRecordsPage extends StatefulWidget {
  const StudentsRecordsPage({super.key});

  @override
  State<StudentsRecordsPage> createState() => _StudentsRecordsPageState();
}

class _StudentsRecordsPageState extends State<StudentsRecordsPage> {
  static const Color accentColor = Colors.indigo;
  static const Color backgroundColor = Color(0xFFF5F6FA);

  // NOTE: CGPA values are sample data. Replace with your own.
  static const List<_StudentRecord> _data = [
    _StudentRecord(
        name: 'Caleb Budi Anak Christopher', id: '102483', cgpa: 3.90),
    _StudentRecord(
        name: 'Reynoldson Ganing Anak Alfred Jabu', id: '102936', cgpa: 3.80),
    _StudentRecord(
        name: 'Muhammad Fahdil bin Sulaidi', id: '102733', cgpa: 3.70),
    _StudentRecord(
        name: 'Joeshua Rangga Anak Joseph', id: '102632', cgpa: 3.60),
    _StudentRecord(
        name: 'Matthias Lemada Anak Peter', id: '102673', cgpa: 3.50),
  ];

  late List<_StudentRecord> _records;
  int _sortColumnIndex = 2; // CGPA column
  bool _sortAscending = false; // highest CGPA first

  @override
  void initState() {
    super.initState();
    _records = List.of(_data);
    _sortRecords(_sortColumnIndex, _sortAscending);
  }

  void _sortRecords(int columnIndex, bool ascending) {
    _records.sort((a, b) {
      final int result;
      switch (columnIndex) {
        case 0:
          result = a.name.toLowerCase().compareTo(b.name.toLowerCase());
          break;
        case 1:
          result = a.id.compareTo(b.id);
          break;
        default:
          result = a.cgpa.compareTo(b.cgpa);
      }
      return ascending ? result : -result;
    });
  }

  void _onSort(int columnIndex, bool ascending) {
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
      _sortRecords(columnIndex, ascending);
    });
  }

  Color _cgpaColor(double cgpa) {
    if (cgpa >= 3.67) return Colors.green;
    if (cgpa >= 3.00) return Colors.indigo;
    if (cgpa >= 2.00) return Colors.orange;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    final double average =
        _data.fold<double>(0, (sum, s) => sum + s.cgpa) / _data.length;
    final double highest =
        _data.map((s) => s.cgpa).reduce((a, b) => a > b ? a : b);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // Page Heading
          const Text(
            'Academic Records',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Tap a column heading to sort the records.',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 14,
              height: 1.5,
            ),
          ),

          const SizedBox(height: 22),

          // Summary Cards
          Row(
            children: [
              Expanded(
                child: _buildSummaryCard(
                  icon: Icons.groups,
                  label: 'Students',
                  value: '${_data.length}',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildSummaryCard(
                  icon: Icons.insights,
                  label: 'Avg CGPA',
                  value: average.toStringAsFixed(2),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildSummaryCard(
                  icon: Icons.emoji_events_outlined,
                  label: 'Highest',
                  value: highest.toStringAsFixed(2),
                ),
              ),
            ],
          ),

          const SizedBox(height: 25),

          const Text(
            'Student Records',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 15),

          // Sortable Table
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.black12),
            ),
            clipBehavior: Clip.antiAlias,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                sortColumnIndex: _sortColumnIndex,
                sortAscending: _sortAscending,
                headingRowColor: WidgetStateProperty.all(
                  accentColor.withValues(alpha: 0.08),
                ),
                headingTextStyle: const TextStyle(
                  color: accentColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                dataTextStyle: const TextStyle(
                  color: Colors.black87,
                  fontSize: 13,
                ),
                columnSpacing: 28,
                columns: [
                  DataColumn(label: const Text('Name'), onSort: _onSort),
                  DataColumn(label: const Text('Student ID'), onSort: _onSort),
                  DataColumn(
                    label: const Text('CGPA'),
                    numeric: true,
                    onSort: _onSort,
                  ),
                ],
                rows: _records.map((s) {
                  return DataRow(
                    cells: [
                      DataCell(Text(s.name)),
                      DataCell(Text(s.id)),
                      DataCell(
                        Text(
                          s.cgpa.toStringAsFixed(2),
                          style: TextStyle(
                            color: _cgpaColor(s.cgpa),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),

          const SizedBox(height: 15),
        ],
      ),
    );
  }

  Widget _buildSummaryCard({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        color: accentColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.white, size: 26),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: const TextStyle(color: Colors.white70, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
