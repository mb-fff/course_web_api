const mysql = require('mysql')

// 创建mysql连接池
const pool = mysql.createPool({
  host: 'localhost',
  port: 3306,
  user: 'root',
  password: 'MYSQL',
  database: 'dataanalysis',
  acquireTimeout: 15000,//请求延迟
  connectionLimit: 100,//最大连接数
  waitForConnections: true,//超出连接数排队
  queueLimit: 0
})

exports.query = (sql, arr, callback) => {
  // 建立连接
  pool.getConnection((err, connection) => {
    if (err) {
      throw err
    }
    connection.query(sql, arr, (error, data, fields) => {
      // 将连接返回到连接池中，准备由其他人重复使用
      connection.release()
      if (error) {
        throw error
      }
      // 执行回调函数，将数据返回
      callback && callback(data, fields)
    })
  })
}