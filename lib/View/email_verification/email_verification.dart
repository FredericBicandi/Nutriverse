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
                  padding: EdgeInsets.fromLTRB(0, 320, 0, 0),
                  child: Center(
                    child: Text(
                      "Verify Your Email!\n",
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
                  Wrap(
                    children: [
                      const Text(
                        "We Will send you an email to ",
                        style: TextStyle(
                          fontSize: 15,
                          color: CupertinoColors.black,
                        ),
                      ),

                      DynamicTextButton(
                        onClick: () => navigateTo(context, const EditEmail()),
                        buttonText: emailController.text,
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
              setIcon: Icons.keyboard_arrow_right_sharp,
            ),
             Footer()
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
