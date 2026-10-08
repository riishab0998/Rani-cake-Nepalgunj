const express = require('express');
const { Pool } = require('pg');

const app = express();
app.use(express.json());

const pool = new Pool({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
  port: 5432,
});

app.get('/api/health', (req, res) => res.json({ status: 'ok' }));

app.get('/api/cakes', async (req, res) => {
  try {
    const { rows } = await pool.query('SELECT * FROM cakes ORDER BY id');
    res.json(rows);
  } catch (e) {
    console.error(e);
    res.status(500).json({ error: 'Database error' });
  }
});

app.post('/api/orders', async (req, res) => {
  const { customer_name, phone, cake_id, quantity, message } = req.body;
  if (!customer_name || !phone || !cake_id) {
    return res.status(400).json({ error: 'Name, phone and cake are required' });
  }
  try {
    const { rows } = await pool.query(
      `INSERT INTO orders (customer_name, phone, cake_id, quantity, message)
       VALUES ($1,$2,$3,$4,$5) RETURNING id`,
      [customer_name, phone, cake_id, quantity || 1, message || '']
    );
    res.status(201).json({ ok: true, order_id: rows[0].id });
  } catch (e) {
    console.error(e);
    res.status(500).json({ error: 'Could not save order' });
  }
});

app.get('/api/orders', async (req, res) => {
  try {
    const { rows } = await pool.query(
      `SELECT o.id, o.customer_name, o.phone, c.name AS cake, o.quantity,
              (c.price * o.quantity) AS total, o.message, o.created_at
       FROM orders o JOIN cakes c ON c.id = o.cake_id
       ORDER BY o.id DESC`
    );
    res.json(rows);
  } catch (e) {
    console.error(e);
    res.status(500).json({ error: 'Database error' });
  }
});

app.listen(3000, () => console.log('Rani Cake API running on port 3000'));
