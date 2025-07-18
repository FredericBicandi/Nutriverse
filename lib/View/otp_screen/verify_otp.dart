import '../../Controller/otp_controller/generate.otp.dart';
import '../../Controller/otp_controller/verify_otp.dart';
import 'package:flutter/material.dart' as material;
import '../../Controller/otp_controller/.otp.dart';
import '../../includes.dart';

class _VerifyOtpState extends State<VerifyOtp> {
  @override
  void initState() {
    super.initState();
    resetOtpFields();

    if (remainingSeconds > 0 && timer?.isActive != true) {
      startTimer((int secondsLeft) {
        setState(() => currentSeconds = secondsLeft);
      });
    }
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
                    child: SvgPicture.asset(
                      "assets/images/otp.svg",
                      width: 350,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 250, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SmartTextField(
                          onChangeFunction: (value) {
                            setState(() => otp1Valid = true);
                            if (otpController1.text.isEmpty) return;
                            setState(() => verifyOtpNumbers(value, otp1Valid));
                            FocusScope.of(context).requestFocus(focusNode2);
                          },
                          width: 75,
                          maxLen: 1,
                          labelText: "  #",
                          errorText: "invalid",
                          focusNode: focusNode1,
                          isValidInput: otp1Valid,
                          controllerName: otpController1,
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          filterTextInput:
                              FilteringTextInputFormatter.allow(otpRegex),
                        ),
                        const SizedBox(width: 10),
                        SmartTextField(
                          onChangeFunction: (value) {
                            setState(() => otp2Valid = true);
                            if (otpController2.text.isEmpty) {
                              return FocusScope.of(context)
                                  .requestFocus(focusNode1);
                            }
                            setState(() => verifyOtpNumbers(value, otp2Valid));
                            FocusScope.of(context).requestFocus(focusNode3);
                          },
                          width: 75,
                          maxLen: 1,
                          labelText: "  #",
                          errorText: "invalid",
                          focusNode: focusNode2,
                          isValidInput: otp2Valid,
                          controllerName: otpController2,
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          filterTextInput:
                              FilteringTextInputFormatter.allow(otpRegex),
                        ),
                        const SizedBox(width: 10),
                        SmartTextField(
                          onChangeFunction: (value) {
                            setState(() => otp3Valid = true);
                            if (otpController3.text.isEmpty) {
                              return FocusScope.of(context)
                                  .requestFocus(focusNode2);
                            }
                            setState(() => verifyOtpNumbers(value, otp3Valid));
                            FocusScope.of(context).requestFocus(focusNode4);
                          },
                          width: 75,
                          maxLen: 1,
                          labelText: "  #",
                          errorText: "invalid",
                          focusNode: focusNode3,
                          isValidInput: otp3Valid,
                          controllerName: otpController3,
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          filterTextInput:
                              FilteringTextInputFormatter.allow(otpRegex),
                        ),
                        const SizedBox(width: 10),
                        SmartTextField(
                          onChangeFunction: (value) {
                            setState(() => otp4Valid = true);
                            if (otpController4.text.isEmpty) {
                              return FocusScope.of(context)
                                  .requestFocus(focusNode3);
                            }
                            setState(() => verifyOtpNumbers(value, otp4Valid));
                            dismissKeyboard(context);
                          },
                          width: 75,
                          maxLen: 1,
                          labelText: "  #",
                          errorText: "invalid",
                          focusNode: focusNode4,
                          isValidInput: otp4Valid,
                          controllerName: otpController4,
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          filterTextInput:
                              FilteringTextInputFormatter.allow(otpRegex),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const Text(
                "Check your email.",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              Wrap(
                children: [
                  Text(
                    "We Sent you an OTP verification code to ",
                    style: TextStyle(color: Color(fade)),
                  ),
                  Text(
                    "${emailController.text} ",
                  ),
                ],
              ),
              const SizedBox(height: 60),
              DynamicButton(
                onClick: () {
                  if (isLoading) return;
                  verify(
                    context,
                    (bool value) => setState(() => otp1Valid = value),
                    (bool value) => setState(() => otp2Valid = value),
                    (bool value) => setState(() => otp3Valid = value),
                    (bool value) => setState(() => otp4Valid = value),
                    (bool value) => setState(() => isLoading = value),
                  );
                },
                setText: "Verify ",
                isLoading: isLoading,
                setIcon: material.Icons.verified_user,
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DynamicTextButton(
                    buttonText: "Resend OTP",
                    textColor: color,
                    onClick: () {
                      if (remainingSeconds / 60 == 0.00) {
                        setState(() => color = primaryColor);
                        resendOTP(context);
                      } else {
                        setState(() => color = fade);
                      }
                    },
                  ),
                  Text(
                    "in ${(currentSeconds / 60).toStringAsFixed(2)}",
                    style: TextStyle(
                      color: Color(fade),
                    ),
                  ),
                ],
              ),
              SizedBox(height: sizeOf(context, 0.500)),
              const Footer()
            ],
          ),
        ),
      ),
    );
  }
}

class VerifyOtp extends StatefulWidget {
  const VerifyOtp({super.key});

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}
