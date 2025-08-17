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
      appBar: AppBar(title: const Appbar()),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/images/Email_sent.svg",
                    width: 600,
                    fit: BoxFit.cover,
                  ),
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 525),
                      child: Text(
                        "Verify Your Email!\n",
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                ],
              ),
              const Text(
                "We will send you an email to ",
                style: TextStyle(
                  fontSize: 15,
                  color: CupertinoColors.black,
                ),
              ),
              DynamicTextButton(
                onClick: () => navigateTo(context, const EditEmail()),
                buttonText: emailController.text,
              ),
              const SizedBox(height: 20),
              DynamicButton(
                onClick: () {
                  if (!isLoading) {
                    verification(
                      context,
                      (String value) => '',
                      (bool value) => setState(() => isLoading = value),
                      (bool value) => setState(() => isValidEmail = value),
                    );
                  }
                },
                isLoading: isLoading,
                setText: "Next",
                setIcon: Icons.keyboard_arrow_right_sharp,
              ),
            ],
          ),
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
