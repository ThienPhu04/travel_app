const mongoose = require('mongoose');

const connection = mongoose.createConnection('mongodb://localhost:27017/Travel-App').on('open', ()=> {
       console.log("MongoDB connected");
}).on('error', ()=> {
       console.log("MongoDB connection error");
});

module.exports = connection;