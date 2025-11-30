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
    double screenWidth = MediaQuery.of(context).size.width;

    bool isMobile = screenWidth < 600;

    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Where's the job located?", style: AppTheme.heading),
          const SizedBox(height: 15),

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

              Expanded(
                child: Text(
                  "We'll instantly match you with verified local fencing pros who are available right now.",
                  style: AppTheme.subHeading,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),

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

          _buildFeatureRow("Free, no-obligation quotes"),
          const SizedBox(height: 10),
          _buildFeatureRow("Compare prices & save money"),
          const SizedBox(height: 10),
          _buildFeatureRow("100% Privacy Guaranteed"),

          const Spacer(),

          Align(
            alignment: isMobile ? Alignment.center : Alignment.centerRight,
            child: SizedBox(
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

  Widget _buildFeatureRow(String text) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 10,
          backgroundColor: Colors.white,
          child: Icon(Icons.check, color: Colors.orange, size: 14),
        ),
        const SizedBox(width: 15),
        Expanded(child: Text(text, style: AppTheme.subHeading)),
      ],
    );
  }
}
