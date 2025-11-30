import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

import 'package:quotefence/firebase_options.dart';
import 'package:quotefence/routes/routes.dart';
import 'package:toastification/toastification.dart';
import 'themes.dart';

// Import your generated firebase options

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    print("✅ Firebase initialized successfully!");
  } catch (e) {
    print("❌ Firebase init error: $e");
  }

  runApp(const MyApp());
}

// class FormController extends GetxController {
//   // Form Data
//   var location = ''.obs;
//   var timeline = ''.obs;
//   var description = ''.obs;
//   var fullName = ''.obs;
//   var email = ''.obs;
//   var phone = ''.obs;

//   // UI State
//   var currentStep = 1.obs;
//   var isLoading = false.obs;
//   var isSubmitted = false.obs;
  
//   late PageController pageController;

//   @override
//   void onInit() {
//     super.onInit();
//     pageController = PageController();
//   }

//   void initializeFromUrl(String? locParam, int stepParam) {
//     if (locParam != null && locParam.isNotEmpty) {
//       location.value = locParam;
//       print("Auto-filled Location: $locParam");
//     }

//     int pageIndex = stepParam - 1;
//     if (pageIndex > 0 && location.value.isNotEmpty) {
//       WidgetsBinding.instance.addPostFrameCallback((_) {
//         if (pageController.hasClients) {
//           pageController.jumpToPage(pageIndex);
//           currentStep.value = stepParam;
//         }
//       });
//     }
//   }

//   void nextStep(BuildContext context) {
//     if (currentStep.value < 5) {
//       currentStep.value++;
//       pageController.animateToPage(
//         currentStep.value - 1,
//         duration: const Duration(milliseconds: 300),
//         curve: Curves.easeInOut,
//       );

//       if (currentStep.value == 2) {
//          context.go('/step/2?location=${location.value}');
//       } else {
//          context.go('/step/${currentStep.value}?location=${location.value}');
//       }
//     }
//   }

//   void previousStep(BuildContext context) {
//     if (currentStep.value > 1) {
//       currentStep.value--;
//       pageController.animateToPage(
//         currentStep.value - 1,
//         duration: const Duration(milliseconds: 300),
//         curve: Curves.easeInOut,
//       );
//       context.go('/step/${currentStep.value}?location=${location.value}');
//     }
//   }

//   // --- FIXED SUBMIT FUNCTION ---
// // Update inside FormController

// // Inside FormController

// Future<bool> submitLead() async { // <--- Return Type changed to Future<bool>
//   isLoading.value = true;
//   try {
//     print("Attempting to submit data to Firestore...");
    
//     await FirebaseFirestore.instance.collection('leads').add({
//       'location': location.value,
//       'timeline': timeline.value,
//       'description': description.value,
//       'full_name': fullName.value,
//       'email': email.value,
//       'phone': phone.value,
//       'submitted_at': FieldValue.serverTimestamp(),
//       'status': 'New',
//     });
    
//     print("✅ Data submitted successfully!");
//     isSubmitted.value = true;
    
//     // Thora delay taake user ko loading feel ho
//     await Future.delayed(const Duration(seconds: 1)); 
    
//     return true; // <--- Success : True wapis bhejo

//   } catch (e) {
//     print("❌ Error Submitting: $e");
//     Get.snackbar("Error", "Something went wrong: $e");
//     return false; // <--- Fail : False wapis bhejo
//   } finally {
//     isLoading.value = false;
//     // YAHAN SE 'nextStep' HATA DIYA HAI
//   }
// }
// }




// class AdminController extends GetxController {
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   var isLoading = false.obs;

//   Future<void> login(BuildContext context) async {
//     isLoading.value = true;
//     try {
//       await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: emailController.text.trim(),
//         password: passwordController.text.trim(),
//       );
//       context.go('/admin/dashboard');
//     } catch (e) {
//       Get.snackbar("Login Failed", e.toString(), 
//         snackPosition: SnackPosition.BOTTOM, margin: const EdgeInsets.all(20));
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   void logout(BuildContext context) async {
//     await FirebaseAuth.instance.signOut();
//     context.go('/login');
//   }
// }

// ==========================================
// 3. ROUTING (GO_ROUTER)
// ==========================================

// final _router = GoRouter(
//   // initialLocation: '/step/1',
//     initialLocation: '/login',

//   routes: [
//     GoRoute(
//       path: '/step/:id',
//       builder: (context, state) {
//         final stepId = int.tryParse(state.pathParameters['id'] ?? '1') ?? 1;
//         final locationParam = state.uri.queryParameters['location'];
//         final controller = Get.put(FormController());
//         controller.initializeFromUrl(locationParam, stepId);
//         return OnboardingScreen(stepId: stepId);
//       },
//     ),
//     GoRoute(
//       path: '/login',
//       builder: (context, state) => const LoginScreen(),
//     ),
//     GoRoute(
//       path: '/admin/dashboard',
//       builder: (context, state) {
//         if (FirebaseAuth.instance.currentUser == null) {
//           return const LoginScreen();
//         }
//         return const AdminDashboard();
//       },
//     ),
//   ],
// );

// ==========================================
// 4. THEME & STYLES
// ==========================================

// class AppTheme {
//   static const Color primaryOrange = Color(0xFFFFA500); 
//   static const Color backgroundGrey = Color(0xFFF4F7F6);
//   static const Color textDark = Color(0xFF2D3748);
//   static const Color textGrey = Color(0xFF718096);
  
//   static TextStyle heading = GoogleFonts.poppins(
//     fontSize: 24, fontWeight: FontWeight.w700, color: textDark,
//   );
//   static TextStyle subHeading = GoogleFonts.inter(
//     fontSize: 14, color: textGrey,
//   );
//   static TextStyle inputLabel = GoogleFonts.inter(
//     fontSize: 14, fontWeight: FontWeight.w600, color: textDark,
//   );
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: GetMaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Quote Form',
        theme: ThemeData(
          primaryColor: AppTheme.primaryOrange,
          scaffoldBackgroundColor: AppTheme.backgroundGrey,
          textTheme: GoogleFonts.interTextTheme(),
          colorScheme: ColorScheme.fromSeed(seedColor: AppTheme.primaryOrange),
        ),
        routeInformationParser: router.routeInformationParser,
        routerDelegate: router.routerDelegate,
        routeInformationProvider: router.routeInformationProvider,
      ),
    );
  }
}

// ==========================================
// 5. UI COMPONENTS
// ==========================================

// class OrangeButton extends StatelessWidget {
//   final String text;
//   final VoidCallback onPressed;
//   final bool isLoading;
//   final bool isOutline;

//   const OrangeButton({
//     super.key, required this.text, required this.onPressed, 
//     this.isLoading = false, this.isOutline = false
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       height: 50,
//       child: ElevatedButton(
//         onPressed: isLoading ? null : onPressed,
//         style: ElevatedButton.styleFrom(
//           backgroundColor: isOutline ? Colors.white : AppTheme.primaryOrange,
//           foregroundColor: isOutline ? AppTheme.primaryOrange : Colors.white,
//           elevation: isOutline ? 0 : 2,
//           side: isOutline ? const BorderSide(color: AppTheme.primaryOrange) : null,
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//         ),
//         child: isLoading 
//             ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
//             : Text(text, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
//       ),
//     );
//   }
// }

// class CustomTextField extends StatelessWidget {
//   final String label;
//   final String hint;
//   final IconData icon;
//   final Function(String) onChanged;
//   final String? initialValue;
//   final int maxLines;

//   const CustomTextField({
//     super.key, required this.label, required this.hint, required this.icon,
//     required this.onChanged, this.initialValue, this.maxLines = 1,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(label, style: AppTheme.inputLabel),
//         const SizedBox(height: 8),
//         TextFormField(
//           initialValue: initialValue,
//           onChanged: onChanged,
//           maxLines: maxLines,
//           decoration: InputDecoration(
//             prefixIcon: Icon(icon, color: AppTheme.primaryOrange),
//             hintText: hint,
//             hintStyle: const TextStyle(color: Colors.grey),
//             filled: true,
//             fillColor: Colors.white,
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: BorderSide(color: Colors.grey.shade300),
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: BorderSide(color: Colors.grey.shade300),
//             ),
//             focusedBorder:  OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: BorderSide(color: AppTheme.primaryOrange, width: 2),
//             ),
//             contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
//           ),
//         ),
//       ],
//     );
//   }
// }

// ==========================================
// 6. MAIN ONBOARDING SCREEN
// ==========================================

// class OnboardingScreen extends StatelessWidget {
//   final int stepId;
//   const OnboardingScreen({super.key, required this.stepId});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.find<FormController>();
//     double progress = stepId / 5;

//     return Scaffold(
//       body: Center(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 constraints: const BoxConstraints(maxWidth: 600),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(16),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.05),
//                       blurRadius: 20,
//                       offset: const Offset(0, 10),
//                     ),
//                   ],
//                 ),
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(24.0),
//                       child: Column(
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Row(
//                                 children: [
//                                   const Icon(Icons.access_time, size: 16, color: Colors.grey),
//                                   const SizedBox(width: 5),
//                                   Obx(() => Text("Step ${controller.currentStep.value} of 5", style: AppTheme.subHeading)),
//                                 ],
//                               ),
//                               Text("${(progress * 100).toInt()}% Complete", style: const TextStyle(color: AppTheme.primaryOrange, fontWeight: FontWeight.bold)),
//                             ],
//                           ),
//                           const SizedBox(height: 10),
//                           ClipRRect(
//                             borderRadius: BorderRadius.circular(10),
//                             child: LinearProgressIndicator(
//                               value: progress,
//                               backgroundColor: Colors.orange.shade50,
//                               color: AppTheme.primaryOrange,
//                               minHeight: 8,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const Divider(height: 1),
//                     SizedBox(
//                       height: 500,
//                       child: PageView(
//                         controller: controller.pageController,
//                         physics: const NeverScrollableScrollPhysics(),
//                         children: [
//                           Step1Location(),
//                           Step2Timeline(),
//                           Step3Description(),
//                           Step4Contact(),
//                           Step5Success(),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 20),
//               const Text("Powered by LeadGen", style: TextStyle(color: Colors.grey)),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// ==========================================
// 7. STEPS (1-5)
// ==========================================

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
//           const SizedBox(height: 10),
//           Text("We'll instantly match you with verified local pros.", style: AppTheme.subHeading),
//           const SizedBox(height: 30),
          
//           Obx(() => CustomTextField(
//             label: "Postcode or Suburb",
//             hint: "e.g. Islamabad, Lahore...",
//             icon: Icons.location_on_outlined,
//             initialValue: controller.location.value,
//             onChanged: (val) => controller.location.value = val,
//           )),

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
//                       Text("Local Expertise", style: TextStyle(fontWeight: FontWeight.bold)),
//                       Text("Trusted by 1000's of homeowners looking for fast quotes.", style: TextStyle(fontSize: 12)),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
          
//           const Spacer(),
//           OrangeButton(
//             text: "Find Local Pros →",
//             onPressed: () {
//               if (controller.location.value.isEmpty) {
//                 Get.snackbar("Required", "Please enter a location");
//                 return;
//               }
//               controller.nextStep(context);
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

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
//           Text("Describe your job", style: AppTheme.heading),
//           const SizedBox(height: 10),
//           Text("The more detail you add, the more accurate your quotes will be.", style: AppTheme.subHeading),
//           const SizedBox(height: 30),
//           CustomTextField(
//             label: "Job Description",
//             hint: "e.g. Replace broken wooden fence along the backyard...",
//             icon: Icons.description_outlined,
//             maxLines: 4,
//             onChanged: (val) => controller.description.value = val,
//           ),
//           const SizedBox(height: 20),
//           Container(
//             width: double.infinity,
//             padding: const EdgeInsets.all(20),
//             decoration: BoxDecoration(
//               border: Border.all(color: Colors.grey.shade300, style: BorderStyle.solid),
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: const Column(
//               children: [
//                 Icon(Icons.cloud_upload_outlined, size: 40, color: Colors.grey),
//                 SizedBox(height: 8),
//                 Text("Click to upload photo (Optional)", style: TextStyle(color: Colors.grey)),
//               ],
//             ),
//           ),
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
// }

// class Step4Contact extends StatelessWidget {
// final controller = Get.find<FormController>();
// Step4Contact({super.key});

// @override
// Widget build(BuildContext context) {
//   return Padding(
//     padding: const EdgeInsets.all(32.0),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text("Almost done!", style: AppTheme.heading),
//         const SizedBox(height: 10),
//         Text("Enter your details so pros can send accurate pricing.", style: AppTheme.subHeading),
//         const SizedBox(height: 30),

//         CustomTextField(
//           label: "Full Name",
//           hint: "John Smith",
//           icon: Icons.person_outline,
//           onChanged: (val) => controller.fullName.value = val,
//         ),
//         const SizedBox(height: 16),
//         CustomTextField(
//           label: "Email Address",
//           hint: "john@example.com",
//           icon: Icons.email_outlined,
//           onChanged: (val) => controller.email.value = val,
//         ),
//         const SizedBox(height: 16),
//         CustomTextField(
//           label: "Phone Number",
//           hint: "0300 1234567",
//           icon: Icons.phone_android,
//           onChanged: (val) => controller.phone.value = val,
//         ),

//         const Spacer(),
//         Obx(() => Row(
//           children: [
//             Expanded(child: OrangeButton(text: "Back", isOutline: true, onPressed: () => controller.previousStep(context))),
//             const SizedBox(width: 16),
//             Expanded(child: OrangeButton(
//               text: "Get My Free Quotes →", 
//               isLoading: controller.isLoading.value,
//               onPressed: () async{

//                   bool success = await controller.submitLead(); 
    
//     // 2. Agar sab theek hua, toh UI se navigation karo
//     if (success && context.mounted) {
//       controller.nextStep(context); // <--- Ab ye Context 100% kaam karega
//     }
//               },
//             )),
//           ],
//         ))
//       ],
//     ),
//   );
// }
// }

// class Step5Success extends StatelessWidget {
//   Step5Success({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(32.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             width: 80, height: 80,
//             decoration: BoxDecoration(
//               color: Colors.green.shade100,
//               shape: BoxShape.circle
//             ),
//             child: const Icon(Icons.check, color: Colors.green, size: 40),
//           ),
//           const SizedBox(height: 24),
//           Text("Quotes are being prepared!", style: AppTheme.heading, textAlign: TextAlign.center),
//           const SizedBox(height: 16),
//           const Text(
//             "We've matched you with top-rated contractors in your area.\nYou will receive your quotes shortly via phone/email.",
//             textAlign: TextAlign.center,
//             style: TextStyle(color: Colors.grey, fontSize: 16),
//           ),
//           const SizedBox(height: 40),
//           _buildMatchCard("Local Fence Co.", "4.8", true),
//           _buildMatchCard("TimberLine Fencing", "4.7", true),
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
//         color: Colors.green.shade50.withOpacity(0.3)
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
//                 )
//               ],
//             ),
//           ),
//           const Icon(Icons.check_circle, color: Colors.green),
//         ],
//       ),
//     );
//   }
// }

// ==========================================
// 8. LOGIN & ADMIN DASHBOARD
// ==========================================

// class LoginScreen extends StatelessWidget {
//   const LoginScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(AdminController());

//     return Scaffold(
//       body: Center(
//         child: Container(
//           width: 400,
//           padding: const EdgeInsets.all(32),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(16),
//             boxShadow: const [BoxShadow(blurRadius: 10, color: Colors.black12)],
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const Text("Admin Login", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
//               const SizedBox(height: 30),
//               CustomTextField(
//                 label: "Email", hint: "admin@example.com", icon: Icons.email,
//                 onChanged: (val) => controller.emailController.text = val,
//               ),
//               const SizedBox(height: 16),
//               CustomTextField(
//                 label: "Password", hint: "******", icon: Icons.lock,
//                 onChanged: (val) => controller.passwordController.text = val,
//               ),
//               const SizedBox(height: 30),
//               Obx(() => OrangeButton(
//                 text: "Login", 
//                 isLoading: controller.isLoading.value,
//                 onPressed: () => controller.login(context),
//               )),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

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