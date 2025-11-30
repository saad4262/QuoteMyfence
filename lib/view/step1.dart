// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:quotefence/controllers/form_controller.dart';
// import 'package:quotefence/custom_button.dart';
// import 'package:quotefence/custom_textfield.dart';
// import 'package:quotefence/themes.dart';

// class Step1Location extends StatelessWidget {
//   final controller = Get.find<FormController>();
//   Step1Location({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(32.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text("Where's the job located?", style: AppTheme.heading),
//           const SizedBox(height: 15),
//           Row(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 20),
//                 child: CircleAvatar(
//                   radius: 10,
//                   child: Icon(Icons.check, color: Colors.orange, size: 10),
//                 ),
//               ),

//               SizedBox(width: 15),
//               Container(
//                 width: 450,
//                 child: Text(
//                   "We'll instantly match you with verified local fencing pros who are available right now.",
//                   style: AppTheme.subHeading,
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 30),

//           Obx(
//             () => CustomTextField(
//               label: "Postcode or Suburb",
//               hint: "e.g. Islamabad, Lahore...",
//               icon: Icons.location_on_outlined,
//               initialValue: controller.location.value,
//               onChanged: (val) => controller.location.value = val,
//             ),
//           ),

//           const SizedBox(height: 20),
//           Container(
//             padding: const EdgeInsets.all(16),
//             decoration: BoxDecoration(
//               color: Colors.orange.shade50,
//               borderRadius: BorderRadius.circular(8),
//               border: Border.all(color: Colors.orange.shade100),
//             ),
//             child: Row(
//               children: [
//                 const Icon(Icons.flash_on, color: AppTheme.primaryOrange),
//                 const SizedBox(width: 12),
//                 const Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Local Expertise",
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       Text(
//                         "Trusted by 1000's of Aussie homeowners looking for fast, reliable fencing quotes.",
//                         style: TextStyle(fontSize: 12),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),

//                     const SizedBox(height: 20),

//           Row(
//             children: [
//               CircleAvatar(
//                 radius: 10,
//                 child: Icon(Icons.check, color: Colors.orange, size: 10),
//               ),

//               SizedBox(width: 15),
//               Container(
//                 width: 450,
//                 child: Text(
//                   "Free, no-obligation quotes",
//                   style: AppTheme.subHeading,
//                 ),
//               ),
//             ],
//           ),


//         const SizedBox(height: 10),

//           Row(
//             children: [
//               CircleAvatar(
//                 radius: 10,
//                 child: Icon(Icons.check, color: Colors.orange, size: 10),
//               ),

//               SizedBox(width: 15),
//               Container(
//                 width: 450,
//                 child: Text(
//                   "Free, no-obligation quotes",
//                   style: AppTheme.subHeading,
//                 ),
//               ),
//             ],
//           ),

//         const SizedBox(height: 10),

//           Row(
//             children: [
//               CircleAvatar(
//                 radius: 10,
//                 child: Icon(Icons.check, color: Colors.orange, size: 10),
//               ),

//               SizedBox(width: 15),
//               Container(
//                 width: 450,
//                 child: Text(
//                   "Free, no-obligation quotes",
//                   style: AppTheme.subHeading,
//                 ),
//               ),
//             ],
//           ),


//           const Spacer(),
//           Align(
//             alignment: .topRight,
//             child: Container(
//               width: 200,
//               child: OrangeButton(
//                 text: "Find Local Pros →",
//                 onPressed: () {
//                   if (controller.location.value.isEmpty) {
//                     Get.snackbar("Required", "Please enter a location");
//                     return;
//                   }
//                   controller.nextStep(context);
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotefence/controllers/form_controller.dart';
import 'package:quotefence/custom_button.dart';
import 'package:quotefence/custom_textfield.dart';
import 'package:quotefence/themes.dart';

class Step1Location extends StatelessWidget {
  final controller = Get.find<FormController>();
  Step1Location({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Screen ki width nikalo
    double screenWidth = MediaQuery.of(context).size.width;
    
    // 2. Check karo ke mobile hai ya nahi (600px se kam matlab mobile)
    bool isMobile = screenWidth < 600;

    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Where's the job located?", style: AppTheme.heading),
          const SizedBox(height: 15),

          // --- Feature 1 (Auto Width Fix) ---
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 4),
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.check, color: Colors.orange, size: 14),
                ),
              ),
              const SizedBox(width: 15),
              
              // 🔥 CRITICAL FIX: 'Container(width: 450)' HATA DIYA
              // 'Expanded' ka matlab: "Jitni jagah bachi hai, wo le lo, lekin screen se bahar mat jao"
              Expanded( 
                child: Text(
                  "We'll instantly match you with verified local fencing pros who are available right now.",
                  style: AppTheme.subHeading,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),

          // --- Input Field ---
          Obx(
            () => CustomTextField(
              label: "Postcode or Suburb",
              hint: "e.g. Islamabad, Lahore...",
              icon: Icons.location_on_outlined,
              initialValue: controller.location.value,
              onChanged: (val) => controller.location.value = val,
            ),
          ),

          const SizedBox(height: 20),

          // --- Orange Box ---
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.orange.shade50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.orange.shade100),
            ),
            child: Row(
              children: [
                const Icon(Icons.flash_on, color: AppTheme.primaryOrange),
                const SizedBox(width: 12),
                
                // 🔥 Yahan bhi Expanded zaroori hai text overflow rokne ke liye
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Local Expertise",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Trusted by 1000's of Aussie homeowners looking for fast, reliable fencing quotes.",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // --- Features ---
          _buildFeatureRow("Free, no-obligation quotes"),
          const SizedBox(height: 10),
          _buildFeatureRow("Compare prices & save money"),
          const SizedBox(height: 10),
          _buildFeatureRow("100% Privacy Guaranteed"),

          const Spacer(),

          // --- BUTTON (RESPONSIVE WIDTH) ---
          Align(
            // Agar Mobile hai to Center, Desktop hai to Right Side
            alignment: isMobile ? Alignment.center : Alignment.centerRight,
            child: SizedBox(
              // 🔥 Logic: 
              // Mobile (380px screen): width = double.infinity (Full Width)
              // Desktop: width = 200px (Fixed Small Button)
              width: isMobile ? double.infinity : 200, 
              child: OrangeButton(
                text: "Find Local Pros →",
                onPressed: () {
                  if (controller.location.value.isEmpty) {
                    Get.snackbar("Required", "Please enter a location");
                    return;
                  }
                  controller.nextStep(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper Widget
  Widget _buildFeatureRow(String text) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 10,
          backgroundColor: Colors.white,
          child: Icon(Icons.check, color: Colors.orange, size: 14),
        ),
        const SizedBox(width: 15),
        // 🔥 Expanded lagaya taake text overflow na kare
        Expanded(
          child: Text(
            text,
            style: AppTheme.subHeading,
          ),
        ),
      ],
    );
  }
}