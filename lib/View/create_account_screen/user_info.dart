import '../../Controller/create_account/.create_account.dart';
import '../../Controller/create_account/user_info.dart';
import 'package:flutter/material.dart';
import '../../includes.dart';

class _UserInfoState extends State<UserInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Appbar()),
      body: GestureDetector(
        onTap: () => dismissKeyboard(context),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ProfileSelector(
                imageProfile: !isSelectedFemale
                    ? const AssetImage("assets/images/Avatar_male.png") as ImageProvider
                    : const AssetImage("assets/images/Avatar_female.png") as ImageProvider,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 35, 10, 0),
                child: Row(
                  spacing: 10,
                  children: [
                    Expanded(
                      child: SmartTextField(
                        onChangeFunction: (value) {
                          String firstname= firstNameController.text;
                          String temp= firstNameController.text;

                          setState(() {
                            if (firstname.isNotEmpty && !(value[0] == value[0].toUpperCase())) {
                              temp = "${value[0].toUpperCase()}${value.substring(1)}";
                              firstNameController.text = temp;
                            }
                            if (!isValidFirstName) isValidFirstName = validateName(value);
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
                        filterTextInput: FilteringTextInputFormatter.allow(namingRegEx),
                      ),
                    ),
                    Expanded(
                      child: SmartTextField(
                        onChangeFunction: (value) {
                          String lastname=lastNameController.text;
                          String temp;

                          setState(() {
                            if (lastname.isNotEmpty && !(value[0] == value[0].toUpperCase())) {
                              temp = "${value[0].toUpperCase()}${value.substring(1)}";
                              lastNameController.text = temp;
                            }
                            if (!isValidLastName) isValidLastName = validateName(value);
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
                        filterTextInput: FilteringTextInputFormatter.allow(namingRegEx),
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
                        width: 270,
                        onTap: () {
                          showCupertinoModalPopup(
                            context: context,
                            builder: (context) {
                              final now = DateTime.now();
                              final maxDate = DateTime(now.year, now.month, now.day);
                              final initial = (selectedDate != null && selectedDate!.isBefore(maxDate))
                                  ? selectedDate!
                                  : maxDate;

                              return Container(
                                height: MediaQuery.of(context).size.height * 0.4,
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
                                        maximumDate: maxDate,
                                        initialDateTime: initial,
                                        onDateTimeChanged: (date) {
                                          final picked = DateTime(date.year, date.month, date.day);
                                          final dobText = "${picked.toLocal()}".split(' ')[0];
                                          final age = calculateAge(picked);
                                          final valid = validateAge(age.toString());

                                          if (!mounted) return;
                                          setState(() {
                                            selectedDate = picked;
                                            dateController.text = dobText;
                                            ageNumberController.text = age.toString();
                                            isValidAge = valid;
                                          });

                                          updateUserInfo("Age", age.toString());
                                          updateUserInfo("DOB", (dobText.isNotEmpty && valid) ? dobText : null);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        errorText: "",
                        readOnly: true,
                        isValidInput: true,
                        labelText: "Select Date of Birth",
                        iconName: CupertinoIcons.calendar,
                        controllerName: dateController,
                      ),
                    ),
                    DynamicTextButton(
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
                      iconSize: 35,
                      buttonIcon: Icons.male_rounded,
                      iconColor: isSelectedMale ? 0xF36F94E8 : secondaryColor,
                    ),
                    DynamicTextButton(
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
                      iconSize: 35,
                      buttonIcon: Icons.female_rounded,
                      iconColor: isSelectedFemale ? 0xFFE38AA8 : secondaryColor,
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
                        onChangeFunction: (value) => setState(() => isValidAge = validateAge(value)),
                        readOnly: true,
                        labelText: "Age (auto)",
                        errorText: "Invalid Age Value",
                        isValidInput: isValidAge,
                        controllerName: ageNumberController,
                        filterTextInput: FilteringTextInputFormatter.digitsOnly,
                      ),
                    ),
                    Expanded(
                      child: SmartTextField(
                        onChangeFunction: (value) {
                          String height = heightNumberController.text;
                          String weight = weightNumberController.text;
                          String age = ageNumberController.text;

                          if (!isValidWeight) setState(() => isValidWeight = validateHeightWeight(value));
                          if (height.isNotEmpty) bmiNumberController.text = updateUserBmi(age, height, weight);

                          isValidWeight ? updateUserInfo("Weight", weight) : updateUserInfo("Weight", null);
                        },
                        labelText: "Weight (kg)",
                        errorText: "Invalid Weight Value",
                        isValidInput: isValidWeight,
                        controllerName: weightNumberController,
                        filterTextInput: FilteringTextInputFormatter.allow(measuresRegEx),
                        keyboardType: const TextInputType.numberWithOptions(signed: false, decimal: true),
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
                        filterTextInput: FilteringTextInputFormatter.allow(measuresRegEx),
                      ),
                    ),
                    Expanded(
                      child: SmartTextField(
                        onChangeFunction: (value) {
                          String age = ageNumberController.text;
                          String height = heightNumberController.text;
                          String weight = weightNumberController.text;

                          if (!isValidHeight) setState(() => isValidHeight = validateHeightWeight(value));
                          bmiNumberController.text = updateUserBmi(age , height, weight);

                          isValidHeight ?
                            updateUserInfo("Height", heightNumberController.text) :
                            updateUserInfo("Height", null);
                        },
                        labelText: "Height (cm)",
                        errorText: "Invalid Height Value",
                        isValidInput: isValidHeight,
                        controllerName: heightNumberController,
                        filterTextInput: FilteringTextInputFormatter.allow(measuresRegEx),
                        keyboardType: const TextInputType.numberWithOptions(signed: false, decimal: true),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                      textColor: goal1 ? 0xFFFFFFFF : 0xFF757575,
                      borderColor: goal1 ? 0x00000000 : accentColor,
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
                      textColor: goal2 ? 0xFFFFFFFF : 0xFF757575,
                      borderColor: goal2 ? 0x00000000 : accentColor,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              DynamicButton(
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
                textColor: goal3 ? 0xFFFFFFFF : 0xFF757575,
                borderColor: goal3 ? 0x00000000 : accentColor,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 35, 0, 30),
                child: DynamicButton(
                  onClick: () async {
                    if(!isLoading) dismissKeyboard(context);
                    !isLoading?
                          createAccountHandler(
                            context,
                            (bool value) => setState(() => isValidAge = value),
                            (bool value) => setState(() => isValidHeight = value),
                            (bool value) => setState(() => isValidWeight = value),
                            (bool value) => setState(() => isValidLastName = value),
                            (bool value) => setState(() => isValidFirstName = value),
                            (bool value) => setState(() => isLoading = value),
                            (bool value) => setState(() => notSelected = value),
                          ) :
                    printDebugMsg("LOADING $isLoading");
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
