const express = require('express')
const connection = require('../db/config')
const router = express.Router()

// 获取课程描述数据
router.get('/description', (req, res) => {
  const courseName = req.query.courseName
  // 执行查询操作
  connection.query('SELECT * FROM description WHERE courseName=?', [courseName], (data, fields) => {

    res.json({ data: data })
  })
})
// 更新课程描述数据
router.put('/description', (req, res) => {
  const courseName = req.body.courseName,
    des_outline = req.body.des_outline,
    des_hour = req.body.des_hour,
    des_history = req.body.des_history
  // 执行更新操作
  connection.query('UPDATE description SET des_outline = ?,des_hour = ?,des_history=? WHERE courseName = ?', [des_outline, des_hour, des_history, courseName], (data, fields) => {

    res.json({ data: data })
  })
})

module.exports = router