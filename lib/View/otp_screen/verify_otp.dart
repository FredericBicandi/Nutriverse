import '../../includes.dart';
import 'package:flutter/material.dart' as material;
import '../../Controller/otp_controller/.otp.dart';
import '../../Controller/otp_controller/generate.otp.dart';
import '../../Controller/otp_controller/verify_otp.dart';

class _VerifyOtpState extends State<VerifyOtp> {

  Timer? _otpTimer;
  int _secondsLeft = 0;
  Color _resendColor = Color(fade);
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    resetOtpFields();

    _secondsLeft = remainingSeconds;
    if (_secondsLeft > 0) _startTimer();
    else _resendColor = Color(primaryColor);
  }

  void _startTimer([int from = 60]) {

    if (from > 0) _secondsLeft = from;
    _otpTimer?.cancel();
    _otpTimer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (!mounted) return;
      setState(() {
        _secondsLeft--;
        _resendColor = (_secondsLeft <= 0) ? Color(primaryColor) : Color(fade);
      });
      if (_secondsLeft <= 0) t.cancel();
    });
  }

  @override
  void dispose() {
    _otpTimer?.cancel();
    super.dispose();
  }

  Future<void> _verify() async {
    if (_isLoading) return;
    setState(() => _isLoading = true);
    try {
      await verify(
        context,
        (b) => mounted ? setState(() => otp1Valid = b) : null,
        (b) => mounted ? setState(() => otp2Valid = b) : null,
        (b) => mounted ? setState(() => otp3Valid = b) : null,
        (b) => mounted ? setState(() => otp4Valid = b) : null,
        (b) => mounted ? setState(() => _isLoading = b) : null,
      );
      if (!mounted) return;
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  String _mmss(int totalSeconds) {
    final m = (totalSeconds ~/ 60).toString().padLeft(2, '0');
    final s = (totalSeconds % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  @override
  Widget build(BuildContext context) {
    return material.Scaffold(
      appBar: material.AppBar(centerTitle: true, title: const Appbar()),
      body: GestureDetector(
        onTap: () => dismissKeyboard(context),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Center(child: SvgPicture.asset("assets/images/otp.svg", width: 320)),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 240, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _otpBox(
                          controller: otpController1,
                          node: focusNode1,
                          onChanged: (v) {
                            final ok = verifyOtpNumber(v);

                            if (!mounted) return;
                            setState(() => otp1Valid = ok);
                            if (otpController1.text.isNotEmpty) FocusScope.of(context).requestFocus(focusNode2);
                          },
                          isValid: otp1Valid,
                        ),
                        const SizedBox(width: 10),
                        _otpBox(
                          controller: otpController2,
                          node: focusNode2,
                          onChanged: (v) {
                            final ok = verifyOtpNumber(v);

                            if (!mounted) return;
                            setState(() => otp2Valid = ok);
                            if (otpController2.text.isEmpty) FocusScope.of(context).requestFocus(focusNode1);
                            else FocusScope.of(context).requestFocus(focusNode3);
                          },
                          isValid: otp2Valid,
                        ),
                        const SizedBox(width: 10),
                        _otpBox(
                          controller: otpController3,
                          node: focusNode3,
                          onChanged: (v) {
                            final ok = verifyOtpNumber(v);

                            if (!mounted) return;
                            setState(() => otp3Valid = ok);
                            if (otpController3.text.isEmpty) FocusScope.of(context).requestFocus(focusNode2);
                            else FocusScope.of(context).requestFocus(focusNode4);
                          },
                          isValid: otp3Valid,
                        ),
                        const SizedBox(width: 10),
                        _otpBox(
                          controller: otpController4,
                          node: focusNode4,
                          onChanged: (v) {
                            final ok = verifyOtpNumber(v);

                            if (!mounted) return;
                            setState(() => otp4Valid = ok);
                            if (otpController4.text.isEmpty) FocusScope.of(context).requestFocus(focusNode3);
                            else dismissKeyboard(context);
                          },
                          isValid: otp4Valid,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 24),
              const Text("Check your email.", style: TextStyle(fontSize: 18)),
              const SizedBox(height: 8),
              const Text(
                "We sent you an OTP verification code to ",
                style: TextStyle(color: CupertinoColors.black),
              ),
              Text(
                "${emailController.text} ",
                style: TextStyle(color: Color(fade)),
              ),
              const SizedBox(height: 40),
              DynamicButton(
                onClick: _verify,
                setText: "Verify",
                isLoading: _isLoading,
              ),
              const SizedBox(height: 8),
              // ====== Resend + timer ======
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DynamicTextButton(
                    buttonText: "Resend OTP",
                    textColor: _resendColor.value,
                    onClick: () async {
                      if (_secondsLeft > 0) return;
                      if (!mounted) return;
                      setState(() => _resendColor = Color(primaryColor));
                      resendOTP(context);
                      if (!mounted) return;
                      _startTimer(60);
                    },
                  ),
                  const SizedBox(width: 8),
                  Text(
                    _secondsLeft > 0 ? "in ${_mmss(_secondsLeft)}" : "now",
                    style: TextStyle(color: Color(fade)),
                  ),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _otpBox({
    required TextEditingController controller,
    required FocusNode node,
    required ValueChanged<String> onChanged,
    required bool isValid,
  }) {
    return SmartTextField(
      onChangeFunction: onChanged,
      width: 75,
      maxLen: 1,
      labelText: "",
      errorText: "",
      focusNode: node,
      isValidInput: isValid,
      controllerName: controller,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      filterTextInput: FilteringTextInputFormatter.allow(RegExp(r'\d')),
      // if SmartTextField supports textAlign, center it:
      // textAlign: TextAlign.center,
    );
  }
}

class VerifyOtp extends StatefulWidget {
  const VerifyOtp({super.key});

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

