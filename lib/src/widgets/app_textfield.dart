import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  AppTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.suffix,
      required this.textInputType});
  TextEditingController controller;
  String hintText;
  Widget suffix;
  TextInputType textInputType;
  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 60,
      // color: ColorConstants.chipGrey,
      child: TextFormField(
        keyboardType: widget.textInputType,
        style: Theme.of(context).textTheme.bodyLarge,
        controller: widget.controller,
        // cursorColor: Colors.black,
        cursorWidth: 4,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
          fillColor: Colors.lightBlueAccent,
          suffix: widget.suffix,
          border: const UnderlineInputBorder(
            borderSide: BorderSide(
              width: 3,
              // color: Colors.black, // Customize the border color here
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              width: 3,
              // color: Colors.black, // Customize the border color here
            ),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              width: 3,
              // color: Colors.black, // Customize the border color here
            ),
          ),
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          hintText: ' ${widget.hintText}',
          hintStyle: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
