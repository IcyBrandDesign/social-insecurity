-- --
-- Create tables
-- --

CREATE TABLE [Users] (
  id INTEGER PRIMARY KEY,
  username VARCHAR(100),
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  [password] VARCHAR(100),
  education VARCHAR(100) DEFAULT 'Unknown',
  employment VARCHAR(100) DEFAULT 'Unknown',
  music VARCHAR(100) DEFAULT 'Unknown',
  movie VARCHAR(100) DEFAULT 'Unknown',
  nationality VARCHAR(100) DEFAULT 'Unknown',
  birthday DATE DEFAULT 'Unknown'
);

CREATE TABLE [Posts](
  id INTEGER PRIMARY KEY,
  u_id INTEGER,
  content INTEGER,
  [image] VARCHAR,
  [creation_time] DATETIME,
  FOREIGN KEY (u_id) REFERENCES [Users](id)
);

CREATE TABLE [Friends](
  u_id INTEGER NOT NULL REFERENCES Users,
  f_id INTEGER NOT NULL REFERENCES Users,
  PRIMARY KEY(u_id, f_id),
  FOREIGN KEY (u_id) REFERENCES [Users](id),
  FOREIGN KEY (f_id) REFERENCES [Users](id)
);

CREATE TABLE [Comments](
  id INTEGER PRIMARY KEY,
  p_id INTEGER,
  u_id INTEGER,
  comment VARCHAR,
  [creation_time] DATETIME,
  FOREIGN KEY (p_id) REFERENCES Posts(id),
  FOREIGN KEY (u_id) REFERENCES Users(id)
);

-- --
-- Populate tables with test data
-- --

INSERT INTO Users (
  username,
  first_name,
  last_name,
  [password]
)
VALUES (
  'test',
  'Jane',
  'Doe',
  'password123'
);