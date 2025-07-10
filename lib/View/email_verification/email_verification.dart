import 'package:flutter/material.dart';
import '../../Controller/otp_controller/verify_otp.dart';
import '../../includes.dart';

class _EmailVerificationState extends State<EmailVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Appbar()),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SvgPicture.asset(
                  "images/Email_sent.svg",
                  width: sizeOf(context, 0.9),
                  fit: BoxFit.cover,
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 400, 0, 0),
                  child: Center(
                    child: Text(
                      "Thanks!\nNow Check your email.",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 16, 0, 0),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(320, 10, 0, 0),
                    child: DynamicTextButton(
                      top: 5,
                      onClick: () => navigateTo(context, const EditEmail()),
                      buttonText: "edit",
                      iconColor: primaryColor,
                      buttonIcon: CupertinoIcons.pencil_ellipsis_rectangle,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 15,
                        color: CupertinoColors.black,
                      ),
                      children: [
                        const TextSpan(text: "We sent you an email to "),
                        TextSpan(
                          text: emailController.text,
                          style: TextStyle(
                            backgroundColor: Color(outline),
                            color: Color(secondaryColor),
                          ),
                        ),
                        const TextSpan(text: " to verify your account."),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 200),
            DynamicButton(
              onClick: () {
                if (!isLoading) {
                  verification(
                    context,
                    (String value) => null,
                    (bool value) => setState(() => isLoading = value),
                    (bool value) => setState(() => isValidEmail = value),
                  );
                }
              },
              isLoading: isLoading,
              setText: "Next",
              setIcon: CupertinoIcons.arrow_right_square,
            ),
            const SizedBox(height: 20),
            const Footer()
          ],
        ),
      ),
    );
  }
}

class EmailVerification extends StatefulWidget {
  const EmailVerification({super.key});

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}
