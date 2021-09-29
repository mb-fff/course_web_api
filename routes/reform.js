const express = require('express')
const connection = require('../db/config')
const router = express.Router()

// 获取教学改革数据
router.get('/reform', (req, res) => {
  const courseName = req.query.courseName
  // 执行查询操作
  connection.query('SELECT * FROM reform WHERE courseName=?', [courseName], (data, fields) => {

    res.json({ data: data })
  })
})
// 更新教学改革数据
router.put('/reform', (req, res) => {
  const courseName = req.body.courseName,
    ref_action = req.body.ref_action,
    ref_importance = req.body.ref_importance,
    ref_way = req.body.ref_way
  // 执行更新操作
  connection.query('UPDATE reform SET ref_action = ?,ref_importance = ?,ref_way=? WHERE courseName = ?', [ref_action, ref_importance, ref_way, courseName], (data, fields) => {

    res.json({ data: data })
  })
})
module.exports = router