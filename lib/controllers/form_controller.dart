import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'dart:async';


class FormController extends GetxController {
  // Form Data
  var location = ''.obs;
  var timeline = ''.obs;
  var description = ''.obs;
  var fullName = ''.obs;
  var email = ''.obs;
  var phone = ''.obs;

  // UI State
  var currentStep = 1.obs;
  var isLoading = false.obs;
  var isSubmitted = false.obs;
  
  late PageController pageController;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }

  void initializeFromUrl(String? locParam, int stepParam) {
    if (locParam != null && locParam.isNotEmpty) {
      location.value = locParam;
      print("Auto-filled Location: $locParam");
    }

    int pageIndex = stepParam - 1;
    if (pageIndex > 0 && location.value.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (pageController.hasClients) {
          pageController.jumpToPage(pageIndex);
          currentStep.value = stepParam;
        }
      });
    }
  }

  void nextStep(BuildContext context) {
    if (currentStep.value < 5) {
      currentStep.value++;
      pageController.animateToPage(
        currentStep.value - 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );

      if (currentStep.value == 2) {
         context.go('/step/2?location=${location.value}');
      } else {
         context.go('/step/${currentStep.value}?location=${location.value}');
      }
    }
  }

  void previousStep(BuildContext context) {
    if (currentStep.value > 1) {
      currentStep.value--;
      pageController.animateToPage(
        currentStep.value - 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      context.go('/step/${currentStep.value}?location=${location.value}');
    }
  }

  // --- FIXED SUBMIT FUNCTION ---
// Update inside FormController

// Inside FormController

Future<bool> submitLead() async { // <--- Return Type changed to Future<bool>
  isLoading.value = true;
  try {
    print("Attempting to submit data to Firestore...");
    
    await FirebaseFirestore.instance.collection('leads').add({
      'location': location.value,
      'timeline': timeline.value,
      'description': description.value,
      'full_name': fullName.value,
      'email': email.value,
      'phone': phone.value,
      'submitted_at': FieldValue.serverTimestamp(),
      'status': 'New',
    });
    
    print("✅ Data submitted successfully!");
    isSubmitted.value = true;
    
    // Thora delay taake user ko loading feel ho
    await Future.delayed(const Duration(seconds: 1)); 
    
    return true; // <--- Success : True wapis bhejo

  } catch (e) {
    print("❌ Error Submitting: $e");
    Get.snackbar("Error", "Something went wrong: $e");
    return false; // <--- Fail : False wapis bhejo
  } finally {
    isLoading.value = false;
    // YAHAN SE 'nextStep' HATA DIYA HAI
  }
}
}

