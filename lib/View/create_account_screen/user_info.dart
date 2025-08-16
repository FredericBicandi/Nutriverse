import '../../Controller/create_account/.create_account.dart';
import '../../Controller/create_account/user_info.dart';
import 'package:flutter/material.dart';
import '../../includes.dart';

class _UserInfoState extends State<UserInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Appbar()),
      body: GestureDetector(
        onTap: () => dismissKeyboard(context),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ProfileSelector(
                imageProfile: !isSelectedFemale
                    ? const AssetImage("assets/images/Avatar_male.png")
                        as ImageProvider
                    : const AssetImage("assets/images/Avatar_female.png")
                        as ImageProvider,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 35, 10, 0),
                child: Row(
                  spacing: 10,
                  children: [
                    Expanded(
                      child: SmartTextField(
                        onChangeFunction: (value) {
                          String firstname;

                          setState(() {
                            if (firstNameController.text.isNotEmpty &&
                                !(value[0] == value[0].toUpperCase())) {
                              firstname =
                                  "${value[0].toUpperCase()}${value.substring(1)}";
                              firstNameController.text = firstname;
                            }
                            if (!isValidFirstName) {
                              isValidFirstName = validateName(value);
                            }
                          });
                          isValidFirstName
                              ? updateUserInfo("Firstname", value)
                              : updateUserInfo("Firstname", null);
                        },
                        labelText: "Firstname",
                        errorText: "Invalid Name",
                        isValidInput: isValidFirstName,
                        keyboardType: TextInputType.name,
                        controllerName: firstNameController,
                        filterTextInput:
                            FilteringTextInputFormatter.allow(namingRegEx),
                      ),
                    ),
                    Expanded(
                      child: SmartTextField(
                        onChangeFunction: (value) {
                          String lastname;

                          setState(() {
                            if (lastNameController.text.isNotEmpty &&
                                !(value[0] == value[0].toUpperCase())) {
                              lastname =
                                  "${value[0].toUpperCase()}${value.substring(1)}";
                              lastNameController.text = lastname;
                            }
                            if (!isValidLastName) {
                              isValidLastName = validateName(value);
                            }
                          });
                          isValidLastName
                              ? updateUserInfo("Lastname", value)
                              : updateUserInfo("Lastname", null);
                        },
                        labelText: "Last name",
                        errorText: "Invalid Name",
                        isValidInput: isValidLastName,
                        keyboardType: TextInputType.name,
                        controllerName: lastNameController,
                        filterTextInput:
                            FilteringTextInputFormatter.allow(namingRegEx),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 35, 10, 0),
                child: Row(
                  spacing: 10,
                  children: [
                    SmartTextField(
                      width: 270,
                      onTap: () {
                        showCupertinoModalPopup(
                            context: context,
                            builder: (context) {
                              return Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.4,
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text("Done"),
                                    ),
                                    Expanded(
                                      child: CupertinoDatePicker(
                                        mode: CupertinoDatePickerMode.date,
                                        minimumDate: DateTime(1900),
                                        // or whatever earliest DOB you allow
                                        maximumDate: DateTime.now(),
                                        // prevents future years
                                        onDateTimeChanged: (date) {
                                          final picked = DateTime(
                                              date.year, date.month, date.day);
                                          final dobText = "${picked.toLocal()}"
                                              .split(' ')[0];
                                          final age = calculateAge(picked);
                                          final valid =
                                              validateAge(age.toString());

                                          if (!mounted) return;
                                          setState(() {
                                            selectedDate = picked;
                                            dateController.text = dobText;
                                            ageNumberController.text =
                                                age.toString();
                                            isValidAge = valid;
                                          });

                                          updateUserInfo("Age", age.toString());
                                          updateUserInfo(
                                              "DOB",
                                              (dobText.isNotEmpty && valid)
                                                  ? dobText
                                                  : null);
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              );
                            });
                      },
                      errorText: "",
                      readOnly: true,
                      isValidInput: true,
                      labelText: "Select Date of Birth",
                      iconName: CupertinoIcons.calendar,
                      controllerName: dateController,
                    ),
                    Expanded(
                      child: DynamicTextButton(
                        onClick: () {
                          updateUserInfo("Gender", "Male");
                          setState(() {
                            isGenderMalePressed = false;
                            if (isSelectedMale == false) {
                              isSelectedMale = !isSelectedMale;
                              isSelectedFemale = false;
                            }
                          });
                        },
                        iconColor: isSelectedMale ? 0xF36F94E8 : secondaryColor,
                        buttonIcon: Icons.male_rounded,
                        iconSize: 35,
                      ),
                    ),
                    Expanded(
                      child: DynamicTextButton(
                        onClick: () {
                          updateUserInfo("Gender", "Female");
                          setState(() {
                            isGenderFemalePressed = false;
                            if (isSelectedFemale == false) {
                              isSelectedFemale = !isSelectedFemale;
                              isSelectedMale = false;
                            }
                          });
                        },
                        iconColor:
                            isSelectedFemale ? 0xFFE38AA8 : secondaryColor,
                        buttonIcon: Icons.female_rounded,
                        iconSize: 35,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 35, 10, 0),
                child: Row(
                  spacing: 10,
                  children: [
                    Expanded(
                      child: SmartTextField(
                        onChangeFunction: (value) {
                          setState(() => isValidAge = validateAge(value));
                        },
                        readOnly: true,
                        labelText: "Age (Auto)",
                        errorText: "Invalid Age Value",
                        isValidInput: isValidAge,
                        controllerName: ageNumberController,
                        filterTextInput: FilteringTextInputFormatter.digitsOnly,
                      ),
                    ),
                    Expanded(
                      child: Stack(
                        children: [
                          SmartTextField(
                            onChangeFunction: (value) {
                              if (!isValidWeight) {
                                setState(() => isValidWeight =
                                    validateHeightWeight(value));
                              }
                              if (heightNumberController.text.isNotEmpty) {
                                bmiNumberController.text = updateUserBmi(
                                  ageNumberController.text,
                                  heightNumberController.text,
                                  weightNumberController.text,
                                );
                              }
                              isValidWeight
                                  ? updateUserInfo(
                                      "Weight", weightNumberController.text)
                                  : updateUserInfo("Weight", null);
                            },
                            labelText: "Weight",
                            errorText: "Invalid Weight Value",
                            isValidInput: isValidWeight,
                            controllerName: weightNumberController,
                            filterTextInput: FilteringTextInputFormatter.allow(
                                measuresRegEx),
                            keyboardType: const TextInputType.numberWithOptions(
                              signed: false,
                              decimal: true,
                            ),
                          ),
                          Positioned(
                            top: 18,
                            right: 20,
                            child: Text(
                              "(kg)",
                              style: TextStyle(
                                color: Color(fade),
                                letterSpacing: 1.4,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 35, 10, 0),
                child: Row(
                  spacing: 10,
                  children: [
                    Expanded(
                      child: SmartTextField(
                        onChangeFunction: (value) {
                          value.isNotEmpty
                              ? updateUserInfo("BMI", bmiNumberController.text)
                              : updateUserInfo("BMI", null);
                        },
                        readOnly: true,
                        isValidInput: true,
                        labelText: 'Bmi (auto)',
                        errorText: 'Invalid BMI Value',
                        controllerName: bmiNumberController,
                        filterTextInput:
                            FilteringTextInputFormatter.allow(measuresRegEx),
                      ),
                    ),
                    Expanded(
                      child: SmartTextField(
                        onChangeFunction: (value) {
                          if (!isValidHeight) {
                            setState(() =>
                                isValidHeight = validateHeightWeight(value));
                          }
                          bmiNumberController.text = updateUserBmi(
                            ageNumberController.text,
                            heightNumberController.text,
                            weightNumberController.text,
                          );
                          isValidHeight
                              ? updateUserInfo(
                                  "Height", heightNumberController.text)
                              : updateUserInfo("Height", null);
                        },
                        labelText: "Height",
                        errorText: "Invalid Height Value",
                        isValidInput: isValidHeight,
                        controllerName: heightNumberController,
                        filterTextInput:
                            FilteringTextInputFormatter.allow(measuresRegEx),
                        keyboardType: const TextInputType.numberWithOptions(
                          signed: false,
                          decimal: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 35, 10, 0),
                child: Text(
                  "Tell us about your goal",
                  style: TextStyle(
                    fontSize: 30,
                    color: notSelected ? Colors.red : Color(secondaryColor),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 35, 0, 0),
                child: Wrap(
                  children: [
                    DynamicButton(
                      onClick: () {
                        setState(() {
                          if (!goal1) {
                            goal1 = true;
                            goal2 = false;
                            goal3 = false;
                            notSelected = false;
                            updateUserInfo("Goal", "Maintain weight");
                          }
                        });
                      },
                      setSize: 170,
                      setText: 'Maintain weight',
                      bgColor: goal1 ? accentColor : 0xFFFFFFFF,
                      borderColor: goal1 ? 0x00000000 : accentColor,
                      textColor: goal1 ? 0xFFFFFFFF : 0xFF757575,
                    ),
                    const SizedBox(width: 8),
                    DynamicButton(
                      onClick: () {
                        setState(() {
                          if (!goal2) {
                            goal2 = true;
                            goal1 = false;
                            goal3 = false;
                            notSelected = false;
                            updateUserInfo("Goal", "Lose Weight");
                          }
                        });
                      },
                      setSize: 170,
                      setText: 'Lose Weight',
                      bgColor: goal2 ? accentColor : 0xFFFFFFFF,
                      borderColor: goal2 ? 0x00000000 : accentColor,
                      textColor: goal2 ? 0xFFFFFFFF : 0xFF757575,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(80, 25, 0, 0),
                      child: DynamicButton(
                        onClick: () {
                          setState(() {
                            if (!goal3) {
                              goal3 = true;
                              goal1 = false;
                              goal2 = false;
                              notSelected = false;
                              updateUserInfo("Goal", "Gain Weight");
                            }
                          });
                        },
                        setSize: 170,
                        setText: 'Gain Weight',
                        bgColor: goal3 ? accentColor : 0xFFFFFFFF,
                        borderColor: goal3 ? 0x00000000 : accentColor,
                        textColor: goal3 ? 0xFFFFFFFF : 0xFF757575,
                      ),
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 35, 0, 30),
                child: DynamicButton(
                  onClick: isLoading
                      ? null
                      : () async {
                          createAccountHandler(
                            context,
                            (bool value) => setState(() => isValidAge = value),
                            (bool value) =>
                                setState(() => isValidHeight = value),
                            (bool value) =>
                                setState(() => isValidWeight = value),
                            (bool value) =>
                                setState(() => isValidLastName = value),
                            (bool value) =>
                                setState(() => isValidFirstName = value),
                            (bool value) => setState(() => isLoading = value),
                            (bool value) => setState(() => notSelected = value),
                          );
                        },
                  isLoading: isLoading,
                  setText: "Create account",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserInfo extends StatefulWidget {
  const UserInfo({super.key});

  @override
  State<UserInfo> createState() => _UserInfoState();
}
