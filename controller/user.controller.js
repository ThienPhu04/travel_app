const UserService = require('../services/user.services');

exports.register = async(res, req, next)=> {
       try {
              const {email,password} = req.body;

              const successRes = await UserService.registerUser(email, password);

              res.json({status:true, success:"User Registered Successfully"})
       } catch (err) {
              throw err;
       }
}