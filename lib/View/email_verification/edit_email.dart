import 'package:nutritracker/Controller/create_account/.create_account.dart';

import '../../Controller/email_verification/email_verification.dart';
import 'package:flutter/material.dart' as material;
import '../../includes.dart';

class _EditEmailState extends State<EditEmail> {
  @override
  void initState() {
    super.initState();
    oldEmail = emailController.text;
    emailErrorText = 'invalid email!';
  }

  @override
  Widget build(BuildContext context) {
    return material.Scaffold(
        appBar: material.AppBar(title: const Appbar()),
        body: GestureDetector(
          onTap: () => dismissKeyboard(context),
          child: SingleChildScrollView(
            child: material.Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  material.Stack(
                    alignment: Alignment.center,
                    children: [
                      SvgPicture.asset("assets/images/EditEmail.svg", width: 500),
                      material.Padding(
                        padding: const EdgeInsets.only(top: 320),
                        child: SmartTextField(
                          onChangeFunction: (value) {
                            String email = emailController.text;

                            if (emailErrorText != 'invalid email!') emailErrorText != 'invalid email!';
                            if (email != email.toLowerCase())
                              emailController.text = emailController.text.toLowerCase();
                            !isValidEmail
                                ? setState(() => isValidEmail = validateEmail(value))
                                : null;
                          },
                          maxLen: 80,
                          labelText: "Email",
                          errorText: emailErrorText,
                          isValidInput: isValidEmail,
                          controllerName: emailController,
                          iconName: CupertinoIcons.mail_solid,
                          textInputAction: TextInputAction.next,
                          keyboardType: material.TextInputType.emailAddress,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 180),
                  DynamicButton(
                    onClick: () async {
                      if (isLoading) return;
                      changeEmail(
                        context,
                        (bool value) => setState(() => isValidEmail = value),
                        (bool value) => setState(() => isLoading = value),
                        (String value) => setState(() => emailErrorText = value),
                      );
                    },
                    setSize: 200,
                    isLoading: isLoading,
                    setText: "Update email",
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ));
  }
}

class EditEmail extends StatefulWidget {
  const EditEmail({super.key});

  @override
  State<EditEmail> createState() => _EditEmailState();
}
