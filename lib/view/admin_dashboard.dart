import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotefence/controllers/admin_controller.dart';
import 'package:quotefence/themes.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  String _formatDate(dynamic timestamp) {
    if (timestamp == null) return '-';
    try {
      if (timestamp is Timestamp) {
        return timestamp.toDate().toString().split(' ')[0];
      }
      return timestamp.toString();
    } catch (e) {
      return '-';
    }
  }

  String _safeStr(dynamic value) {
    return value?.toString() ?? '-';
  }

  @override
  Widget build(BuildContext context) {
    final authController = Get.put(AdminController());
    final width = MediaQuery.of(context).size.width;

    final bool isMobile = width < 700;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: const Text("Admin Dashboard"),
        backgroundColor: Colors.white,
        foregroundColor: AppTheme.textDark,
        elevation: 1,
        actions: [
          IconButton(
            onPressed: () => authController.logout(context),
            icon: const Icon(Icons.logout, color: Colors.redAccent),
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('leads')
            .orderBy('submitted_at', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text("Error fetching data"));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: AppTheme.primaryOrange),
            );
          }

          final docs = snapshot.data?.docs ?? [];

          return Padding(
            padding: EdgeInsets.all(isMobile ? 12 : 20),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1300),
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(isMobile ? 12 : 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "All Submissions (${docs.length})",
                              style: isMobile
                                  ? AppTheme.heading.copyWith(fontSize: 18)
                                  : AppTheme.heading,
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),

                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: DataTable(
                                columnSpacing: isMobile ? 20 : 40,
                                dataRowMinHeight: isMobile ? 50 : 60,
                                dataRowMaxHeight: isMobile ? 70 : 80,
                                headingRowColor: MaterialStateProperty.all(
                                  Colors.orange.shade50,
                                ),
                                columns: const [
                                  DataColumn(
                                    label: Text(
                                      "Date",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      "Location",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      "Timeline",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      "Name",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      "Phone",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      "Job Description",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                                rows: docs.map((doc) {
                                  final data =
                                      doc.data() as Map<String, dynamic>? ?? {};
                                  final date = _formatDate(
                                    data['submitted_at'],
                                  );

                                  return DataRow(
                                    cells: [
                                      DataCell(Text(date)),
                                      DataCell(
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 4,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.blue.shade50,
                                            borderRadius: BorderRadius.circular(
                                              4,
                                            ),
                                          ),
                                          child: Text(
                                            _safeStr(data['location']),
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue.shade900,
                                            ),
                                          ),
                                        ),
                                      ),
                                      DataCell(
                                        Text(_safeStr(data['timeline'])),
                                      ),
                                      DataCell(
                                        Text(_safeStr(data['full_name'])),
                                      ),
                                      DataCell(Text(_safeStr(data['phone']))),
                                      DataCell(
                                        SizedBox(
                                          width: isMobile ? 150 : 300,
                                          child: Text(
                                            _safeStr(data['description']),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
