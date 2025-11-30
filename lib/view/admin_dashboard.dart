
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:quotefence/controllers/admin_controller.dart';
// import 'package:quotefence/themes.dart';

// class AdminDashboard extends StatelessWidget {
//   const AdminDashboard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final authController = Get.find<AdminController>();

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Admin Dashboard"),
//         backgroundColor: Colors.white,
//         foregroundColor: AppTheme.textDark,
//         elevation: 1,
//         actions: [
//           IconButton(onPressed: () => authController.logout(context), icon: const Icon(Icons.logout))
//         ],
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance.collection('leads').orderBy('submitted_at', descending: true).snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) return const Center(child: Text("Error fetching data"));
//           if (snapshot.connectionState == ConnectionState.waiting) return const Center(child: CircularProgressIndicator(color: AppTheme.primaryOrange));

//           final docs = snapshot.data?.docs ?? [];

//           return SingleChildScrollView(
//             padding: const EdgeInsets.all(20),
//             child: Card(
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text("All Submissions (${docs.length})", style: AppTheme.heading),
//                     const SizedBox(height: 20),
//                     SizedBox(
//                       width: double.infinity,
//                       child: DataTable(
//                         headingRowColor: MaterialStateProperty.all(Colors.orange.shade50),
//                         columns: const [
//                           DataColumn(label: Text("Date")),
//                           DataColumn(label: Text("Location")),
//                           DataColumn(label: Text("Timeline")),
//                           DataColumn(label: Text("Name")),
//                           DataColumn(label: Text("Phone")),
//                           DataColumn(label: Text("Job Description")),
//                         ],
//                         rows: docs.map((doc) {
//                           final data = doc.data() as Map<String, dynamic>;
//                           final date = (data['submitted_at'] as Timestamp?)?.toDate().toString().split(' ')[0] ?? '-';
                          
//                           return DataRow(cells: [
//                             DataCell(Text(date)),
//                             DataCell(Text(data['location'] ?? '', style: const TextStyle(fontWeight: FontWeight.bold))),
//                             DataCell(Text(data['timeline'] ?? '')),
//                             DataCell(Text(data['full_name'] ?? '')),
//                             DataCell(Text(data['phone'] ?? '')),
//                             DataCell(SizedBox(width: 200, child: Text(data['description'] ?? '', overflow: TextOverflow.ellipsis))),
//                           ]);
//                         }).toList(),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }


// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:quotefence/controllers/admin_controller.dart';
// import 'package:quotefence/themes.dart';

// class AdminDashboard extends StatelessWidget {
//   const AdminDashboard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final authController = Get.find<AdminController>();
//     final width = MediaQuery.of(context).size.width;

//     // Breakpoints
//     final bool isMobile = width < 700;
//     final bool isTablet = width >= 700 && width < 1100;
//     final bool isDesktop = width >= 1100;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Admin Dashboard"),
//         backgroundColor: Colors.white,
//         foregroundColor: AppTheme.textDark,
//         elevation: 1,
//         actions: [
//           IconButton(
//             onPressed: () => authController.logout(context),
//             icon: const Icon(Icons.logout),
//           )
//         ],
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance
//             .collection('leads')
//             .orderBy('submitted_at', descending: true)
//             .snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             return const Center(child: Text("Error fetching data"));
//           }
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: CircularProgressIndicator(color: AppTheme.primaryOrange),
//             );
//           }

//           final docs = snapshot.data?.docs ?? [];

//           return Padding(
//             padding: EdgeInsets.all(isMobile ? 12 : 20),
//             child: Center(
//               child: ConstrainedBox(
//                 constraints: const BoxConstraints(maxWidth: 1300),
//                 child: Card(
//                   child: Padding(
//                     padding: EdgeInsets.all(isMobile ? 12 : 20),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "All Submissions (${docs.length})",
//                           style: isMobile
//                               ? AppTheme.heading.copyWith(fontSize: 18)
//                               : AppTheme.heading,
//                         ),
//                         const SizedBox(height: 20),

//                         // 🌟 Responsive Table (Scrollable on Mobile)
//                         SingleChildScrollView(
//                           scrollDirection: Axis.horizontal,
//                           child: DataTable(
//                             columnSpacing: isMobile ? 20 : 40,
//                             dataRowMinHeight: isMobile ? 50 : 60,
//                             dataRowMaxHeight: isMobile ? 70 : 80,
//                             headingRowColor:
//                                 MaterialStateProperty.all(Colors.orange.shade50),
//                             columns: const [
//                               DataColumn(label: Text("Date")),
//                               DataColumn(label: Text("Location")),
//                               DataColumn(label: Text("Timeline")),
//                               DataColumn(label: Text("Name")),
//                               DataColumn(label: Text("Phone")),
//                               DataColumn(label: Text("Job Description")),
//                             ],
//                             rows: docs.map((doc) {
//                               final data = doc.data() as Map<String, dynamic>;
//                               final date = (data['submitted_at'] as Timestamp?)
//                                       ?.toDate()
//                                       .toString()
//                                       .split(' ')[0] ??
//                                   '-';

//                               return DataRow(cells: [
//                                 DataCell(Text(date)),
//                                 DataCell(Text(
//                                   data['location'] ?? '',
//                                   style: const TextStyle(
//                                       fontWeight: FontWeight.bold),
//                                 )),
//                                 DataCell(Text(data['timeline'] ?? '')),
//                                 DataCell(Text(data['full_name'] ?? '')),
//                                 DataCell(Text(data['phone'] ?? '')),
//                                 DataCell(SizedBox(
//                                   width: isMobile ? 150 : 250,
//                                   child: Text(
//                                     data['description'] ?? '',
//                                     overflow: TextOverflow.ellipsis,
//                                   ),
//                                 )),
//                               ]);
//                             }).toList(),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotefence/controllers/admin_controller.dart';
import 'package:quotefence/themes.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  // --- SAFE HELPERS (CRASH ROKNE KE LIYE) ---
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

    // Breakpoints
    final bool isMobile = width < 700;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA), // Light Grey Background
      appBar: AppBar(
        title: const Text("Admin Dashboard"),
        backgroundColor: Colors.white,
        foregroundColor: AppTheme.textDark,
        elevation: 1,
        actions: [
          IconButton(
            onPressed: () => authController.logout(context),
            icon: const Icon(Icons.logout, color: Colors.redAccent),
          )
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
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: EdgeInsets.all(isMobile ? 12 : 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header
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

                        // 🌟 SCROLLABLE TABLE AREA (Recycler View Logic) 🌟
                        Expanded(
                          // Expanded zaroori hai taake ye baki bachi hui height le le
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical, // Upar-Neeche Scroll
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal, // Dayen-Bayen Scroll
                              child: DataTable(
                                columnSpacing: isMobile ? 20 : 40,
                                dataRowMinHeight: isMobile ? 50 : 60,
                                dataRowMaxHeight: isMobile ? 70 : 80,
                                headingRowColor:
                                    MaterialStateProperty.all(Colors.orange.shade50),
                                columns: const [
                                  DataColumn(label: Text("Date", style: TextStyle(fontWeight: FontWeight.bold))),
                                  DataColumn(label: Text("Location", style: TextStyle(fontWeight: FontWeight.bold))),
                                  DataColumn(label: Text("Timeline", style: TextStyle(fontWeight: FontWeight.bold))),
                                  DataColumn(label: Text("Name", style: TextStyle(fontWeight: FontWeight.bold))),
                                  DataColumn(label: Text("Phone", style: TextStyle(fontWeight: FontWeight.bold))),
                                  DataColumn(label: Text("Job Description", style: TextStyle(fontWeight: FontWeight.bold))),
                                ],
                                rows: docs.map((doc) {
                                  // Data safely nikal rahe hain
                                  final data = doc.data() as Map<String, dynamic>? ?? {};
                                  final date = _formatDate(data['submitted_at']);

                                  return DataRow(cells: [
                                    DataCell(Text(date)),
                                    DataCell(
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                        decoration: BoxDecoration(
                                            color: Colors.blue.shade50,
                                            borderRadius: BorderRadius.circular(4)),
                                        child: Text(
                                          _safeStr(data['location']),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue.shade900),
                                        ),
                                      ),
                                    ),
                                    DataCell(Text(_safeStr(data['timeline']))),
                                    DataCell(Text(_safeStr(data['full_name']))),
                                    DataCell(Text(_safeStr(data['phone']))),
                                    DataCell(SizedBox(
                                      width: isMobile ? 150 : 300,
                                      child: Text(
                                        _safeStr(data['description']),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                    )),
                                  ]);
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