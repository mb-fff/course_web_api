const express = require('express')
const connection = require('../db/config')
const router = express.Router()

// 获取课程评价数据
router.get('/evaluate', (req, res) => {
  const courseName = req.query.courseName
  // 执行查询操作
  connection.query('SELECT * FROM evaluate WHERE courseName=?', [courseName], (data, fields) => {

    res.json({ data: data })
  })
})
// 更新课程评价数据
router.put('/evaluate', (req, res) => {
  const courseName = req.body.courseName,
    eva_student = req.body.eva_student,
    eva_peer = req.body.eva_peer,
    eva_feature = req.body.eva_feature
  // 执行更新操作
  connection.query('UPDATE evaluate SET eva_student = ?,eva_peer = ?,eva_feature=? WHERE courseName = ?', [eva_student, eva_peer, eva_feature, courseName], (data, fields) => {

    res.json({ data: data })
  })
})
module.exports = router