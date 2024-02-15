import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextFormField extends StatelessWidget {
  final void Function(String)? onChanged;
  //final String? labelAr;
  final String? labelEn;
  final bool isPassword;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final void Function()? onTap;
  final int maxLines;
  final List<TextInputFormatter>? inputFormatters;
  const AppTextFormField({
    Key? key,
    required this.onChanged,
    this.isPassword = false,
    required this.validator,
    required this.controller,
    this.prefixIcon,
    //this.labelAr,
    this.labelEn,
    this.suffixIcon,
    this.maxLines = 1,
    this.onTap,
    this.inputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: TextFormField(
        controller: controller,
        validator: validator,
        maxLines: maxLines,
        obscureText: isPassword,
        obscuringCharacter: '*',
        decoration: InputDecoration(
          filled: true,
          suffixIcon: suffixIcon,
          prefixIcon: Icon(prefixIcon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              8,
            ),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
              //borderSide: BorderSide(color: AppColors.mainColor.withOpacity(0.4)),
              ),
          errorBorder: const OutlineInputBorder(
              // borderSide: BorderSide(color: AppColors.mainColor),
              ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 16,
          ),
          hintText: labelEn,
          hintStyle: TextStyle(
              //color: AppColors.secondaryFontColor,
              ),
          errorStyle: TextStyle(
            //color: AppColors.mainColor,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        cursorHeight: 16,
        onChanged: onChanged,
        onTap: onTap,
        inputFormatters: inputFormatters,
      ),
    );
  }
}
