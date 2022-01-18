import 'package:flutter/material.dart';
import 'package:flutter_app/src/resources/dimens.dart';
import 'package:google_fonts/google_fonts.dart';

class DynamicTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final FocusNode? focusNode;
  final bool? autocorrect;
  final bool? autofocus;
  final bool? enableSuggestions;
  final bool? obscureText;
  final EdgeInsetsGeometry? contentPadding;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Function(dynamic v)? onSubmitted;

  const DynamicTextField({
    Key? key,
    this.controller,
    this.hintText = '',
    this.focusNode,
    this.autocorrect = true,
    this.autofocus = false,
    this.obscureText = false,
    this.enableSuggestions = true,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 14),
    this.keyboardType = TextInputType.text,
    this.textInputAction,
    this.onSubmitted,
  }) : super(key: key);

  @override
  _DynamicTextFieldState createState() => _DynamicTextFieldState();
}

class _DynamicTextFieldState extends State<DynamicTextField> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(Dimens.borderRadius),
      child: TextField(
        controller: widget.controller,
        focusNode: widget.focusNode,
        autocorrect: widget.autocorrect!,
        autofocus: widget.autofocus!,
        keyboardType: widget.keyboardType,
        enableSuggestions: widget.enableSuggestions!,
        obscureText: widget.obscureText!,
        textInputAction: widget.textInputAction,
        onSubmitted: widget.onSubmitted,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: widget.hintText,
          hintStyle: GoogleFonts.nunito(),
          contentPadding: widget.contentPadding,
          filled: true,
        ),
      ),
    );
  }
}
