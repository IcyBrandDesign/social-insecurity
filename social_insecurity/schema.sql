-- --
-- Create tables
-- --

CREATE TABLE [Users] (
  id INTEGER PRIMARY KEY,
  username VARCHAR(10) CHECK (length(username) <= 10),
  first_name VARCHAR(10) CHECK (length(first_name) <= 10),
  last_name VARCHAR(10) CHECK (length(last_name) <= 10),
  [password] VARCHAR(10),
  education VARCHAR(10) CHECK (length(education) <= 10) DEFAULT 'Unknown',
  employment VARCHAR(10) CHECK (length(employment) <= 10) DEFAULT 'Unknown',
  music VARCHAR(10) CHECK (length(music) <= 10) DEFAULT 'Unknown',
  movie VARCHAR(10) CHECK (length(movie) <= 10) DEFAULT 'Unknown',
  nationality VARCHAR(10) CHECK (length(nationality) <= 10) DEFAULT 'Unknown',
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