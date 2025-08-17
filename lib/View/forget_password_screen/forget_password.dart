import '../../Controller/forget_password_controller/forget_password.dart';
import '../../Controller/otp_controller/verify_otp.dart';
import 'package:flutter/material.dart' as material;
import '../../includes.dart';

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  void initState() {
    super.initState();
    emailVerification = false;
  }

  @override
  Widget build(BuildContext context) {
    return material.Scaffold(
        appBar: material.AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Appbar(),
        ),
        body: GestureDetector(
          onTap: () => dismissKeyboard(context),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Center(
                      child: SvgPicture.asset("assets/images/ForgetPassword.svg", width: 350),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 330, 0, 0),
                        child: SmartTextField(
                          onChangeFunction: (value) {
                            if(!isValidEmail){
                              setState(() {
                                isValidEmail=true;
                                errMessage="Invalid email!";
                              });
                            }
                            !isValidEmail
                                ? setState(() => isValidEmail = validateEmail(value))
                                : null;
                          },
                          maxLen: 80,
                          labelText: "Email",
                          errorText: errMessage,
                          isValidInput: isValidEmail,
                          controllerName: emailController,
                          iconName: CupertinoIcons.mail_solid,
                          textInputAction: TextInputAction.next,
                          keyboardType: material.TextInputType.emailAddress,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 180),
                DynamicButton(
                  onClick: () async {
                    if (isLoading) return;
                    validateEmail(emailController.text)
                        ? verification(
                            context, (String value) => setState(() => errMessage = value),
                            (bool value) => setState(() => isLoading = value),
                            (bool value) => setState(() => isValidEmail = value),
                          )
                        : setState(() => isValidEmail = false);
                  },
                  setText: "Reset Password",
                  isLoading: isLoading,
                )
              ],
            ),
          ),
        ));
  }
}

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}
