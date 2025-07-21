import '../../Controller/otp_controller/verify_otp.dart';
import 'package:flutter/material.dart';
import '../../includes.dart';

class _EmailVerificationState extends State<EmailVerification> {
  @override
  void initState() {
    super.initState();
    emailVerification = true;
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Appbar(left: 120)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SvgPicture.asset(
                  "assets/images/Email_sent.svg",
                  width: sizeOf(context, 0.9),
                  fit: BoxFit.cover,
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 316, 0, 0),
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
                    padding: const EdgeInsets.fromLTRB(300, 10, 0, 0),
                    child: DynamicTextButton(
                      top: 5,
                      onClick: () => newStackScreen(context, const EditEmail()),
                      buttonText: "edit",
                      iconColor: primaryColor,
                      buttonIcon: CupertinoIcons.pencil_ellipsis_rectangle,
                    ),
                  ),
                  Wrap(
                    children: [
                      const Text(
                        "We sent you an email to ",
                        style: TextStyle(
                          fontSize: 15,
                          color: CupertinoColors.black,
                        ),
                      ),
                      Text(
                        emailController.text,
                        style: const TextStyle(
                          fontSize: 15,
                          color: CupertinoColors.black,
                        ),
                      ),
                      const Text(
                        "to verify your account",
                        style: TextStyle(
                          fontSize: 15,
                          color: CupertinoColors.black,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
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
