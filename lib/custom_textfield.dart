
// import 'package:flutter/material.dart';
// import 'package:quotefence/themes.dart';

// class CustomTextField extends StatelessWidget {
//   final String label;
//   final String hint;
//   final IconData icon;
//   final Function(String) onChanged;
//   final String? initialValue;
//   final int maxLines;
//   final bool isPassword; // <--- New Parameter for Password

//   const CustomTextField({
//     super.key, required this.label, required this.hint, required this.icon,
//     required this.onChanged, this.initialValue, this.maxLines = 1,
//     this.isPassword = false, // Default false rahega
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


import 'package:flutter/material.dart';
import 'package:quotefence/themes.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final String hint;
  final IconData icon;
  final Function(String) onChanged;
  final String? initialValue;
  final int maxLines;
  final bool isPassword; // <--- New Parameter for Password

  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.icon,
    required this.onChanged,
    this.initialValue,
    this.maxLines = 1,
    this.isPassword = false, // Default false rahega
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  // State to track password visibility
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: AppTheme.inputLabel),
        const SizedBox(height: 8),
        TextFormField(
          initialValue: widget.initialValue,
          onChanged: widget.onChanged,
          maxLines: widget.maxLines,
          
          // Logic: Agar password field hai to _isObscured use karo, warna false
          obscureText: widget.isPassword ? _isObscured : false,
          
          decoration: InputDecoration(
            prefixIcon: Icon(widget.icon, color: AppTheme.primaryOrange),
            
            // Logic: Agar password field hai to Eye Icon dikhao
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      _isObscured ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscured = !_isObscured;
                      });
                    },
                  )
                : null,
                
            hintText: widget.hint,
            hintStyle: const TextStyle(color: Colors.grey),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppTheme.primaryOrange, width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
        ),
      ],
    );
  }
}