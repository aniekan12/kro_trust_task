import 'package:flutter/material.dart';
import 'package:kro_trust_task/common/theme/color/kro_colors.dart';
import 'package:kro_trust_task/common/theme/typography/kro_body_text_styles.dart';

class KroTextField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final IconData? icon;
  final bool isPassword;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const KroTextField({
    super.key,
    required this.labelText,
    required this.hintText,
    this.icon,
    this.isPassword = false,
    required this.controller,
    this.validator,
  });

  @override
  _KroTextFieldState createState() => _KroTextFieldState();
}

class _KroTextFieldState extends State<KroTextField> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.labelText.isNotEmpty)
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 4.0, left: 4.0, top: 8.0),
                child: Text(widget.labelText, style: KroBodyTextStyles.medium),
              ),
            TextFormField(
              controller: widget.controller,
              obscureText: _obscureText,
              decoration: InputDecoration(
                hintText: widget.hintText,
                suffixIcon: widget.isPassword
                    ? IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          size: 16,
                        ),
                        onPressed: _togglePasswordVisibility,
                      )
                    : null,
                prefixIcon: widget.icon != null ? Icon(widget.icon) : null,
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: KroColors.grey),
                ),
              ),
              validator: widget.validator,
            ),
          ],
        ),
      ),
    );
  }
}
