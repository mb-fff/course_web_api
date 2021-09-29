const express = require('express')
const connection = require('../db/config')
const router = express.Router()

// 获取联系我们数据
router.get('/contact', (req, res) => {
  // 执行查询操作
  connection.query('SELECT * FROM contact', [], (data, fields) => {

    res.json({ data: data })
  })
})
// 更新联系我们数据
router.put('/contact', (req, res) => {
  const obj = req.body
  // 执行更新操作
  connection.query('UPDATE contact SET con_teacher=?,con_assistant=?,con_chat=?', [obj.con_teacher, obj.con_assistant, obj.con_chat], (data, fields) => {

    res.json({ data: data })
  })
})
module.exports = router