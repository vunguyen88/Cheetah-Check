const mongoose = require("mongoose");

const Schema = mongoose.Schema;
// Create Schema
const UserSchema = new Schema({
  userName: {
    type: String,
    required: true
  },
  firstName: {
    type: String,
    require: true
  },
  lastName: {
    type: String,
    require: true
  },
  email: {
    type: String,
    required: false
  },
  password: {
    type: String,
    required: true
  },
  isAdmin: {
    type: Boolean,
    default: false
  },
  date: {
    type: Date,
    default: Date.now
  },
  tags: [{ type: mongoose.Schema.Types.ObjectId, ref: "tags" }]
});
module.exports = User = mongoose.model("users", UserSchema);

// Find a user by id wrapper
module.exports.getUserById = function(id, callback) {
  User.findById(id, callback);
};

// Find a user by name wrapper
module.exports.getUserByUsername = function(name, callback) {
  const query = { name: name };
  User.findOne(query, callback);
};

// add user to db wrapper
module.exports.addUser = function(newUser, callback) {
  bcrypt.genSalt(10, (err, salt) => {
    if (err) throw err;
    bcrypt.hash(newUser.password, salt, (err, hash) => {
      if (err) throw err;
      newUser.password = hash;
      newUser.save(callback);
    });
  });
};

// Compare candidatePassword with passowrd
module.exports.comparePassword = function(candidatePassword, hash, callback) {
  bcrypt.compare(candidatePassword, hash, (err, isMatch) => {
    if (err) throw err;
    callback(null, isMatch);
  });
};

// Add contact new Tag to user by id
module.exports.addTag = function(id, tagId, callback) {
  User.findByIdAndUpdate(
    id,
    { $push: { tags: { _id: tagId } } },
    { new: true },
    (err, model) => {
      if (err) throw err;
      callback(err, model);
    }
  );
};

module.exports.getTags = function(id, tagId, callback) {
  User.findByIdAndUpdate(
    id,
    { $push: { tags: { _id: tagId } } },
    { new: true },
    (err, model) => {
      if (err) throw err;
      callback(err, model);
    }
  );
};
