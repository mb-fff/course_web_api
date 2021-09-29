const express = require('express')
const connection = require('../db/config')
const router = express.Router()

// 获取课程介绍数据
router.get('/introduce', (req, res) => {
  const courseName = req.query.courseName
  // 执行查询操作
  connection.query('SELECT * FROM introduce WHERE courseName=?', [courseName], (data, fields) => {

    res.json({ data: data })
  })
})
// 更新课程介绍数据
router.put('/introduce', (req, res) => {
  const courseName = req.body.courseName,
    int_intro = req.body.int_intro,
    int_target = req.body.int_target
  // 执行更新操作
  connection.query('UPDATE introduce SET int_intro = ?,int_target = ? WHERE courseName = ?', [int_intro, int_target, courseName], (data, fields) => {

    res.json({ data: data })
  })
})

module.exports = router