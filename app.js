const express = require('express')
const bodyParser = require('body-parser'); // 这个模块是获取post请求传过来的数据。
const multer = require('multer'); //multer - node.js 中间件，用于处理 enctype="multipart/form-data"（设置表单的MIME编码）的表单数据。
const { verifyToken } = require('./plugins/token_vertify')

// 引入路由文件
const introduce = require('./routes/introduce')
const description = require('./routes/description')
const books = require('./routes/books')
const resourse = require('./routes/resourse')
const video = require('./routes/video')
const team = require('./routes/team')
const reform = require('./routes/reform')
const evaluate = require('./routes/evaluate')
const website = require('./routes/website')
const discuss = require('./routes/discuss')
const comment = require('./routes/comment')
const contact = require('./routes/contact')
const login = require('./routes/login')
const user = require('./routes/user')
const handleFile = require('./routes/handleFile')

const app = express()

// CORS设置跨域访问
app.all('*', (req, res, next) => {
  res.header('Access-Control-Allow-Origin', '*')
  res.header("Access-Control-Allow-Headers", "X-Requested-With, mytoken")
  res.header('Access-Control-Allow-Headers', 'X-Requested-With, Authorization')
  res.header("Access-Control-Allow-Methods", "PUT,POST,GET,DELETE,OPTIONS")
  res.header("X-Powered-By", ' 3.2.1')
  res.header('Access-Control-Allow-Headers', 'Content-Type,Content-Length, Authorization, Accept,X-Requested-With')
  res.header("Content-Type", "application/json;charset=utf-8")
  next()
})

app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: true }))
app.use(multer({ dest: '/tmp/' }).array('file'))

// 挂载路由
app.use(introduce)
app.use(description)
app.use(books)
app.use(resourse)
app.use(video)
app.use(team)
app.use(reform)
app.use(evaluate)
app.use(website)
app.use(discuss)
app.use(comment)
app.use(contact)
app.use(login)
app.use(user)
app.use(handleFile)

// token校验
app.use((req, res, next) => {
  // 只校验post，put，delete请求
  if (req.method === 'POST' || req.method === 'PUT' || req.method === 'DELETE') {
    if (req.url !== '/login') {
      verifyToken(req.headers.authorization).then(() => {
        // token校验成功
        next()
      }).catch(error => {
        res.status(401).send('token校验失败')
      })
    } else {
      // url是 /login，则直接通过
      next()
    }
  } else {
    next()
  }
})

app.listen(12101, () => {
  console.log('server is running')
})