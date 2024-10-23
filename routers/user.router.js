const router = require('express').Router();
const { route } = require('../app');
const UserController = require('../controller/user.controller');

router.post('/registration', UserController.register);

module.exports = router;