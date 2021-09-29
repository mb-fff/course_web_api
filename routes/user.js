const express = require('express')
const connection = require('../db/config')
const router = express.Router()

// 获取用户列表
router.get('/user', (req, res) => {
  if (req.query.pagenum && req.query.pagesize) {
    const pagenum = req.query.pagenum,
      pagesize = req.query.pagesize
    connection.query(`SELECT * FROM users`, [], (data, fields) => {
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
  } else if (req.query.username) {
    connection.query(`SELECT * FROM users WHERE username=?`, [req.query.username], (data, fields) => {

      res.json({ data: data })
    })
  }
})

// 添加用户
router.post('/user', (req, res) => {
  const addData = req.body
  connection.query(`INSERT INTO users(username,password,authority,name,sex,grade,major,stu_number) VALUES('${addData.username}','${addData.password}','${addData.authority}','${addData.name}','${addData.sex}','${addData.grade}','${addData.major}','${addData.stu_number}')`, [], (data, fields) => {

    res.json({ data: data })
  })
})

// 更新用户
router.put('/user', (req, res) => {
  const updateData = req.body
  connection.query(`UPDATE users SET username=?,password=?,authority=?,name=?,sex=?,grade=?,major=?,stu_number=? WHERE user_id=?`, [updateData.username, updateData.password, updateData.authority, updateData.name, updateData.sex, updateData.grade, updateData.major, updateData.stu_number, updateData.user_id], (data, fields) => {

    res.json({ data: data })
  })
})

// 删除用户
router.delete('/user', (req, res) => {
  const user_id = req.query.user_id
  connection.query('DELETE FROM users where user_id=?', [user_id], (data, fields) => {

    res.json({ data: data })
  })
})
module.exports = router