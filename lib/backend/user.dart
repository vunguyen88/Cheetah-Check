
class User {
  var instructor = true;
  var email;
  var firstName;
  var lastName;
  var classInfo;
  var checkInBool;

  // To see logged in views, initialize a User object with instructor assigned
  //    true or false (e.g. User.instructor(false);)
  // To see instructor view, call User.instructor(true);
  // To see student view, call User.instructor(false);

  User();
  User.instructor(instructor);
  User.all(instructor, email, firstName, lastName, classInfo, checkInBool);

}