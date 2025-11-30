// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';
// import 'package:quotefence/controllers/form_controller.dart';
// import 'package:quotefence/custom_button.dart';
// import 'package:quotefence/custom_textfield.dart';
// import 'package:quotefence/themes.dart';

// class Step3Description extends StatelessWidget {
//   final controller = Get.find<FormController>();
//   Step3Description({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(32.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text("Describe your fencing job", style: AppTheme.heading),
//           const SizedBox(height: 10),
//           Text(
//             "The more detail you add, the more accurate your quotes will be.",
//             style: AppTheme.subHeading,
//           ),
//           const SizedBox(height: 30),
//           CustomTextField(
//             label: "Job Description",
//             hint: "e.g. Replace broken wooden fence along the backyard...",
//             icon: Icons.description_outlined,
//             maxLines: 4,
//             onChanged: (val) => controller.description.value = val,
//           ),
//           const SizedBox(height: 10),
//           Text(
//             "Example: Replace 18m timber fence along left boundary. Standard height. No gate.",
//             style: TextStyle(fontSize: 13, color: Color(0xFF718096)),
//           ),
//           const SizedBox(height: 25),
//           Text(
//             "Add a photo Optional — but adding a photo increases quote accuracy by up to 32%.",
//             style: TextStyle(fontSize: 13, color: Color(0xFF718096)),
//           ),
//           const SizedBox(height: 5),

//           Container(
//             width: double.infinity,
//             padding: const EdgeInsets.all(20),
//             decoration: BoxDecoration(
//               border: Border.all(
//                 color: Colors.grey.shade300,
//                 style: BorderStyle.solid,
//               ),
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: const Column(
//               children: [
//                 Icon(Icons.cloud_upload_outlined, size: 40, color: Colors.grey),
//                 SizedBox(height: 8),
//                 Text(
//                   "Click to upload photo (Optional)",
//                   style: TextStyle(color: Colors.grey),
//                 ),
//               ],
//             ),
//           ),
//           const Spacer(),
//           Row(
//             children: [
//               Expanded(
//                 child: OrangeButton(
//                   text: "Back",
//                   isOutline: true,
//                   onPressed: () => controller.previousStep(context),
//                 ),
//               ),
//               const SizedBox(width: 16),
//               Expanded(
//                 child: OrangeButton(
//                   text: "Continue →",
//                   onPressed: () => controller.nextStep(context),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:quotefence/controllers/form_controller.dart';
import 'package:quotefence/custom_button.dart';
import 'package:quotefence/custom_textfield.dart';
import 'package:quotefence/themes.dart';

class Step3Description extends StatelessWidget {
  final controller = Get.find<FormController>();
  Step3Description({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          // ------------------------------------------
          // 1. SCROLLABLE CONTENT AREA
          // ------------------------------------------
          Expanded( // Baqi jagah le le aur scroll kare
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Describe your fencing job", style: AppTheme.heading),
                  const SizedBox(height: 10),
                  Text(
                    "The more detail you add, the more accurate your quotes will be.",
                    style: AppTheme.subHeading,
                  ),
                  const SizedBox(height: 30),
                  
                  // Text Field
                  CustomTextField(
                    label: "Job Description",
                    hint: "e.g. Replace broken wooden fence along the backyard...",
                    icon: Icons.description_outlined,
                    maxLines: 4,
                    onChanged: (val) => controller.description.value = val,
                  ),
                  
                  const SizedBox(height: 10),
                  
                  // Helper Text
                  const Text(
                    "Example: Replace 18m timber fence along left boundary. Standard height. No gate.",
                    style: TextStyle(fontSize: 13, color: Color(0xFF718096)),
                  ),
                  
                  const SizedBox(height: 25),
                  
                  // Photo Helper Text
                  const Text(
                    "Add a photo (Optional) — but adding a photo increases quote accuracy by up to 32%.",
                    style: TextStyle(fontSize: 13, color: Color(0xFF718096)),
                  ),
                  const SizedBox(height: 10),

                  // Upload Box
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.shade300,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Column(
                      children: [
                        Icon(Icons.cloud_upload_outlined, size: 40, color: Colors.grey),
                        SizedBox(height: 8),
                        Text(
                          "Click to upload photo (Optional)",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  
                  // Thora space taake content chipke na
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),

          // ------------------------------------------
          // 2. FIXED BUTTONS (Always Visible)
          // ------------------------------------------
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: OrangeButton(
                  text: "Back",
                  isOutline: true,
                  onPressed: () => controller.previousStep(context),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: OrangeButton(
                  text: "Continue",
                  onPressed: () => controller.nextStep(context),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}