
import 'package:flutter/material.dart';
import 'package:quotefence/themes.dart';

class OrangeButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final bool isOutline;

  const OrangeButton({
    super.key, required this.text, required this.onPressed, 
    this.isLoading = false, this.isOutline = false
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isOutline ? Colors.white : AppTheme.primaryOrange,
          foregroundColor: isOutline ? AppTheme.primaryOrange : Colors.white,
          elevation: isOutline ? 0 : 2,
          side: isOutline ? const BorderSide(color: AppTheme.primaryOrange) : null,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: isLoading 
            ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
            : Text(text, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      ),
    );
  }
}
