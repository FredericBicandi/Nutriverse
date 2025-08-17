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
      appBar: material.AppBar(
        centerTitle: true,
        title: const Appbar(),
      ),
      body: GestureDetector(
        onTap: () => dismissKeyboard(context),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset("assets/images/reset_password.svg", width: 366),
                  material.Padding(
                    padding: const EdgeInsets.only(top: 390),
                    child: Stack(
                      children: [
                        SmartTextField(
                          onChangeFunction: (value) {
                            if (!isValidPassword) setState(() => isValidPassword = true);
                          },
                          maxLen: 120,
                          labelText: "Password",
                          errorText: "incorrect email or password!",
                          obscureText: showPassword,
                          isValidInput: isValidPassword,
                          controllerName: passwordController,
                          iconName: material.Icons.password_outlined,
                          filterTextInput: FilteringTextInputFormatter.allow(passwordRegex),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(290, 0, 0, 0),
                          child: CupertinoButton(
                            onPressed: () => setState(() => showPassword = !showPassword),
                            child: Icon(
                              color: Color(fade),
                              showPassword
                                  ? CupertinoIcons.eye_fill
                                  : CupertinoIcons.eye_slash_fill,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              material.Center(
                child: SmartTextField(
                  onChangeFunction: (value) {
                    setState(() => !validatePasswordMatch(value, passwordController.text)
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
              const SizedBox(height: 180),
              DynamicButton(
                onClick: () {
                changePassword(
                      context,
                      passwordController.text,
                      confirmPasswordController.text,
                      (bool value) =>setState(() => isLoading = value)
                );
                },
                setText: "Change Password",
                isLoading: isLoading,
              ),
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
