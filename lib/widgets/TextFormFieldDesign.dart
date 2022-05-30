import 'package:flutter/material.dart';

import '../misc/colors.dart';

class TextFormFieldDesgin extends StatelessWidget {
  final String hintText;
  final String labelText;
  const TextFormFieldDesgin({
    Key? key,
    required this.hintText,
    required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      obscureText: false,
      style: TextStyle(
          color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
        labelStyle:
            TextStyle(color: AppColors.mainColor, fontWeight: FontWeight.bold),
        labelText: labelText,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 42,
          vertical: 20,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: AppColors.mainColor, width: 2),
          gapPadding: 10,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: AppColors.mainColor, width: 2),
          gapPadding: 10,
        ),
        suffixIcon: IconButton(
          padding: const EdgeInsets.fromLTRB(0, 12, 12, 12),
          onPressed: () {},
          icon: Icon(
            Icons.person,
            color: AppColors.mainColor,
          ),
        ),
      ),
    );
  }
}

class TextFormFieldPassword extends StatefulWidget {
  final String hintText;
  final String labelText;

  const TextFormFieldPassword({
    Key? key,
    required this.hintText,
    required this.labelText,
  }) : super(key: key);

  @override
  State<TextFormFieldPassword> createState() => _TextFormFieldPasswordState();
}

class _TextFormFieldPasswordState extends State<TextFormFieldPassword> {
  bool checkShow = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      obscureText: checkShow,
      style: TextStyle(
          color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
        labelStyle:
            TextStyle(color: AppColors.mainColor, fontWeight: FontWeight.bold),
        labelText: widget.labelText,
        hintText: widget.hintText,
        hintStyle: TextStyle(color: Colors.grey),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 42,
          vertical: 20,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: AppColors.mainColor, width: 2),
          gapPadding: 10,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: AppColors.mainColor, width: 2),
          gapPadding: 10,
        ),
        suffixIcon: IconButton(
          padding: const EdgeInsets.fromLTRB(0, 12, 12, 12),
          onPressed: () {},
          icon: InkWell(
            onTap: () {
              setState(() {
                checkShow = !checkShow;
              });
            },
            child: Icon(
              (checkShow) ? Icons.visibility : Icons.visibility_off,
              color: AppColors.mainColor,
            ),
          ),
        ),
      ),
    );
  }
}
