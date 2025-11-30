// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';
// import 'package:quotefence/controllers/form_controller.dart';
// import 'package:quotefence/custom_button.dart';
// import 'package:quotefence/themes.dart';

// class Step2Timeline extends StatelessWidget {
//   final controller = Get.find<FormController>();
//   Step2Timeline({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(32.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text("When do you want the job done?", style: AppTheme.heading),
//           SizedBox(width: 15),
//               Container(
//                 width: 500,
//                 child: Text(
//                   "We'll instantly match you with verified local fencing pros who are available right now.",
//                   style: AppTheme.subHeading,
//                 ),
//               ),
//           const SizedBox(height: 30),
//           _buildOption("ASAP — Urgent job", Icons.rocket_launch_outlined),
//           _buildOption("Within 2 weeks — Ready to book soon", Icons.calendar_today_outlined),
//           _buildOption("In a month — Planning ahead", Icons.calendar_month_outlined),
//           _buildOption("Just comparing quotes — No pressure", Icons.chat_bubble_outline),
//           const Spacer(),
//           Row(
//             children: [
//               Expanded(child: OrangeButton(text: "Back", isOutline: true, onPressed: () => controller.previousStep(context))),
//               const SizedBox(width: 16),
//               Expanded(child: OrangeButton(text: "Continue →", onPressed: () => controller.nextStep(context))),
//             ],
//           )
//         ],
//       ),
//     );
//   }

//   Widget _buildOption(String text, IconData icon) {
//     return Obx(() {
//       final isSelected = controller.timeline.value == text;
//       return GestureDetector(
//         onTap: () => controller.timeline.value = text,
//         child: Container(
//           margin: const EdgeInsets.only(bottom: 12),
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//           decoration: BoxDecoration(
//             color: isSelected ? Colors.orange.shade50 : Colors.white,
//             borderRadius: BorderRadius.circular(8),
//             border: Border.all(
//               color: isSelected ? AppTheme.primaryOrange : Colors.grey.shade300, 
//               width: isSelected ? 2 : 1
//             ),
//           ),
//           child: Row(
//             children: [
//               Icon(icon, color: isSelected ? AppTheme.primaryOrange : Colors.grey),
//               const SizedBox(width: 12),
//               Expanded(child: Text(text, style: TextStyle(
//                 fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
//                 color: isSelected ? AppTheme.textDark : AppTheme.textGrey
//               ))),
//             ],
//           ),
//         ),
//       );
//     });
//   }
// }


import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:quotefence/controllers/form_controller.dart';
import 'package:quotefence/custom_button.dart';
import 'package:quotefence/themes.dart';

class Step2Timeline extends StatelessWidget {
  final controller = Get.find<FormController>();
  Step2Timeline({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          // ------------------------------------------
          // 1. SCROLLABLE CONTENT AREA
          // ------------------------------------------
          Expanded( // Ye baqi bachi hui jagah le lega
            child: SingleChildScrollView( // Content zyada hone par scroll karega
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("When do you want the job done?", style: AppTheme.heading),
                  const SizedBox(height: 15),
                  
                  // 🔥 FIX: Container(width: 500) hata diya.
                  // Ab text khud screen ke hisab se adjust hoga.
                  Text(
                    "We'll instantly match you with verified local fencing pros who are available right now.",
                    style: AppTheme.subHeading,
                  ),
                  
                  const SizedBox(height: 30),
                  
                  // Options List
                  _buildOption("ASAP — Urgent job", Icons.rocket_launch_outlined),
                  _buildOption("Within 2 weeks — Ready to book soon", Icons.calendar_today_outlined),
                  _buildOption("In a month — Planning ahead", Icons.calendar_month_outlined),
                  _buildOption("Just comparing quotes — No pressure", Icons.chat_bubble_outline),
                  
                  // Thora extra space neeche taake buttons se chipke na
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),

          // ------------------------------------------
          // 2. FIXED BUTTONS (Always at Bottom)
          // ------------------------------------------
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: OrangeButton(
                  text: "Back", 
                  isOutline: true, 
                  onPressed: () => controller.previousStep(context)
                )
              ),
              const SizedBox(width: 16),
              Expanded(
                child: OrangeButton(
                  text: "Continue", 
                  onPressed: () => controller.nextStep(context)
                )
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildOption(String text, IconData icon) {
    return Obx(() {
      final isSelected = controller.timeline.value == text;
      return GestureDetector(
        onTap: () => controller.timeline.value = text,
        child: Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
            color: isSelected ? Colors.orange.shade50 : Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isSelected ? AppTheme.primaryOrange : Colors.grey.shade300, 
              width: isSelected ? 2 : 1
            ),
          ),
          child: Row(
            children: [
              Icon(icon, color: isSelected ? AppTheme.primaryOrange : Colors.grey),
              const SizedBox(width: 12),
              Expanded(child: Text(text, style: TextStyle(
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? AppTheme.textDark : AppTheme.textGrey
              ))),
            ],
          ),
        ),
      );
    });
  }
}