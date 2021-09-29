const express = require('express')
const connection = require('../db/config')
const router = express.Router()

// 获取教学视频数据
router.get('/video', (req, res) => {
  if (req.query.pagenum && req.query.pagesize && req.query.courseName) {
    const pagenum = req.query.pagenum,
      pagesize = req.query.pagesize,
      courseName = req.query.courseName
    connection.query(`SELECT * FROM video WHERE courseName=?`, [courseName], (data, fields) => {

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
  } else {
    connection.query('SELECT * FROM video', [], (data, fields) => {

      res.json({ data: data })
    })
  }

})
// 删除教学视频数据
router.delete('/video', (req, res) => {
  const vid_id = req.query.vid_id
  connection.query('DELETE FROM video where vid_id=?', [vid_id], (data, fields) => {

    res.json({ data: data })
  })
})

module.exports = router