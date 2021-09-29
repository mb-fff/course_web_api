const express = require('express')
const connection = require('../db/config')
const router = express.Router()

// 获取参考教材数据
router.get('/books', (req, res) => {
  if (req.query.pagenum && req.query.pagesize && req.query.courseName) {
    const pagenum = req.query.pagenum,
      pagesize = req.query.pagesize,
      courseName = req.query.courseName
    connection.query(`SELECT * FROM books WHERE courseName=?`, [courseName], (data, fields) => {

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
    // 执行查询操作
    connection.query('SELECT * FROM books', (data, fields) => {

      res.json({ data: data })
    })
  }

})
// 添加参考教材数据
router.post('/books', (req, res) => {
  const courseName = req.body.courseName,
    boo_name = req.body.boo_name,
    boo_auther = req.body.boo_auther
  // 执行添加操作
  connection.query(`INSERT INTO books(courseName,boo_name,boo_auther) VALUES('${courseName}','${boo_name}','${boo_auther}')`, [], (data, fields) => {

    res.json({ data: data })
  })
})
// 更新参考教材数据
router.put('/books', (req, res) => {
  const boo_id = req.body.boo_id,
    boo_name = req.body.boo_name,
    boo_auther = req.body.boo_auther
  // 执行更新操作
  connection.query('UPDATE books SET boo_name=?,boo_auther=? WHERE boo_id=?', [boo_name, boo_auther, boo_id], [], (data, fields) => {

    res.json({ data: data })
  })
})
// 删除参考教材数据
router.delete('/books', (req, res) => {
  const boo_id = req.query.boo_id
  connection.query('DELETE FROM books where boo_id=?', [boo_id], (data, fields) => {

    res.json({ data: data })
  })
})
module.exports = router