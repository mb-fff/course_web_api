const express = require('express')
const connection = require('../db/config')
const router = express.Router()

// 获取推荐网站数据
router.get('/website', (req, res) => {
  if (req.query.pagenum && req.query.pagesize) {
    const pagenum = req.query.pagenum,
      pagesize = req.query.pagesize
    connection.query(`SELECT * FROM website`, [], (data, fields) => {

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
    connection.query('SELECT * FROM website', [], (data, fields) => {

      res.json({ data: data })
    })
  }

})
// 添加推荐网站数据
router.post('/website', (req, res) => {
  const web_name = req.body.web_name,
    web_link = req.body.web_link
  // 执行添加操作
  connection.query(`INSERT INTO website(web_name,web_link) VALUES('${web_name}','${web_link}')`, [], (data, fields) => {

    res.json({ data: data })
  })
})
// 更新推荐网站数据
router.put('/website', (req, res) => {
  const web_id = req.body.web_id,
    web_name = req.body.web_name,
    web_link = req.body.web_link
  // 执行更新操作
  connection.query('UPDATE website SET web_name=?,web_link=? WHERE web_id=?', [web_name, web_link, web_id], (data, fields) => {

    res.json({ data: data })
  })
})
// 删除推荐网站数据
router.delete('/website', (req, res) => {
  const web_id = req.query.web_id
  connection.query('DELETE FROM website where web_id=?', [web_id], (data, fields) => {

    res.json({ data: data })
  })
})
module.exports = router