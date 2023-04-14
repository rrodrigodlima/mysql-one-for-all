DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE artista (
    artista_id INT PRIMARY KEY auto_increment,
    nome VARCHAR(45) NOT NULL
) engine = InnoDB;

CREATE TABLE plano (
    plano_id INT PRIMARY KEY auto_increment,
    nome VARCHAR(45) NOT NULL,
    valor INT NOT NULL
) engine = InnoDB;

CREATE TABLE album (
    album_id INT PRIMARY KEY auto_increment,
    nome VARCHAR(45) NOT NULL,
    artista_id INT NOT NULL,
    FOREIGN KEY (artista_id) REFERENCES artista (artista_id)
) engine = InnoDB;

CREATE TABLE musica (
    musica_id INT PRIMARY KEY auto_increment,
    nome VARCHAR(45) NOT NULL,
    duracao INT NOT NULL,
    ano_lancamento INT NOT NULL,
    album_id INT,
    FOREIGN KEY (album_id) REFERENCES album (album_id)
) engine = InnoDB;

CREATE TABLE user (
    user_id INT PRIMARY KEY auto_increment,
    nome VARCHAR(45) NOT NULL,
    idade INT NOT NULL,
    data_assinatura DATE,
    plano_id INT NOT NULL,
    FOREIGN KEY (plano_id) REFERENCES plano (plano_id)
) engine = InnoDB;

CREATE TABLE reproduzido (
    user_id INT,
    musica_id INT,
    date DATETIME,
    CONSTRAINT PRIMARY KEY (user_id, musica_id),
    FOREIGN KEY (user_id) REFERENCES user (user_id),
    FOREIGN KEY (musica_id) REFERENCES musica (musica_id)
) engine = InnoDB;

CREATE TABLE seguidores (
  user_id INT,
  artista_id INT,
  CONSTRAINT PRIMARY KEY(user_id, artista_id),
  FOREIGN KEY(user_id) REFERENCES user (user_id),
  FOREIGN KEY(artista_id) REFERENCES artista (artista_id)
) engine = InnoDB;

INSERT INTO plano (nome, valor)
VALUES
  ('gratuito', 0),
  ('pessoal', 6.99),
  ('familiar', 7.99),
  ('universitário', 7.99);

INSERT INTO user (nome, idade, plano_id, data_assinatura)
VALUES
  ('Barbara Liskov', 82, 1, '2019-10-20'),
  ('Robert Cecil Martin', 58, 1, '2017-01-06'),
  ('Ada Lovelace', 37, 3, '2017-12-30'),
  ('Martin Fowler', 46, 3, '2017-01-17'),
  ('Sandi Metz', 58, 3, '2018-04-29'),
  ('Paulo Freire', 19, 4, '2018-02-14'),
  ('Bell Hooks', 26, 4, '2018-01-05'),
  ('Christopher Alexander', 85, 2, '2019-06-05'),
  ('Judith Butler', 45, 2, '2020-05-13'),
  ('Jorge Amado', 58, 2, '2017-02-17');

INSERT INTO artista (nome)
VALUES
  ('Beyoncé'),
  ('Queen'),
  ('Elis Regina'),
  ('Baco Exu do Blues'),
  ('Blind Guardian'),
  ('Nina Simone');


INSERT INTO album (nome, artista_id)
VALUES
  ('Renaissance', 1),
  ('Jazz', 2),
  ('Hot Space', 2),
  ('Falso Brilhante', 3),
  ('Vento de Maio', 3),
  ('QVVJFA?', 4),
  ('Somewhere Far Beyond', 5),
  ('I Put A Spell On You', 6);

INSERT INTO musica (nome, duracao, ano_lancamento, album_id)
VALUES
  ('BREAK MY SOUL', 279, 2022, 1),
  ("VIRGO'S GROOVE", 369, 2022, 1),
  ('ALIEN SUPERSTAR', 116, 2022, 1),
  ("Don't Stop Me Now", 203, 1978, 2),
  ("Under Pressure", 152, 1982, 3),
  ("Como Nossos Pais", 105, 1998, 4),
  ("O Medo de Amar é o Medo de Ser Livre", 207, 2001, 5),
  ("Samba em Paris", 267, 2003, 6),
  ("The Bard's Song", 244, 2007, 7),
  ("Feeling Good", 100, 2012, 8);

INSERT INTO seguidores (user_id, artista_id)
VALUES
  (1, 1),
  (1, 2),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (4, 4),
  (5, 5),
  (5, 6),
  (6, 1),
  (6, 6),
  (7, 6),
  (9, 3),
  (10, 2);

INSERT INTO reproduzido (user_id, musica_id, date)
VALUES
  (1, 8, "2022-02-28 10:45:55"),
  (1, 2, "2020-05-02 05:30:35"),
  (1, 10, "2020-03-06 11:22:33"),
  (2, 10, "2022-08-05 08:05:17"),
  (2, 7, "2020-01-02 07:40:33"),
  (3, 10, "2020-11-13 16:55:13"),
  (3, 2, "2020-12-05 18:38:30"),
  (4, 8, "2021-08-15 17:10:10"),
  (5, 8, "2022-01-09 01:44:33"),
  (5, 5, "2020-08-06 15:23:43"),
  (6, 7, "2017-01-24 00:31:17"),
  (6, 1, "2017-10-12 12:35:20"),
  (7, 4, "2011-12-15 22:30:49"),
  (8, 4, "2012-03-17 14:56:41"),
  (9, 9, "2022-02-24 21:14:22"),
  (10, 3, "2015-12-13 08:30:22");
  