const express = require('express')
const connection = require('../db/config')
const router = express.Router()

// 查询整体结构和师资培训
router.get('/team_construction', (req, res) => {
  // 执行查询操作
  connection.query('SELECT * FROM team_construction', [], (data, fields) => {

    res.json({ data: data })
  })
})

// 更新整体结构和师资培训
router.put('/team_construction', (req, res) => {
  const updateData = req.body
  connection.query('UPDATE team_construction SET tea_construction=?,tea_train=? WHERE tea_id=1', [updateData.tea_construction, updateData.tea_train], (data, fields) => {

    res.json({ data: data })
  })
})

// 查询教学人员
router.get('/team_teacher', (req, res) => {
  // 执行查询操作
  connection.query('SELECT * FROM team_teacher', [], (data, fields) => {

    res.json({ data: data })
  })
})

// 添加教学人员
router.post('/team_teacher', (req, res) => {
  const addData = req.body
  connection.query(`INSERT INTO team_teacher(tea_name,tea_introduce,tea_course,tea_topic,tea_achivement) VALUES('${addData.tea_name}','${addData.tea_introduce}','${addData.tea_course}','${addData.tea_topic}','${addData.tea_achivement}')`, [], (data, fields) => {

    res.json({ data: data })
  })
})

// 更新教学人员
router.put('/team_teacher', (req, res) => {
  const updateData = req.body
  connection.query(`UPDATE team_teacher SET tea_name=?,tea_introduce=?,tea_course=?,tea_topic=?,tea_achivement=? WHERE tea_id=?`, [updateData.tea_name, updateData.tea_introduce, updateData.tea_course, updateData.tea_topic, updateData.tea_achivement, updateData.tea_id], (data, fields) => {

    res.json({ data: data })
  })
})

// 删除教学人员
router.delete('/team_teacher', (req, res) => {
  const tea_id = req.query.tea_id
  connection.query('DELETE FROM team_teacher where tea_id=?', [tea_id], (data, fields) => {

    res.json({ data: data })
  })
})

module.exports = router