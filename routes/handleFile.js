const express = require('express')
const fs = require('fs')
const connection = require('../db/config')
const router = express.Router()

// 上传文件
router.post('/file_upload', function (req, res) {
  const courseName = req.body.courseName //上传的文件所属的课程名称
  const projectName = req.body.projectName//上传的文件所属的类型
  const des_file = __dirname + `/file/${courseName}/${projectName}/` + req.files[0].originalname; //文件名
  const date = getDate()//上传时间
  let title = 'res'//默认为课程资源
  if (projectName === 'video') {
    title = 'vid'//若上传的为视频，则修改为vid
  }

  fs.readFile(req.files[0].path, function (err, data) {  // 异步读取文件内容,data为文件的二进制
    fs.writeFile(des_file, data, function (err) { // des_file是文件名，data，文件数据，异步写入到文件
      if (err) throw err
      // 文件上传成功，将文件名上传至数据库
      connection.query(`INSERT INTO ${projectName}(courseName,${title}_name,${title}_date) VALUES('${courseName}','${req.files[0].originalname}','${date}')`, [], (data, fields) => {

        res.json({ data: data })
      })
    })
  })
})

// 下载文件
router.get('/file_download', (req, res) => {
  const fileName = req.query.fileName//文件名称
  const courseName = req.query.courseName//课程名称
  const projectName = req.query.projectName//类型名称
  res.download(__dirname + `/file/${courseName}/${projectName}/${fileName}`, `${fileName}`, function (err) {
    if (err) throw err
  })
})

// 获取即时时间
function getDate () {
  const date1 = new Date().toLocaleDateString()
  let date2 = new Date().toTimeString()
  date2 = date2.slice(0, 8)
  return date1 + ' ' + date2
}

module.exports = router