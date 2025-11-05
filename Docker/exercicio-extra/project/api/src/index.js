const express = require("express");
const { Pool } = require("pg");

const app = express();

const pool = new Pool({
  host: process.env.DB_HOST,     
  user: process.env.DB_USER,
  password: process.env.DB_PASS,
  database: process.env.DB_NAME,
});

app.get("/health", (req, res) => {
  res.json({ status: "ok" });
});

app.get("/db-check", async (req, res) => {
  try {
    const result = await pool.query("SELECT NOW()");
    res.json({ db: "ok", time: result.rows[0].now });
  } catch (err) {
    console.error(err);
    res.status(500).json({ db: "error", message: err.message });
  }
});

app.listen(3000, () => {
  console.log("API rodando na porta 3000");
});
