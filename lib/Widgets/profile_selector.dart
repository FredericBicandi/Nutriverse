import 'package:cupertino_modal_sheet/cupertino_modal_sheet.dart';
import 'package:flutter/material.dart' as material;
import '../includes.dart';

class _ProfileSelectorState extends State<ProfileSelector> {
  final ImagePicker picker = ImagePicker();

  Future<void> takePhoto(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() => imageFile = File(pickedFile.path));
      printDebugMsg("imageFile $imageFile");
    }
  }

  @override
  Widget build(BuildContext context) {
    return material.Center(
      child: SizedBox(
        width: widget.setSize,
        height: 150,
        child: DynamicTextButton(
          onClick: () {
            showCupertinoModalSheet(
                context: context,
                builder: (builder) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 600),
                    child: Container(
                      color: CupertinoColors.white,
                      height: sizeOf(context, 0.70),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Choose Profile Photo",
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(secondaryColor),
                              decoration: TextDecoration.none,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // Camera and Text
                              Column(
                                children: [
                                  DynamicTextButton(
                                    onClick: () =>
                                        takePhoto(ImageSource.camera),
                                    buttonIcon: CupertinoIcons.camera_fill,
                                    iconSize: 45,
                                  ),
                                  const Text(
                                    "Camera",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xFF595959),
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ],
                              ),
                              // Gallery and Text
                              Column(
                                children: [
                                  DynamicTextButton(
                                    iconColor: 0xFF595959,
                                    onClick: () =>
                                        takePhoto(ImageSource.gallery),
                                    buttonIcon: CupertinoIcons
                                        .photo_fill_on_rectangle_fill,
                                    iconSize: 45,
                                  ),
                                  const Text(
                                    "Gallery",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xFF595959),
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  DynamicTextButton(
                                    onClick: () {
                                      widget.onRemoval?.call();
                                      Navigator.pop(context);
                                    },
                                    iconColor: 0xfffa6c61,
                                    buttonIcon: CupertinoIcons.trash_fill,
                                    iconSize: 45,
                                  ),
                                  const Text(
                                    "remove",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xFF595959),
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                });
          },
          setPlusSize: widget.plusSize,
          image:
              imageFile != null ? FileImage(imageFile!) : widget.imageProfile,
        ),
      ),
    );
  }
}

class ProfileSelector extends StatefulWidget {
  const ProfileSelector(
      {super.key,
      required this.imageProfile,
      this.setSize = 150,
      this.plusSize = 18,
      this.onRemoval});

  final double setSize, plusSize;
  final dynamic imageProfile;
  final VoidCallback? onRemoval;

  @override
  State<ProfileSelector> createState() => _ProfileSelectorState();
}
