import '../../includes.dart';
import 'package:flutter/material.dart' as material;
import '../../Controller/create_account/.create_account.dart';
import '../../Controller/create_account/account_info.dart';

class _CreateAccountState extends State<CreateAccount> {
  @override
  void initState() {
    super.initState();
    isLoading = false;
    isValidEmail = true;
    isValidPassword = true;
  }

  @override
  Widget build(BuildContext context) {
    return material.Scaffold(
      appBar: material.AppBar(
        automaticallyImplyLeading: false,
        title: const Appbar(),
      ),
      body: GestureDetector(
        onTap: () => dismissKeyboard(context),
        child: SingleChildScrollView(
            child: Center(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset("assets/images/SignUp.svg", width: 300),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 365, 0, 0),
                    child: SmartTextField(
                      onChangeFunction: (value) {
                        String email = emailController.text;

                        if (email.toLowerCase() != email)
                          emailController.text =
                              emailController.text.toLowerCase();
                        !isValidEmail
                            ? emailHandler(
                                value,
                                (bool value) =>
                                    setState(() => isValidEmail = value))
                            : null;
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
                ],
              ),
              const SizedBox(height: 15),
              // Password Field
              Stack(
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
                    filterTextInput:
                        FilteringTextInputFormatter.allow(passwordRegex),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(290, 0, 0, 0),
                    child: CupertinoButton(
                      onPressed: () =>
                          setState(() => showPassword = !showPassword),
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
              const SizedBox(height: 15),
              SmartTextField(
                onChangeFunction: (value) {
                  if (!isValidPasswordMatch) {
                    setState(
                      () =>
                          !validatePasswordMatch(value, passwordController.text)
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
              const SizedBox(height: 50),
            ],
          ),
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
