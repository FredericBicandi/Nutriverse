import '../../Controller/create_account/.create_account.dart';
import '../../Controller/create_account/account_info.dart';
import 'package:flutter/material.dart' as material;
import '../../includes.dart';

class _CreateAccountState extends State<CreateAccount> {
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
                        if (emailController.text.toLowerCase() !=
                            emailController.text) {
                          emailController.text = emailController.text.toLowerCase();
                        }
                        if (!isValidEmail) {
                          emailHandler(
                            value,
                            (bool value) =>
                                setState(() => isValidEmail = value),
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
            const SizedBox(height: 15),
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
                    iconName: material.Icons.password_outlined,
                    filterTextInput:
                        FilteringTextInputFormatter.allow(passwordRegex),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(301, 0, 0, 0),
                  child: CupertinoButton(
                    onPressed: () => setState(
                            () => showPassword = !showPassword),
                    child: Icon(
                      color: Color(fade),
                      showPassword
                          ? CupertinoIcons.eye_fill
                          : CupertinoIcons.eye_slash_fill,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            SmartTextField(
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
              iconName: material.Icons.password_outlined,
              filterTextInput:
              FilteringTextInputFormatter.allow(passwordRegex),
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
              setIcon: material.Icons.keyboard_arrow_right,
              isLoading: isLoading,
            ),
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
