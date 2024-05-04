// Define the model for a lost person (assuming you have a Person class)
class LostPerson {
  final String name;
  final String email;
  final int phoneNumber;
  final String address;
  final String imageUrl;

  LostPerson(
      {required this.phoneNumber,
      required this.address,
      required this.name,
      required this.email,
      required this.imageUrl});
}
