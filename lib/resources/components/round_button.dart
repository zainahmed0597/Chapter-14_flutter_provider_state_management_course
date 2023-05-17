import 'package:flutter/material.dart';
import 'package:flutter_provider_state_management_course/resources/color.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPress;

  const RoundButton(
      {Key? key,
      required this.title,
      this.loading = false,
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
          color: AppColors.buttonColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
            child: loading
                ? const SizedBox(
                    height: 15, width: 15, child: CircularProgressIndicator(
              strokeWidth: 1.5,
              color: AppColors.whiteColor,))
                : Text(
                    title,
                    style: const TextStyle(color: AppColors.whiteColor),
                  )),
      ),
    );
  }
}
