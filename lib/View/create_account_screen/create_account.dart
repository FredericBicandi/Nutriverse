import '../../Controller/Create_account/.create_account.dart';
import '../../Controller/Create_account/account_info.dart';
import 'package:flutter/material.dart' as material;
import '../../includes.dart';

class _CreateAccountState extends State<CreateAccount> {
  @override
  Widget build(BuildContext context) {
    return material.Scaffold(
      appBar: material.AppBar(title: const Appbar()),
      body: GestureDetector(
        onTap: () => dismissKeyboard(context),
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image and Email Field
            Stack(
              children: [
                Center(
                  child: SvgPicture.asset(
                    "assets/images/SignUp.svg",
                    width: 300,
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 350, 0, 0),
                    child: SmartTextField(
                      onChangeFunction: (value) {
                        if (!isValidEmail) {
                          emailHandler(
                            value,
                            (bool value) => setState(() => isValidEmail = value),
                          );
                        }
                      },
                      labelText: "Email",
                      errorText: emailErrorText,
                      isValidInput: isValidEmail,
                      controllerName: emailController,
                      iconName: CupertinoIcons.mail_solid,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            // Password Field
            Stack(
              children: [
                material.Center(
                  child: SmartTextField(
                    onChangeFunction: (value) {
                      if (!isValidPassword) {
                        setState(
                          () => !validatePassword(value)
                              ? isValidPassword = false
                              : isValidPassword = true,
                        );
                      }
                    },
                    labelText: 'Password',
                    errorText: 'should be more than 8 letters',
                    obscureText: showPassword,
                    isValidInput: isValidPassword,
                    controllerName: passwordController,
                    textInputAction: TextInputAction.next,
                    iconName: CupertinoIcons.padlock_solid,
                    filterTextInput:
                        FilteringTextInputFormatter.allow(passwordRegex),
                  ),
                ),
                Positioned(
                  top: 12,
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
                    padding: const EdgeInsets.fromLTRB(0, 95, 0, 0),
                    child: SmartTextField(
                      onChangeFunction: (value) {
                        if (!isValidPasswordMatch) {
                          setState(
                            () => !validatePasswordMatch(
                              value,
                              passwordController.text,
                            )
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
                      iconName: CupertinoIcons.padlock_solid,
                      filterTextInput: FilteringTextInputFormatter.allow(passwordRegex),
                    ),
                  ),
                ),
                Positioned(
                  top: 105,
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
            const SizedBox(height: 50),
            DynamicButton(
              onClick: () async {
                dismissKeyboard(context);
                nextPageHandler(
                  context,
                  (bool value) => setState(() => isLoading = value),
                  (bool value) => setState(() => isValidEmail = value),
                  (bool value) => setState(() => isValidPassword = value),
                  (bool value) => setState(() => isValidPasswordMatch = value),
                );
              },
              setText: "Next",
              isLoading: isLoading,
            ),
            const SizedBox(height: 30),
            const Footer()
          ],
        )),
      ),
    );
  }
}

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}
