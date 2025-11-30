import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotefence/controllers/form_controller.dart';
import 'package:quotefence/themes.dart';
import 'package:quotefence/view/step1.dart';
import 'package:quotefence/view/step2.dart';
import 'package:quotefence/view/step3.dart';
import 'package:quotefence/view/step4.dart';
import 'package:quotefence/view/step5.dart';

class OnboardingScreen extends StatelessWidget {
  final int stepId;
  const OnboardingScreen({super.key, required this.stepId});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<FormController>();
    double progress = stepId / 5;

    bool isSuccessPage = stepId == 5;

    double screenHeight = MediaQuery.of(context).size.height;

    double cardHeight;
    if (isSuccessPage) {
      cardHeight = screenHeight * 0.95;
    } else {
      cardHeight = screenHeight < 800 ? 550 : screenHeight * 0.75;
    }

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: isSuccessPage
              ? const EdgeInsets.symmetric(horizontal: 10, vertical: 5)
              : const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: isSuccessPage
                ? MainAxisAlignment.start
                : MainAxisAlignment.center,
            children: [
              Container(
                constraints: const BoxConstraints(maxWidth: 600),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    if (!isSuccessPage) ...[
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.access_time,
                                      size: 16,
                                      color: Colors.grey,
                                    ),
                                    const SizedBox(width: 5),
                                    Obx(
                                      () => Text(
                                        "Step ${controller.currentStep.value} of 5",
                                        style: AppTheme.subHeading,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "${(progress * 100).toInt()}% Complete",
                                  style: const TextStyle(
                                    color: AppTheme.primaryOrange,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: LinearProgressIndicator(
                                value: progress,
                                backgroundColor: Colors.orange.shade50,
                                color: AppTheme.primaryOrange,
                                minHeight: 8,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(height: 1),
                    ],

                    Container(
                      height: cardHeight,
                      padding: isSuccessPage ? EdgeInsets.zero : null,
                      child: PageView(
                        controller: controller.pageController,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          Step1Location(),
                          Step2Timeline(),
                          Step3Description(),
                          Step4Contact(),
                          Step5Success(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
