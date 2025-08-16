import '../../Controller/email_verification/email_verification.dart';
import 'package:flutter/material.dart' as material;
import '../../includes.dart';

class _EditEmailState extends State<EditEmail> {
  @override
  void initState() {
    super.initState();
    oldEmail = emailController.text;
  }

  @override
  Widget build(BuildContext context) {
    return material.Scaffold(
        appBar: material.AppBar(title: const Appbar()),
        body: GestureDetector(
          onTap: () => dismissKeyboard(context),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Center(
                      child: Image.asset(
                        "assets/images/EditEmail.jpg",
                        width: 350,
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 330, 0, 0),
                        child: SmartTextField(
                          onChangeFunction: (value) {
                            !isValidEmail
                                ? setState(() => isValidEmail = validateEmail(value))
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
                    material.Center(
                      child: material.Padding(
                        padding:
                            EdgeInsets.fromLTRB(0, sizeOf(context, 1.20), 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            DynamicButton(
                              onClick: () async {
                                if (isLoading) return;
                                changeEmail(
                                  context,
                                  (bool value) => setState(() => isValidEmail = value),
                                  (bool value) => setState(() => isLoading = value),
                                );
                              },
                              setSize: 200,
                              isLoading: isLoading,
                              setText: "Update email",
                            ),
                             Footer(setHeight: 170),
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
