
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:quotefence/controllers/admin_controller.dart';
// import 'package:quotefence/custom_button.dart';
// import 'package:quotefence/custom_textfield.dart';

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


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart'; // GoRouter import zaroori hai
import 'package:quotefence/controllers/admin_controller.dart';
import 'package:quotefence/custom_button.dart';
import 'package:quotefence/custom_textfield.dart';

// Agar AppTheme kisi aur file mein hai to import karein, 
// warna neeche wali line hata dein agar error aye.
import 'package:quotefence/main.dart'; 

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AdminController());

    return Scaffold(
      body: Center(
        child: SingleChildScrollView( // Keyboard overflow bachane ke liye
          child: Container(
            width: 400,
            padding: const EdgeInsets.all(32),
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [BoxShadow(blurRadius: 10, color: Colors.black12)],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("Admin Login", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 30),
                
                CustomTextField(
                  label: "Email", 
                  hint: "admin@example.com", 
                  icon: Icons.email,
                  onChanged: (val) => controller.emailController.text = val,
                ),
                const SizedBox(height: 16),
                
                CustomTextField(
                  label: "Password", 
                  hint: "******", 
                  isPassword: true, // <--- Ye add karein
                  icon: Icons.lock,
                  onChanged: (val) => controller.passwordController.text = val,
                ),
                const SizedBox(height: 30),
                
                Obx(() => OrangeButton(
                  text: "Login", 
                  isLoading: controller.isLoading.value,
                  onPressed: () => controller.login(context),
                )),

                // --- NEW BUTTON ADDED HERE ---
                const SizedBox(height: 20),
                const Divider(),
                const SizedBox(height: 10),
                
                TextButton.icon(
                  onPressed: () {
                    // Ye button user ko wapis form par le jayega
                    context.go('/step/1');
                  },
                  icon: const Icon(Icons.arrow_forward, size: 16),
                  label: const Text(
                    "Continue as User (Get a Quote)", 
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)
                  ),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.grey[700], // Grey color taake admin login se mix na ho
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}