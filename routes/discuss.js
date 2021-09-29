const express = require('express')
const connection = require('../db/config')
const router = express.Router()

// 获取主题讨论数据
router.get('/discuss', (req, res) => {
  if (req.query.dis_id) {
    // 执行查询操作
    connection.query(`SELECT * FROM discuss WHERE dis_id=?`, [req.query.dis_id], (data, fields) => {

      res.json({ data: data })
    })
  } else if (req.query.pagenum && req.query.pagesize && req.query.courseName) {
    const pagenum = req.query.pagenum,
      pagesize = req.query.pagesize,
      courseName = req.query.courseName
    connection.query(`SELECT * FROM discuss WHERE courseName=?`, [courseName], (data, fields) => {

      const newData = []
      const total = data.length
      for (let i = (pagenum - 1) * pagesize; i < pagenum * pagesize; i++) {
        newData.push(data[i])
        if (!data[i]) {
          newData.pop()
        }
      }
      res.json({
        data: newData,
        total: total
      })
    })
  } else if (req.query.pagenum && req.query.pagesize && req.query.dis_user) {
    const pagenum = req.query.pagenum,
      pagesize = req.query.pagesize,
      dis_user = req.query.dis_user
    connection.query(`SELECT * FROM discuss WHERE dis_user=?`, [dis_user], (data, fields) => {

      const newData = []
      const total = data.length
      for (let i = (pagenum - 1) * pagesize; i < pagenum * pagesize; i++) {
        newData.push(data[i])
        if (!data[i]) {
          newData.pop()
        }
      }
      res.json({
        data: newData,
        total: total
      })
    })
  }
})
// 发布讨论
router.post('/discuss', (req, res) => {
  connection.query(`INSERT INTO discuss(courseName,dis_name,dis_content,dis_user,dis_date) VALUES('${req.body.courseName}','${req.body.dis_name}','${req.body.dis_content}','${req.body.dis_user}','${req.body.dis_date}')`, [], (data, fields) => {

    res.json({ data: data })
  })
})
// 删除讨论
router.delete('/discuss', (req, res) => {
  const dis_id = req.query.dis_id
  connection.query('DELETE FROM discuss WHERE dis_id=?', [dis_id], (data, fields) => {

    res.json({ data: data })
  })
})

module.exports = router