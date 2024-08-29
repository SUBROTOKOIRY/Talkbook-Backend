const mongoose = require('mongoose')

const connectDb = async(url) => {
  return await mongoose
    .connect(url, {
      useNewUrlParser: true,
      useUnifiedTopology: true,
    })
    .then(() => {
      console.log('DB Connetion Successfull')
    })
    .catch((err) => {
      console.log(err.message)
    })
}

module.exports = connectDb
