import '../../Controller/forget_password_controller/change_password.dart';
import 'package:flutter/material.dart' as material;
import '../../includes.dart';

class _PasswordResetState extends State<PasswordReset> {
  @override
  void initState() {
    super.initState();
    passwordController.text = '';
    confirmPasswordController.text = '';
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return material.Scaffold(
      appBar: material.AppBar(title: const Appbar()),
      body: GestureDetector(
        onTap: () => dismissKeyboard(context),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  SvgPicture.asset(
                    "assets/images/reset_password.svg",
                    width: 366,
                  ),
                  material.Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 350, 0, 0),
                      child: SmartTextField(
                        onChangeFunction: (value) {
                          setState(
                            () => !validatePassword(value)
                                ? isValidPassword = false
                                : isValidPassword = true,
                          );
                        },
                        labelText: 'Password',
                        errorText: 'should be more than 8 letters',
                        obscureText: showPassword,
                        isValidInput: isValidPassword,
                        controllerName: passwordController,
                        textInputAction: TextInputAction.next,
                        iconName: material.Icons.password_outlined,
                        filterTextInput:
                            FilteringTextInputFormatter.allow(passwordRegex),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 365,
                    left: 300,
                    child: DynamicTextButton(
                      onClick: () {
                        setState(() => showPassword = !showPassword);
                      },
                      buttonIcon: showPassword
                          ? CupertinoIcons.eye_fill
                          : CupertinoIcons.eye_slash_fill,
                    ),
                  ),
                  material.Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 450, 0, 0),
                      child: SmartTextField(
                        onChangeFunction: (value) {
                          setState(
                            () => !validatePasswordMatch(
                              value,
                              passwordController.text,
                            )
                                ? isValidPasswordMatch = false
                                : isValidPasswordMatch = true,
                          );
                        },
                        labelText: 'Confirm Password',
                        errorText: 'password does not match',
                        obscureText: showPassword,
                        isValidInput: isValidPasswordMatch,
                        controllerName: confirmPasswordController,
                        iconName: material.Icons.password_outlined,
                        filterTextInput: FilteringTextInputFormatter.allow(passwordRegex),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 465,
                    left: 300,
                    child: DynamicTextButton(
                      onClick: () {
                        setState(() => showPassword = !showPassword);
                      },
                      buttonIcon: showPassword
                          ? CupertinoIcons.eye_fill
                          : CupertinoIcons.eye_slash_fill,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              DynamicButton(
                onClick: () {
                  setState(
                    () => changePassword(
                      context,
                      passwordController.text,
                      confirmPasswordController.text,
                    ),
                  );
                },
                setText: "Change Password",
                isLoading: isLoading,
              ),
               Footer()
            ],
          ),
        ),
      ),
    );
  }
}

class PasswordReset extends StatefulWidget {
  const PasswordReset({super.key});

  @override
  State<PasswordReset> createState() => _PasswordResetState();
}
