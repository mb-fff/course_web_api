const express = require('express')
const connection = require('../db/config')
const router = express.Router()
const { createToken } = require('../plugins/token_vertify')

// 登陆
router.post('/login', (req, res) => {
  // 执行查询操作
  connection.query('SELECT * FROM users WHERE username=? and password=? and authority=?', [req.body.username, req.body.password, req.body.authority], (data, fields) => {

    // 未查询到内容
    if (!data[0]) {
      res.json({
        'code': 1,
        'msg': '登陆失败'
      })
      return
    }
    // 查询成功
    let payload = {
      username: data[0].username,
      limit: data[0].authority,
      name: data[0].name,
      sex: data[0].sex,
      grade: data[0].grade,
      major: data[0].major,
      stu_number: data[0].stu_number
    }
    let token = createToken(payload)
    delete data[0].password
    res.json({
      data: data,
      token: token,
      'code': 0,
      'msg': '登陆成功'
    })
  })
})

module.exports = router
