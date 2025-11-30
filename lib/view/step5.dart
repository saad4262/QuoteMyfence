// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:quotefence/themes.dart';

// class Step5Success extends StatelessWidget {
//   Step5Success({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           // const SizedBox(height: 24),
//           Text(
//             "We're finding the best fencing contractors near you...",
//             style: AppTheme.heading,
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 5),
//           const Text(
//             "Local verified pros are checking your job details right now.",
//             textAlign: TextAlign.center,
//             style: TextStyle(color: Colors.grey, fontSize: 13),
//           ),
//           const SizedBox(height: 25),

//           Row(
//             mainAxisAlignment: .center,
//             children: [
//               Container(
//                 width: 10,
//                 height: 10,
//                 decoration: BoxDecoration(
//                   color: AppTheme.primaryOrange,
//                   shape: BoxShape.circle,
//                 ),
//               ),
//               const SizedBox(width: 5),

//               Container(
//                 width: 10,
//                 height: 10,
//                 decoration: BoxDecoration(
//                   color: AppTheme.primaryOrange,
//                   shape: BoxShape.circle,
//                 ),
//               ),
//               const SizedBox(width: 5),

//               Container(
//                 width: 10,
//                 height: 10,
//                 decoration: BoxDecoration(
//                   color: AppTheme.primaryOrange,
//                   shape: BoxShape.circle,
//                 ),
//               ),
//             ],
//           ),

//           const SizedBox(height: 40),
//           _buildMatchCard("Local Fence Co.", "4.8", true),
//           _buildMatchCard("TimberLine Fencing", "4.7", true),
//            _buildMatchCard("SecureBound Fencing", "4.7", true),
//         ],
//       ),
//     );
//   }

//   Widget _buildMatchCard(String name, String rating, bool accepted) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 12),
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.green.shade100),
//         borderRadius: BorderRadius.circular(8),
//         color: Colors.green.shade50.withOpacity(0.3),
//       ),
//       child: Row(
//         children: [
//           const Icon(Icons.shield_outlined, color: AppTheme.primaryOrange),
//           const SizedBox(width: 12),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
//                 Row(
//                   children: [
//                     const Icon(Icons.star, size: 14, color: Colors.orange),
//                     Text(" $rating", style: const TextStyle(fontSize: 12)),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           const Icon(Icons.check_circle, color: Colors.green),
//         ],
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:quotefence/themes.dart';

class Step5Success extends StatelessWidget {
  const Step5Success({super.key});

  @override
  Widget build(BuildContext context) {
    // Scroll view isliye taake choti screen par overflow na ho
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            const SizedBox(height: 10),
            // --- 1. HEADING ---
            Text(
              "We're finding the best fencing contractors near you...",
              style: AppTheme.heading.copyWith(fontSize: 22),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              "Local verified pros are checking your job details right now.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            
            const SizedBox(height: 20),

            // --- 2. ORANGE DOTS ---
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildDot(),
                const SizedBox(width: 8),
                _buildDot(),
                const SizedBox(width: 8),
                _buildDot(),
              ],
            ),

            const SizedBox(height: 30),

            // --- 3. CONTRACTOR CARDS ---
            _buildContractorCard(
              name: "Local Fence Co.",
              rating: "4.8",
              reviews: "110 reviews",
              statusText: "Great! Local Fence Co. is available for your job.",
            ),
            _buildContractorCard(
              name: "TimberLine Fencing",
              rating: "4.7",
              reviews: "84 reviews",
              statusText: "Another match! You'll get multiple competitive quotes.",
            ),
            _buildContractorCard(
              name: "SecureBound Fencing",
              rating: "4.9",
              reviews: "96 reviews",
              statusText: "Perfect — 3 local pros are ready to quote.",
            ),

            const SizedBox(height: 20),

            // --- 4. GREEN SUCCESS BOX ---
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFECFDF5), // Light Green bg
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.green.shade200),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.check, color: Colors.white, size: 20),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Your quotes are being prepared now!",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.black87
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "We've matched you with 3 top-rated fencing contractors in your area. You'll receive your quotes shortly.",
                          style: TextStyle(color: Colors.grey[700], fontSize: 13, height: 1.4),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 30),

            // --- 5. TRUST ICONS (Footer) ---
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTrustIcon(Icons.person_outline, "Verified\nProfessionals"),
                _buildTrustIcon(Icons.shield_outlined, "Licensed &\nInsured"),
                _buildTrustIcon(Icons.star_outline, "Reviewed by\nLocals"),
                _buildTrustIcon(Icons.flash_on_outlined, "Fast\nResponse"),
              ],
            ),

            const SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(height: 5,color: Colors.grey.shade400),
            ),
            const SizedBox(height: 20),

            // --- 6. FINAL TEXT ---
            const Text(
              "Your quotes will arrive in the next 3-7 minutes.",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            const SizedBox(height: 5),
            const Text(
              "Keep an eye on your phone.",
              style: TextStyle(color: Colors.grey, fontSize: 13),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // --- WIDGET: ORANGE DOT ---
  Widget _buildDot() {
    return Container(
      width: 10,
      height: 10,
      decoration: const BoxDecoration(
        color: Color(0xFFFF8A00), // Deep Orange
        shape: BoxShape.circle,
      ),
    );
  }

  // --- WIDGET: CONTRACTOR CARD ---
  Widget _buildContractorCard({
    required String name,
    required String rating,
    required String reviews,
    required String statusText,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ]
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left Icon
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF7ED), // Light orange bg
              shape: BoxShape.circle,
              border: Border.all(color: Colors.orange.shade100),
            ),
            child: const Icon(Icons.shield_outlined, color: Color(0xFFFF8A00), size: 24),
          ),
          
          const SizedBox(width: 15),

          // Middle Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.star, size: 14, color: Color(0xFFFF8A00)),
                    Text(" $rating ", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                    Text("• $reviews", style: const TextStyle(color: Colors.grey, fontSize: 13)),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.check_circle_outline, color: Colors.green, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      "Accepted!",
                      style: TextStyle(color: Colors.green[700], fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  statusText,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),

          // Right Icon
          Container(
            margin: const EdgeInsets.only(top: 5),
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.green.shade100)
            ),
            child: const Icon(Icons.check, size: 16, color: Colors.green),
          )
        ],
      ),
    );
  }

  // --- WIDGET: TRUST ICON (BOTTOM) ---
  Widget _buildTrustIcon(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
            color: Color(0xFFFFF7ED),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: const Color(0xFFFF8A00), size: 22),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.black87),
        )
      ],
    );
  }
}