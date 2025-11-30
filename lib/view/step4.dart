import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';
import 'package:quotefence/controllers/form_controller.dart';
import 'package:quotefence/custom_button.dart';
import 'package:quotefence/custom_textfield.dart';
import 'package:quotefence/themes.dart';

class Step4Contact extends StatelessWidget {
  final controller = Get.find<FormController>();
  Step4Contact({super.key});

  void showWebToast(
    BuildContext context,
    String title,
    String description,
    ToastificationType type,
  ) {
    toastification.show(
      context: context,
      type: type,
      style: ToastificationStyle.flat,
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      description: Text(description),
      alignment: Alignment.topRight,
      autoCloseDuration: const Duration(seconds: 4),
      borderRadius: BorderRadius.circular(12),
      boxShadow: const [
        BoxShadow(
          color: Color(0x07000000),
          blurRadius: 16,
          offset: Offset(0, 16),
          spreadRadius: 0,
        ),
      ],
      showProgressBar: true,
      primaryColor: type == ToastificationType.error
          ? Colors.red
          : Colors.green,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Almost done! Your quotes are just minutes away.",
                    style: AppTheme.heading,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Enter your details so your fencing pros can send accurate pricing.",
                    style: AppTheme.subHeading,
                  ),
                  const SizedBox(height: 30),

                  CustomTextField(
                    label: "Full Name",
                    hint: "John Smith",
                    icon: Icons.person_outline,
                    onChanged: (val) => controller.fullName.value = val,
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    label: "Email Address",
                    hint: "john@example.com",
                    icon: Icons.email_outlined,
                    onChanged: (val) => controller.email.value = val,
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    label: "Phone Number",
                    hint: "0400 123 456",
                    icon: Icons.phone_android,
                    onChanged: (val) => controller.phone.value = val,
                  ),

                  const SizedBox(height: 30),
                  Row(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          const Icon(
                            Icons.shield_outlined,
                            color: Colors.orange,
                            size: 22,
                          ),
                          const Icon(
                            Icons.check,
                            color: Colors.orange,
                            size: 10,
                          ),
                        ],
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Row(
                          children: [
                            const Icon(
                              Icons.check,
                              color: Colors.deepPurple,
                              size: 15,
                              shadows: [
                                Shadow(
                                  color: Colors.deepPurple,
                                  blurRadius: 2.0,
                                  offset: Offset(0.5, 0.5),
                                ),
                              ],
                            ),
                            const SizedBox(width: 8),
                            Flexible(
                              child: Text(
                                "Zero spam — ever",
                                style: AppTheme.subHeading,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          const Icon(
                            Icons.shield_outlined,
                            color: Colors.orange,
                            size: 22,
                          ),
                          const Icon(
                            Icons.check,
                            color: Colors.orange,
                            size: 10,
                          ),
                        ],
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Row(
                          children: [
                            const Icon(
                              Icons.check,
                              color: Colors.deepPurple,
                              size: 15,
                              shadows: [
                                Shadow(
                                  color: Colors.deepPurple,
                                  blurRadius: 2.0,
                                  offset: Offset(0.5, 0.5),
                                ),
                              ],
                            ),
                            const SizedBox(width: 8),
                            Flexible(
                              child: Text(
                                "Your details are private and secure",
                                style: AppTheme.subHeading,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),

          const SizedBox(height: 10),
          Obx(
            () => Row(
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
                    text: "Get My Free Quotes →",
                    isLoading: controller.isLoading.value,
                    onPressed: () async {
                      String name = controller.fullName.value.trim();
                      String email = controller.email.value.trim();
                      String phone = controller.phone.value.trim();

                      if (name.isEmpty) {
                        showWebToast(
                          context,
                          "Name Required",
                          "Please enter your full name.",
                          ToastificationType.error,
                        );
                        return;
                      }

                      if (!GetUtils.isEmail(email)) {
                        showWebToast(
                          context,
                          "Invalid Email",
                          "Please enter a valid email address.",
                          ToastificationType.error,
                        );
                        return;
                      }

                      if (phone.isEmpty) {
                        showWebToast(
                          context,
                          "Phone Required",
                          "Please enter your phone number.",
                          ToastificationType.error,
                        );
                        return;
                      }

                      if (!phone.startsWith('0')) {
                        showWebToast(
                          context,
                          "Invalid Format",
                          "Phone number must start with '0'.",
                          ToastificationType.error,
                        );
                        return;
                      }

                      if (phone.length != 10 || !phone.isNumericOnly) {
                        showWebToast(
                          context,
                          "Invalid Length",
                          "Phone number must be exactly 10 digits.",
                          ToastificationType.error,
                        );
                        return;
                      }

                      bool success = await controller.submitLead();

                      if (success && context.mounted) {
                        controller.nextStep(context);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
