import 'package:flutter/material.dart';

class CustomElevatedButtonWidget extends StatelessWidget {
  const CustomElevatedButtonWidget(
      {super.key,
      required this.height,
      required this.backgroundColor,
      required this.title,
      required this.hasIcon,
      this.iconData,
      required this.onPressed,
      required this.width});
  final double height;
  final double width;
  final Color backgroundColor;
  final String title;
  final bool hasIcon;
  final IconData? iconData;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(5),
          shadowColor: MaterialStateProperty.all(Colors.grey.shade500),
          backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
          shape: MaterialStateProperty.all<OutlinedBorder?>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            hasIcon
                ? Icon(
                    iconData,
                    color: Colors.white,
                    size: 24,
                  )
                : Container(),
            SizedBox(
              width: hasIcon ? 10 : 0,
            ),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
