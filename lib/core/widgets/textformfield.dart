import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constant/color.dart';

class TextFormFieldApp extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool obscure;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final double? borderRadius;
  final Function(String)? onSubmitted;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? textInputFormatter;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final Widget? label;
  final bool readOnly;
  final int? maxLength;
  final int? lines;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final Color? errorBorderColor;
  final Color? filledColor;
  final bool? filled;
  const TextFormFieldApp({
    super.key,
    this.controller,
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.obscure = false,
    this.suffixIcon,
    this.prefixIcon,
    this.borderRadius,
    this.onSubmitted,
    this.onChanged,
    this.textInputFormatter,
    this.textInputAction = TextInputAction.done,
    this.validator,
    this.label,
    this.readOnly = false,
    this.maxLength,
    this.lines = 1,
    this.enabledBorderColor,
    this.errorBorderColor,
    this.focusedBorderColor,
    this.filledColor,
    this.filled,
  });

  @override
  State<TextFormFieldApp> createState() => _TextFormFieldAppState();
}

class _TextFormFieldAppState extends State<TextFormFieldApp> {
  late final ValueNotifier<bool>? _obscureNotifier;

  @override
  void initState() {
    super.initState();
    if (widget.obscure) {
      _obscureNotifier = ValueNotifier(true);
    } else {
      _obscureNotifier = null;
    }
  }

  @override
  void dispose() {
    _obscureNotifier?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_obscureNotifier == null) {
      return _buildTextFormField(obscureText: false);
    }

    // Jika ada notifier, gunakan ValueListenableBuilder
    return ValueListenableBuilder<bool>(
      valueListenable: _obscureNotifier,
      builder: (context, obscureValue, child) {
        return _buildTextFormField(obscureText: obscureValue);
      },
    );
  }

  TextFormField _buildTextFormField({required bool obscureText}) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: obscureText,
      inputFormatters: widget.textInputFormatter,
      textInputAction: widget.textInputAction,
      validator: widget.validator,
      style: const TextStyle(
        fontSize: 14,
        color: Colors.black,
      ),
      readOnly: widget.readOnly,
      maxLength: widget.maxLength,
      maxLines: widget.lines,
      decoration: InputDecoration(
        fillColor: widget.filledColor,
        filled: widget.filled,
        // label: widget.label,
        // alignLabelWithHint: true,
        // floatingLabelBehavior: FloatingLabelBehavior.always,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 0),
          borderSide: BorderSide(
              color: widget.enabledBorderColor ?? ColorApp.primary(50)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 0),
          borderSide: BorderSide(
            color: widget.focusedBorderColor ?? ColorApp.primary(50),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 0),
          borderSide: BorderSide(
            color: widget.errorBorderColor ?? Colors.red,
          ),
        ),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon ??
            (widget.obscure == false
                ? null
                : _buildPasswordToggleIcon(obscureText: obscureText)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          fontSize: 14,
          color: Color(0xff899197),
        ),
      ),
      onFieldSubmitted: widget.onSubmitted,
      onChanged: widget.onChanged,
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
    );
  }

  Semantics _buildPasswordToggleIcon({required bool obscureText}) {
    return Semantics(
      label: obscureText ? 'Tampilkan password' : 'Sembunyikan password',
      button: true,
      child: InkWell(
        onTap: () => _obscureNotifier!.value = !_obscureNotifier.value,
        borderRadius: BorderRadius.circular(50), // Efak ripple lebih baik
        child: Icon(
          obscureText
              ? Icons.visibility_off_outlined
              : Icons.visibility_outlined,
        ),
      ),
    );
  }
}
