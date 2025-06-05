import 'package:breezy_look/config/themes/theme_light.dart';
import 'package:flutter/material.dart';

class TermsAndPrivacyText extends StatelessWidget {
  const TermsAndPrivacyText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: "By signing up, you are creating a BreezyLook\n ",
        style: TextStyle(fontSize: 14),
        children: <TextSpan>[
          TextSpan(
            text: "account and agree to BreezyLook's ",
          ),
          TextSpan(
            text: "Terms \n",
            style: TextStyle(
                color: AppTheme.primaryColor, fontWeight: FontWeight.w800),
          ),
          TextSpan(
            text: " and ",
          ),
          TextSpan(
            text: "Privacy Policy.",
            style: TextStyle(
                color: AppTheme.primaryColor, fontWeight: FontWeight.w800),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
