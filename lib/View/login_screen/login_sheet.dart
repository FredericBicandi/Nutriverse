import 'package:flutter/material.dart' as material;
import '../../Controller/login_controller/login.dart';
import '../../includes.dart';

class LoginSheet extends StatefulWidget {
  const LoginSheet({super.key});

  @override
  State<LoginSheet> createState() => _LoginSheetState();
}

class _LoginSheetState extends State<LoginSheet> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return material.MaterialApp(
      theme: material.ThemeData(
        scaffoldBackgroundColor: Color(scaffoldColor),
        fontFamily: "Avenir",
        useMaterial3: false,
      ),
      debugShowCheckedModeBanner: false,
      home: GestureDetector(
        onTap: () => dismissKeyboard(context),
        child: material.Scaffold(
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset("assets/images/MobileLogin.svg", width: 350),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 305),
                    child: Column(
                      children: [
                        SmartTextField(
                          onChangeFunction: (value) {
                            String email = emailController.text;

                            if (email.toLowerCase() != email)
                              emailController.text = emailController.text.toLowerCase();
                            !isValidEmail ? setState(() => isValidEmail = validateEmail(value)) : null;
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
                        const SizedBox(height: 15),
                        Stack(
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
                        const SizedBox(height: 10),
                        Align(
                          alignment: Alignment.center,
                          child: DynamicTextButton(
                            onClick: () => navigateTo(context, const ForgetPassword()),
                            buttonText: "Forget password?",
                          ),
                        ),
                        const SizedBox(height: 100),
                        Column(
                          children: [
                            DynamicButton(
                              onClick: () async {
                                isLoading ? dismissKeyboard(context) : null;
                                !isLoading ?
                                  loginController(
                                    context,
                                        (bool value) => setState(() => isValidEmail = value),
                                        (bool value) => setState(() =>isValidPassword = value),
                                        (bool value) =>setState(() => isLoading = value)
                                  ) : null;
                              },
                              setText: "Log in",
                              isLoading: isLoading,
                            ),
                            SizedBox(
                              height: 50,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Don't have an account?",
                                    style: TextStyle(color: CupertinoColors.inactiveGray),
                                  ),
                                  DynamicTextButton(
                                    buttonText: "Create one",
                                    onClick: () => navigateTo(context, const CreateAccount()),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
