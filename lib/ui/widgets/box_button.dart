import 'package:flutter/material.dart';

import '../shared/styles.dart';

const double defaultButtonHeight = 48;

class BoxButton extends StatelessWidget {
  final String title;
  final bool disabled;
  final bool busy;
  final void Function()? onTap;
  final double height;
  final double? width;
  final bool outline;
  final double borderRadius;
  final Widget? leading;
  final Color? disabledTextColor;
  final Color? disabledButtonColor;
  final Color? enabledTextColor;
  final Color? enabledButtonColor;

  const BoxButton({
    Key? key,
    required this.title,
    this.disabled = false,
    this.busy = false,
    this.borderRadius = 8,
    this.height = defaultButtonHeight,
    this.width,
    this.disabledButtonColor,
    this.disabledTextColor,
    this.enabledButtonColor,
    this.enabledTextColor,
    this.onTap,
    this.leading,
  })  : outline = false,
        super(key: key);

  const BoxButton.outline({
    required this.title,
    this.borderRadius = 8,
    this.enabledButtonColor,
    this.enabledTextColor,
    this.disabledButtonColor,
    this.height = defaultButtonHeight,
    this.width,
    this.disabledTextColor,
    this.onTap,
    this.leading,
  })  : disabled = false,
        busy = false,
        outline = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        width: width,
        height: height,
        constraints: const BoxConstraints(minWidth: 0, minHeight: 0),
        alignment: Alignment.center,
        decoration: !outline
            ? BoxDecoration(
                color: !disabled ? enabledButtonColor ?? kcPrimaryColor : disabledButtonColor ?? kcMediumGreyColor,
                borderRadius: BorderRadius.circular(borderRadius),
              )
            : BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: enabledButtonColor ?? kcPrimaryColor, width: 1),
              ),
        child: !busy
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (leading != null) leading!,
                  if (leading != null) const SizedBox(width: 5),
                  Text(
                    title,
                    style: bodyStyle.copyWith(
                      fontWeight: !outline ? FontWeight.bold : FontWeight.w400,
                      color: !outline
                          ? !disabled
                              ? enabledTextColor ?? Colors.black
                              : disabledTextColor ?? Colors.black
                          : kcPrimaryColor,
                    ),
                  ),
                ],
              )
            : CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.white),
              ),
      ),
    );
  }
}
