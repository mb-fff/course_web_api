const express = require('express')
const connection = require('../db/config')
const router = express.Router()

// 获取评论内容
router.get('/comment', (req, res) => {
  const dis_id = req.query.dis_id
  connection.query(`SELECT * FROM comment WHERE dis_id=?`, [dis_id], (data, fields) => {

    data.forEach(item => {
      connection.query(`SELECT * FROM comment2 WHERE com_id=?`, [item.com_id], (data1, fields1) => {

        item.children = data1
      })
    })
    setTimeout(() => {
      res.json({ data: data })
    }, 10)
  })
})

// 发布评论
router.post('/comment', (req, res) => {
  connection.query(`INSERT INTO comment(dis_id,com_user,com_content,com_date,com_show) VALUES('${req.body.dis_id}','${req.body.com_user}','${req.body.com_content}','${req.body.com_date}','false')`, [], (data, fields) => {

    res.json({ data: data })
  })
})

// 回复评论
router.post('/reply', (req, res) => {
  connection.query(`INSERT INTO comment2(com_id,com2_user,com2_content,com2_date) VALUES('${req.body.com_id}','${req.body.com2_user}','${req.body.com2_content}','${req.body.com2_date}')`, [], (data, fields) => {

    res.json({ data: data })
  })
})

// 删除一级评论
router.delete('/comment', (req, res) => {
  const com_id = req.query.com_id
  connection.query('DELETE FROM comment WHERE com_id=?', [com_id], (data, fields) => {

    res.json({ data: data })
  })
})
// 删除二级评论
router.delete('/comment2', (req, res) => {
  const com2_id = req.query.com2_id
  connection.query('DELETE FROM comment2 WHERE com2_id=?', [com2_id], (data, fields) => {

    res.json({ data: data })
  })
})
module.exports = router