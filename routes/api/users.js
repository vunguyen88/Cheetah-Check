const express = require("express");
const router = express.Router();
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");
const keys = require("../../config/keys");
const passport = require("passport");

// Load User model
const User = require("../../models/User");
const Tag = require("../../models/Tag");

// @route POST api/users/admin/register
// @desc Register Instructor user
// @access Public
router.post("/admin/register", (req, res) => {
  const userName = req.body.userName;
  const password = req.body.password;
  const firstName = req.body.firstName;
  const lastName = req.body.lastname;
  const isAdmin = true;

  User.findOne({ userName }).then(user => {
    if (user) {
      return res.status(400).json({ name: "name already exists" });
    } else {
      const newUser = new User({
        userName,
        password,
        firstName,
        lastName,
        isAdmin
      });

      // Hash password before saving in database
      bcrypt.genSalt(10, (err, salt) => {
        bcrypt.hash(newUser.password, salt, (err, hash) => {
          if (err) throw err;
          newUser.password = hash;
          newUser
            .save()
            .then(user => res.json(user))
            .catch(err => console.log(err));
        });
      });
    }
  });
});

// @route POST api/admin/users/login
// @desc Login admin user and return JWT token
// @access Public
router.post("/admin/login", (req, res) => {
  const userName = req.body.userName;
  const password = req.body.password;

  // Find user by nauserNameme
  User.findOne({ userName }).then(user => {
    // Check if user exists
    if (!user) {
      return res.status(404).json({ usernotfound: "User not found" });
    }

    if (!user.isAdmin) {
      return res.status(401).json({ unauthorized: "User not unauthorized" });
    }

    // Check password
    bcrypt.compare(password, user.password).then(isMatch => {
      if (isMatch) {
        // User matched
        // Create JWT Payload
        const payload = {
          id: user.id,
          userName: user.userName
        };

        // Sign token
        jwt.sign(
          payload,
          keys.secretOrKey,
          {
            expiresIn: 31556926 // 1 year in seconds
          },
          (err, token) => {
            res.json({
              success: true,
              token: "Bearer " + token
            });
          }
        );
      } else {
        return res
          .status(400)
          .json({ passwordincorrect: "Password incorrect" });
      }
    });
  });
});

// @route GET api/users/admin/tags
// @desc Return JSON-serialized tag list
// @access Private
router.get(
  "/admin/tags",
  passport.authenticate("jwt", { session: false }),
  (req, res) => {
    let promises = req.user.tags.map(tagId => {
      return Tag.findOne({ _id: tagId })
        .then(result => {
          console.log(result.value);
          return result.value;
        })
        .catch(err => console.log(err));
    });

    Promise.all(promises)
      .then(result => {
        res.json(result);
      })
      .catch(e => {
        console.error(e);
      });
  }
);

// @route GET api/users/admin/attendedStudent
// @desc Return JSON-serialized attended list
// @access Private
router.get(
  "/admin/attendedStudent/",
  passport.authenticate("jwt", { session: false }),
  (req, res) => {
    console.log("getting attended students");
    const tagValue = req.query.tagValue;
    console.log(tagValue);

    Tag.findOne({ value: tagValue })
      .then(currTag => {
        let promises = currTag.students.map(studentId => {
          return User.findOne({ _id: studentId }).then(student => {
            console.log(student);
            return student.firstName + " " + student.lastName;
          });
        });

        Promise.all(promises)
          .then(result => {
            res.json(result);
          })
          .catch(e => {
            console.error(e);
          });
      })
      .catch(err => console.log(err));
  }
);

// @route PUT /api/users/admin/tag/create
// @desc Create new tag and add to db
// @access Private
router.put(
  "/admin/tag/create",
  passport.authenticate("jwt", { session: false }),
  (req, res) => {
    if (!req.user.isAdmin) {
      return res.status(401).json({ unauthorized: "User not unauthorized" });
    }
    const userId = req.user._id;
    const tag = req.body.tag;

    Tag.findOne({ value: tag }).then(currTag => {
      if (currTag) {
        return res.status(400).json({ name: "tag already exists" });
      } else {
        const newTag = new Tag({
          value: tag
        });

        newTag
          .save()
          .then(tag => {
            User.addTag(userId, tag._id, () => res.sendStatus(200));
            // res.sendStatus(200);
          })
          .catch(err => console.log(err));
      }
    });
  }
);

// @route PUT /api/users/student/tag/add
// @desc Create new tag and add to db
// @access Private
router.put(
  "/student/tag/add",
  passport.authenticate("jwt", { session: false }),
  (req, res, next) => {
    if (req.user.isAdmin) {
      return res.status(401).json({ unauthorized: "User not unauthorized" });
    }
    const userId = req.user._id;
    const tag = req.body.tag;

    Tag.findOne({ value: tag })
      .then(currTag => {
        Tag.addStudentById(currTag._id, userId, () => res.send(200));
      })
      .catch(err => {
        res.sendStatus(404);
        console.log(err);
      });
  }
);

// @route POST api/users/student/register
// @desc Register Instructor user
// @access Public
router.post("/student/register", (req, res) => {
  const userName = req.body.userName;
  const password = req.body.password;
  const firstName = req.body.firstName;
  const lastName = req.body.lastName;

  User.findOne({ userName }).then(user => {
    if (user) {
      return res.status(400).json({ name: "name already exists" });
    } else {
      const newUser = new User({
        userName: userName,
        password: password,
        firstName,
        lastName,
        isAdmin: false
      });

      // Hash password before saving in database
      bcrypt.genSalt(10, (err, salt) => {
        bcrypt.hash(newUser.password, salt, (err, hash) => {
          if (err) throw err;
          newUser.password = hash;
          newUser
            .save()
            .then(user => res.json(user))
            .catch(err => console.log(err));
        });
      });
    }
  });
});

// @route POST api/users/student/login
// @desc Login admin user and return JWT token
// @access Public
router.post("/student/login", (req, res) => {
  const userName = req.body.userName;
  const password = req.body.password;

  // Find user by userName
  User.findOne({ userName }).then(user => {
    // Check if user exists
    if (!user) {
      return res.status(404).json({ usernotfound: "User not found" });
    }

    if (user.isAdmin) {
      return res.status(401).json({ unauthorized: "User not unauthorized" });
    }

    // Check password
    bcrypt.compare(password, user.password).then(isMatch => {
      if (isMatch) {
        // User matched
        // Create JWT Payload
        const payload = {
          id: user.id,
          userName: user.userName
        };

        // Sign token
        jwt.sign(
          payload,
          keys.secretOrKey,
          {
            expiresIn: 31556926 // 1 year in seconds
          },
          (err, token) => {
            res.json({
              success: true,
              token: "Bearer " + token
            });
          }
        );
      } else {
        return res
          .status(400)
          .json({ passwordincorrect: "Password incorrect" });
      }
    });
  });
});

router.all("/", (req, res, next) => {
  return res.status(400).json({ notFound: "Not Found" });
});

module.exports = router;
