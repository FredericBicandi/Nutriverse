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
    isValidPassword=true;
    isValidPasswordMatch=true;
  }

  @override
  Widget build(BuildContext context) {
    return material.Scaffold(
      appBar: material.AppBar(automaticallyImplyLeading: false, title: const Appbar()),
      body: GestureDetector(
        onTap: () => dismissKeyboard(context),
        child: SingleChildScrollView(
          child: material.Center(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset("assets/images/reset_password.svg", width: 366),
                    material.Padding(
                      padding: const EdgeInsets.only(top: 398),
                      child: Stack(
                        children: [
                          SmartTextField(
                            onChangeFunction: (value) => !isValidPassword
                                ? setState(() => isValidPassword = true)
                                : null,
                            maxLen: 120,
                            labelText: "Password",
                            errorText: "password should be at least 8 characters!",
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
                const SizedBox(height: 15),
                SmartTextField(
                  onChangeFunction: (value) {
                    if (!isValidPasswordMatch) {
                      setState(() => !validatePasswordMatch(value, passwordController.text)
                          ? isValidPasswordMatch = false
                          : isValidPasswordMatch = true,
                      );
                    }
                  },
                  labelText: 'Confirm Password',
                  errorText: 'password does not match',
                  obscureText: showPassword,
                  isValidInput: isValidPasswordMatch,
                  controllerName: confirmPasswordController,
                  iconName: material.Icons.password_outlined,
                  filterTextInput: FilteringTextInputFormatter.allow(passwordRegex),
                ),
                const SizedBox(height: 50),
                DynamicButton(
                  onClick: () {
                    !isLoading?
                  changePassword(
                        context,
                        passwordController.text,
                        confirmPasswordController.text,
                        (bool value) =>setState(() => isValidPassword = value),
                        (bool value) =>setState(() => isValidPasswordMatch = value),
                        (bool value) =>setState(() => isLoading = value)
                  ):
                    null;
                  },
                  setText: "Change Password",
                  isLoading: isLoading,
                ),
              ],
            ),
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
