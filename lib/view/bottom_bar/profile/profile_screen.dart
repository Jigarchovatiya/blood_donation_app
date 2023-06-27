import 'dart:io';

import 'package:blood_donation_app/res/constants/app_assets.dart';
import 'package:blood_donation_app/res/constants/app_colors.dart';
import 'package:blood_donation_app/res/constants/app_strings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/model/profile_model.dart';
import '../../../data/model/user_model.dart';
import '../../../res/global/media_query.dart';
import '../../../utils/utils.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserModel userModel = UserModel();
  Utils utils = Utils();
  FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  final storageRef = FirebaseStorage.instance.ref();

  final ImagePicker picker = ImagePicker();
  XFile? image;
  File? imageFile;

  pickImage() async {
    image = await picker.pickImage(source: ImageSource.gallery);
    imageFile = File(image!.path);
    storeImage();
    setState(() {});
  }

  storeImage() async {
    try {
      UploadTask uploadTask = firebaseStorage.ref().child("image").child("profile_1.jpg").putFile(imageFile!);

      uploadTask.snapshotEvents.listen((TaskSnapshot taskSnapshot) {
        switch (taskSnapshot.state) {
          case TaskState.running:
            final progress = 100.0 * (taskSnapshot.bytesTransferred / taskSnapshot.totalBytes);
            debugPrint("upload is $progress% complete.");
            break;
          case TaskState.paused:
            debugPrint("upload  is paused");
            break;
          case TaskState.success:
            debugPrint("upload was success");
            break;
          case TaskState.canceled:
            debugPrint("upload was canceled");
            break;
          case TaskState.error:
            debugPrint("upload was error");
            break;
        }
      });
    } on FirebaseException catch (e) {
      utils.showSnackBar(context, message: e.message);
    }
  }

  pickImageFromCamera() async {
    image = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (image != null) {
        imageFile = File(image!.path);
        storeImage();
      } else {
        debugPrint("No image selected------->");
      }
    });
  }

  pickImageFromGallery() async {
    image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (image != null) {
        imageFile = File(image!.path);
        storeImage();
      } else {
        debugPrint("No image selected");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homeBg,
      // appBar: AppBar(
      //   foregroundColor: AppColors.white,
      //   backgroundColor: AppColors.materialColor,
      //   title: const Text(
      //     AppStrings.profile,
      //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      //   ),
      //   centerTitle: true,
      // ),
      body: Stack(
        children: [
          Container(
            height: height(context) / 3.6,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.materialColor,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.elliptical(300, 115),
                bottomLeft: Radius.elliptical(300, 115),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height(context) / 13,
              ),
              const Text(
                AppStrings.profile,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.white),
              ),
              SizedBox(
                height: height(context) / 12,
              ),
              Stack(
                children: [
                  imageFile != null
                      ? Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 5,
                              color: AppColors.white,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(200),
                            clipBehavior: Clip.antiAlias,
                            child: Image.file(
                              imageFile!,
                              fit: BoxFit.fill,
                              height: height(context) / 6,
                              width: width(context) / 2.8,
                            ),
                          ),
                        )
                      : Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 2,
                              color: AppColors.white,
                            ),
                          ),
                          child: Image.asset(
                            AppAssets.profileImage,
                            height: height(context) / 6,
                            width: width(context) / 2.8,
                            fit: BoxFit.cover,
                          ),
                        ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          isDismissible: true,
                          context: context,
                          backgroundColor: AppColors.transparent,
                          // barrierColor: Colors.transparent,
                          builder: (context) => Container(
                            height: 150,
                            width: double.infinity,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                                color: AppColors.materialColor,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15),
                                )),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Select option",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(color: Colors.white),
                                          shape: BoxShape.circle,
                                        ),
                                        child: IconButton(
                                          onPressed: () {
                                            pickImageFromCamera();
                                            Navigator.of(context).pop();
                                          },
                                          icon: const Icon(
                                            Icons.camera_alt_rounded,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(color: Colors.white),
                                          shape: BoxShape.circle,
                                        ),
                                        child: IconButton(
                                          onPressed: () {
                                            pickImageFromGallery();
                                            Navigator.of(context).pop();
                                          },
                                          icon: const Padding(
                                            padding: EdgeInsets.all(4.0),
                                            child: Icon(
                                              Icons.image,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(7),
                        decoration: const BoxDecoration(
                          color: AppColors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x40000000),
                              offset: Offset(0, 2),
                              blurRadius: 4,
                            )
                          ],
                        ),
                        child: Icon(
                          Icons.camera_alt_outlined,
                          color: AppColors.materialColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height(context) / 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Aasma Shrestha",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                  SizedBox(
                    width: width(context) / 80,
                  ),
                  Icon(
                    Icons.verified,
                    color: AppColors.materialColor,
                  )
                ],
              ),
              const Text(
                "aasma@gmail.com",
                style: TextStyle(color: AppColors.textColor),
              ),
              SizedBox(height: height(context) / 50),
              SizedBox(
                height: height(context) / 24,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          "20",
                        ),
                        Text(
                          "Donation",
                        ),
                      ],
                    ),
                    VerticalDivider(
                      color: AppColors.dividerGray,
                      thickness: 1,
                    ),
                    Column(
                      children: [
                        Text(
                          "B+",
                        ),
                        Text(
                          "Blood Group",
                        ),
                      ],
                    ),
                    VerticalDivider(
                      color: AppColors.dividerGray,
                      thickness: 1,
                    ),
                    Column(
                      children: [
                        Text(
                          "5",
                        ),
                        Text(
                          "Campaigns",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: profileList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ListTile(
                            onTap: () {},
                            leading: profileList[index]["icon"],
                            title: profileList[index]["title"],
                            titleTextStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: index == 6 ? AppColors.red : AppColors.textColor,
                            ),
                          ),
                          index == 6
                              ? const SizedBox()
                              : const Divider(
                                  height: 1,
                                  thickness: 1,
                                  endIndent: 10,
                                  indent: 10,
                                ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
