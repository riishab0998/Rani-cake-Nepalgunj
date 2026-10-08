CREATE TABLE IF NOT EXISTS cakes (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  name_np TEXT,
  description TEXT,
  description_np TEXT,
  price INTEGER NOT NULL,
  emoji TEXT
);

CREATE TABLE IF NOT EXISTS orders (
  id SERIAL PRIMARY KEY,
  customer_name TEXT NOT NULL,
  phone TEXT NOT NULL,
  cake_id INTEGER REFERENCES cakes(id),
  quantity INTEGER NOT NULL DEFAULT 1,
  message TEXT,
  created_at TIMESTAMP DEFAULT NOW()
);

-- Prices are in Nepali Rupees (NPR), per 1 pound cake
INSERT INTO cakes (name, name_np, description, description_np, price, emoji) VALUES
 ('Chocolate Truffle', 'चकलेट ट्रफल', 'Rich dark chocolate layers with silky ganache', 'गाढा चकलेट तह र मसृण गनाशसहितको केक', 1100, '🍫'),
 ('Red Velvet', 'रेड भेलभेट', 'Soft red sponge with cream cheese frosting', 'नरम रातो स्पन्ज र क्रिम चिजको लेपन', 1300, '❤️'),
 ('Black Forest', 'ब्ल्याक फरेस्ट', 'Cherries, whipped cream and chocolate shavings', 'चेरी, ह्विप्ड क्रिम र चकलेटको मिश्रण', 1000, '🍒'),
 ('Butterscotch', 'बटरस्कच', 'Crunchy caramel praline on fluffy vanilla cake', 'भ्यानिला केकमाथि कुरकुरे क्यारामेल', 950, '🍮'),
 ('Pineapple Delight', 'भुइँकटहर (पाइनएप्पल) केक', 'Fresh pineapple pieces with light cream', 'ताजा भुइँकटहरका टुक्रा र हल्का क्रिम', 900, '🍍'),
 ('Mango Cake', 'आँप केक', 'Seasonal Nepali mango with soft cream', 'मौसमी आँप र नरम क्रिमको केक', 1200, '🥭'),
 ('Anniversary Special', 'वार्षिकोत्सव विशेष केक', 'Two-layer cake decorated for your special day', 'तपाईंको विशेष दिनका लागि सजाइएको दुई तहको केक', 1600, '💐'),
 ('Birthday Special', 'जन्मदिन विशेष केक', 'Custom designed cake with your message', 'तपाईंको सन्देशसहित मनपर्ने डिजाइनको केक', 1500, '🎂');
