const express = require('express')
const connection = require('../db/config')
const router = express.Router()

// 获取课程讲义
router.get('/resourse_handouts', (req, res) => {
  if (req.query.pagenum && req.query.pagesize && req.query.courseName) {
    const pagenum = req.query.pagenum,
      pagesize = req.query.pagesize,
      courseName = req.query.courseName
    connection.query(`SELECT * FROM resourse_handouts WHERE courseName=?`, [courseName], (data, fields) => {

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

// 获取综合项目
router.get('/resourse_project', (req, res) => {
  if (req.query.pagenum && req.query.pagesize && req.query.courseName) {
    const pagenum = req.query.pagenum,
      pagesize = req.query.pagesize,
      courseName = req.query.courseName
    connection.query(`SELECT * FROM resourse_project WHERE courseName=?`, [courseName], (data, fields) => {

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

// 获取实验设计
router.get('/resourse_test', (req, res) => {
  if (req.query.pagenum && req.query.pagesize && req.query.courseName) {
    const pagenum = req.query.pagenum,
      pagesize = req.query.pagesize,
      courseName = req.query.courseName
    connection.query(`SELECT * FROM resourse_test WHERE courseName=?`, [courseName], (data, fields) => {

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

// 获取考试样卷
router.get('/resourse_exam', (req, res) => {
  if (req.query.pagenum && req.query.pagesize && req.query.courseName) {
    const pagenum = req.query.pagenum,
      pagesize = req.query.pagesize,
      courseName = req.query.courseName
    connection.query(`SELECT * FROM resourse_exam WHERE courseName=?`, [courseName], (data, fields) => {

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

// 获取考核方式
router.get('/resourse_way', (req, res) => {
  if (req.query.courseName) {
    const courseName = req.query.courseName
    connection.query(`SELECT * FROM resourse_way WHERE courseName=?`, [courseName], (data, fields) => {

      res.json({
        data: data
      })
    })
  }
})
// 更新考核方式
router.put('/resourse_way', (req, res) => {
  if (req.body) {
    const obj = req.body
    connection.query('UPDATE resourse_way SET res_way=? WHERE courseName=?', [obj.res_way, obj.courseName], (data, fields) => {

      res.json({ data: data })
    })
  }
})


// 删除文件（课程讲义，综合项目，实验设计，考试样卷）
router.delete('/resourse', (req, res) => {
  const res_id = req.query.res_id,
    projectName = req.query.projectName
  connection.query(`DELETE FROM ${projectName} where res_id=?`, [res_id], (data, fields) => {

    res.json({ data: data })
  })
})

module.exports = router