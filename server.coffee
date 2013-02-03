express = require 'express'
ejs = require 'ejs'
partials = require 'express-partials'
sass = require 'node-sass'

app = express()

app.configure ->
  app.use(express.bodyParser())
  app.use(sass.middleware({
      src: __dirname  + "/public"
    , dest: __dirname + "/public"
    , debug: true
  }))
  app.set('dirname', __dirname)
  app.use(partials())
  app.set('view engine', 'ejs')
  app.use(express.static(__dirname + "/public/"))
  app.use(express.errorHandler({ dumpExceptions: true, showStack: true}))
  app.set('views',__dirname + "/views/")

app.get "/", (req,res) ->
  res.render 'index.ejs'

port = process.env.PORT || 8080
app.listen port
console.log "Listening on Port '#{port}'"
