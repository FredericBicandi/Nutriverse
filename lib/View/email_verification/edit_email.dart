import '../../Controller/forget_password_controller/forget_password.dart';
import '../../Controller/otp_controller/verify_otp.dart';
import 'package:flutter/material.dart' as material;
import '../../includes.dart';

class _EditEmailState extends State<EditEmail> {
  @override
  Widget build(BuildContext context) {
    return material.Scaffold(
        appBar: material.AppBar(
          elevation: 0,
          title: const Appbar(),
        ),
        body: GestureDetector(
          onTap: () => dismissKeyboard(context),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Center(
                      child: SvgPicture.asset(
                        "assets/images/EditEmail.svg",
                        width: 350,
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 330, 0, 0),
                        child: SmartTextField(
                          onChangeFunction: (value) {
                            !isValidEmail
                                ? setState(
                                    () => isValidEmail = validateEmail(value),
                                  )
                                : null;
                          },
                          maxLen: 80,
                          labelText: "Email",
                          errorText: "invalid email!",
                          isValidInput: isValidEmail,
                          controllerName: emailController,
                          iconName: CupertinoIcons.mail_solid,
                          textInputAction: TextInputAction.next,
                          keyboardType: material.TextInputType.emailAddress,
                        ),
                      ),
                    ),
                    Center(
                      child: material.Padding(
                        padding:
                            EdgeInsets.fromLTRB(0, sizeOf(context, 1.04), 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            DynamicButton(
                              onClick: () async {
                                if (isLoading) return;
                                validateEmail(emailController.text)
                                    ? verification(
                                        context,
                                        (String value) => setState(
                                          () => errMessage = value,
                                        ),
                                        (bool value) => setState(
                                          () => isLoading = value,
                                        ),
                                        (bool value) => setState(
                                          () => isValidEmail = value,
                                        ),
                                      )
                                    : setState(() => isValidEmail = false);
                              },
                              setText: "Send Email Verification",
                              isLoading: isLoading,
                              setIcon: CupertinoIcons.mail,
                            ),
                            SizedBox(height: sizeOf(context, 0.70)),
                            const Footer(),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
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
