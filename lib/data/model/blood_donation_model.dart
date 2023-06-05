class BloodDonationModel {
  String? group;
  String? profileImage;
  String? title;
  String? location;
  String? phone;

  BloodDonationModel({this.group, this.profileImage, this.title, this.location, this.phone});
}

List<BloodDonationModel> sizeList = [
  BloodDonationModel(group: "All"),
  BloodDonationModel(group: "A+"),
  BloodDonationModel(group: "A-"),
  BloodDonationModel(group: "AB+"),
  BloodDonationModel(group: "AB-"),
  BloodDonationModel(group: "O+"),
  BloodDonationModel(group: "O-"),
  BloodDonationModel(group: "B+"),
  BloodDonationModel(group: "B-"),
];
List<BloodDonationModel> imageList = [
  BloodDonationModel(profileImage: "All"),
  BloodDonationModel(profileImage: "A+"),
  BloodDonationModel(profileImage: "A-"),
  BloodDonationModel(profileImage: "AB+"),
];
List<BloodDonationModel> titleList = [
  BloodDonationModel(title: "All"),
  BloodDonationModel(title: "A+"),
  BloodDonationModel(title: "A-"),
  BloodDonationModel(title: "AB+"),
];
List<BloodDonationModel> locationList = [
  BloodDonationModel(location: "All"),
  BloodDonationModel(location: "A+"),
  BloodDonationModel(location: "A-"),
  BloodDonationModel(location: "AB+"),
];
List<BloodDonationModel> phoneList = [
  BloodDonationModel(phone: "+977 98654321987"),
  BloodDonationModel(phone: "+977 98654321987"),
  BloodDonationModel(phone: "+977 98654321987"),
  BloodDonationModel(phone: "+977 98654321987"),
  BloodDonationModel(phone: "+977 98654321987"),
];
