// const mongoose = require("mongoose");

// // Create Schema
// const TagSchema = mongoose.Schema({
//   value: {
//     type: String,
//     required: true
//   },
//   students: [{ type: mongoose.Schema.Types.ObjectId, ref: "users" }]
// });

// module.exports = TagSchema;

// // Find a user by id wrapper
// module.exports.getTagById = (id, callback) => {
//   TagSchema.findById(id, callback);
// };

// // // Find a user by name wrapper
// // module.exports.getUserByUsername = function(name, callback) {
// //   const query = { name: name };
// //   User.findOne(query, callback);
// // };

// // // add user to db wrapper
// // module.exports.addUser = function(newUser, callback) {
// //   bcrypt.genSalt(10, (err, salt) => {
// //     if (err) throw err;
// //     bcrypt.hash(newUser.password, salt, (err, hash) => {
// //       if (err) throw err;
// //       newUser.password = hash;
// //       newUser.save(callback);
// //     });
// //   });
// // };

// // // Compare candidatePassword with passowrd
// // module.exports.comparePassword = function(candidatePassword, hash, callback) {
// //   bcrypt.compare(candidatePassword, hash, (err, isMatch) => {
// //     if (err) throw err;
// //     callback(null, isMatch);
// //   });
// // };

// // // Add contact newContact to user by id
// // module.exports.addTag = function(id, newTag, callback) {
// //   User.findByIdAndUpdate(
// //     id,
// //     { $push: { tagValue: newTag } },
// //     { new: true },
// //     (err, model) => {
// //       if (err) throw err;
// //       callback(err, model);
// //     }
// //   );
// // };

const mongoose = require("mongoose");

const Schema = mongoose.Schema;
// Create Schema
const TagSchema = new Schema({
  value: {
    type: String,
    required: true
  },
  students: [{ type: mongoose.Schema.Types.ObjectId, ref: "users" }]
});
module.exports = Tag = mongoose.model("tags", TagSchema);

// Find a user by id wrapper
module.exports.getTagById = function(id, callback) {
  Tag.findById(id, callback);
};

module.exports.addStudentById = function(id, studentId, callback) {
  Tag.findByIdAndUpdate(
    id,
    { $push: { students: studentId } },
    { new: true },
    (err, model) => {
      if (err) throw err;
      callback(err, model);
    }
  );
};

// // Find a user by name wrapper
// module.exports.getUserByUsername = function(name, callback) {
//   const query = { name: name };
//   User.findOne(query, callback);
// };

// // add user to db wrapper
// module.exports.addUser = function(newUser, callback) {
//   bcrypt.genSalt(10, (err, salt) => {
//     if (err) throw err;
//     bcrypt.hash(newUser.password, salt, (err, hash) => {
//       if (err) throw err;
//       newUser.password = hash;
//       newUser.save(callback);
//     });
//   });
// };

// // Compare candidatePassword with passowrd
// module.exports.comparePassword = function(candidatePassword, hash, callback) {
//   bcrypt.compare(candidatePassword, hash, (err, isMatch) => {
//     if (err) throw err;
//     callback(null, isMatch);
//   });
// };

// // Add contact new Tag to user by id
// module.exports.addTag = function(id, newTag, callback) {
//   User.findByIdAndUpdate(
//     id,
//     { $push: { tags: { value: newTag } } },
//     { new: true },
//     (err, model) => {
//       if (err) throw err;
//       callback(err, model);
//     }
//   );
// };

// // Add contact newContact to user by id
// module.exports.addContact = function(id, newContact, callback) {
//   User.findByIdAndUpdate(
//     id,
//     { $push: { contacts: newContact } },
//     { new: true },
//     (err, model) => {
//       if (err) throw err;
//       callback(err, model);
//     }
//   );
// };

// // Delete contact contactId on user by userId
// module.exports.deleteContact = function(userId, contactId, callback) {
//   User.findByIdAndUpdate(
//     userId,
//     { $pull: { contacts: { _id: contactId } } },
//     { new: true },
//     (err, model) => {
//       if (err) throw err;
//       callback(err, model);
//     }
//   );
// };
