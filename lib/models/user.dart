class User {
  String fullname;
  String email;
  String phone;
  bool gender;
  String dob;
  static List<User>? users = [];

  User(
      {required this.fullname,
      required this.email,
      required this.phone,
      required this.dob,
      required this.gender});

  static User getDummyUser() {
    if (users!.isEmpty) initDummyUser();
    return users!.first;
  }

  static User? initDummyUser() {
    users?.add(User(
        fullname: 'Madison Smith',
        email: 'Madison@Example.com',
        phone: '+123 456 789',
        dob: '01/04/1996',
        gender: false));
    return users?.last;
  }

  static void updateDummyUser(User? user) {
    users?.clear();
    users?.add(user!);
  }
}
