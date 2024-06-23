import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kro_trust_task/common/theme/color/kro_colors.dart';
import 'package:kro_trust_task/common/theme/kro_size_config.dart';
import 'package:kro_trust_task/common/theme/typography/kro_body_text_styles.dart';
import 'package:kro_trust_task/common/theme/typography/kro_header_text_styles.dart';
import 'package:kro_trust_task/utils/extensions.dart';

class KroTextField extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool enabled;
  final int? maxLines;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatter;
  final InputController? inputController;

  const KroTextField._({
    super.key,
    this.labelText,
    this.hintText,
    this.maxLines,
    this.enabled = true,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.controller,
    this.obscureText = false,
    this.keyboardType,
    this.inputFormatter,
    this.inputController,
  });

  factory KroTextField.text({
    required InputController inputController,
    required String labelText,
    required String hintText,
    TextInputType? keyboardType,
  }) =>
      KroTextField._(
        labelText: labelText,
        hintText: hintText,
        keyboardType: keyboardType,
        inputController: inputController,
      );

  factory KroTextField.password({
    required InputController inputController,
    required String labelText,
    required String hintText,
  }) =>
      KroTextField._(
        labelText: labelText,
        hintText: hintText,
        obscureText: true,
        inputController: inputController,
      );

  factory KroTextField.textBox({
    required InputController inputController,
    required String labelText,
    required String hintText,
    TextInputType? keyboardType,
  }) =>
      KroTextField._(
        labelText: labelText,
        hintText: hintText,
        obscureText: false,
        keyboardType: keyboardType,
        inputController: inputController,
      );

  @override
  State<KroTextField> createState() => _KroTextFieldState();
}

class _KroTextFieldState extends State<KroTextField> {
  String? errorMessage;
  bool _obscureText = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: KroColors.grey, width: 0.7),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              12.verticalGap,
              Text(
                widget.labelText ?? '',
                style: KroBodyTextStyles.small.copyWith(
                  fontSize: SizeConfig.pxToTextSize(12),
                  height: 13.46.toLineHeight(SizeConfig.pxToTextSize(13.46)),
                ),
              ),
              SizedBox(
                height: 20,
                child: TextFormField(
                  maxLines: widget.maxLines ?? 1,
                  obscureText: _obscureText,
                  obscuringCharacter: '*',
                  controller:
                      widget.inputController?.controller ?? widget.controller,
                  validator: (error) {
                    final err =
                        (widget.inputController?.validator ?? widget.validator)
                            ?.call(error);
                    Future.delayed(const Duration(milliseconds: 100), () {
                      if (mounted) {
                        setState(() {
                          errorMessage = err;
                        });
                      }
                    });
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  style: KroHeaderTextStyles.small,
                  keyboardType: widget.keyboardType,
                  inputFormatters: widget.inputFormatter,
                  enabled: widget.enabled,
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.only(left: 0, bottom: 12, right: 12),
                    prefixIcon: widget.prefixIcon,
                    suffixIcon: widget.obscureText
                        ? IconButton(
                            icon: Icon(
                              _obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: _toggleObscureText,
                          )
                        : widget.suffixIcon,
                    border: InputBorder.none,
                    // hintText: widget.hintText,
                    hintStyle: KroBodyTextStyles.extraSmall.copyWith(
                      color: KroColors.grey.shade400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        2.verticalGap,
        if (errorMessage != null)
          Text(
            errorMessage!,
            style: KroHeaderTextStyles.small.copyWith(
              color: Colors.red,
            ),
          ),
      ],
    );
  }
}

class InputController {
  final TextEditingController controller = TextEditingController();
  final String? Function(String?)? validator;

  InputController({this.validator});

  bool isValid() {
    return validator?.call(controller.text) == null;
  }
}
