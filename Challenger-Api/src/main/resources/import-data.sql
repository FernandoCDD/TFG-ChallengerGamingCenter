INSERT INTO usuario(id, username, email, password, avatar, horas_disponibles, account_non_expired, account_non_locked,credentials_non_expired, enabled) VALUES ('9cd0c43a-6a72-4967-a629-5f51bfbe5105', 'FernandoCD', 'fernandocdd02@gmail.com', '{bcrypt}$2a$12$qG8MR/W6ExYtPPdpr2Ry/eEy.x30mvHWlRyLuG6fP57lCK.6Kuz.W', 'https://ius-sdb.com/wp-content/uploads/2020/01/red-ius-dob-bosco.jpg', 5, true, true, true, true);
INSERT INTO usuario(id, username, email, password, avatar, horas_disponibles, account_non_expired, account_non_locked,credentials_non_expired, enabled) VALUES ('9cd0c43a-6a72-4967-a629-5f51bfbe5107', 'Miguel', 'miguel@gmail.com', '{bcrypt}$2a$12$qG8MR/W6ExYtPPdpr2Ry/eEy.x30mvHWlRyLuG6fP57lCK.6Kuz.W', 'https://ius-sdb.com/wp-content/uploads/2020/01/red-ius-dob-bosco.jpg', 5, true, true, true, true);
INSERT INTO usuario(id, username, email, password, avatar, horas_disponibles, account_non_expired, account_non_locked,credentials_non_expired, enabled) VALUES ('9cd0c43a-6a72-4967-a629-5f51bfbe5106', 'Luismi', 'luismi@gmail.com', '{bcrypt}$2a$12$qG8MR/W6ExYtPPdpr2Ry/eEy.x30mvHWlRyLuG6fP57lCK.6Kuz.W', 'https://ius-sdb.com/wp-content/uploads/2020/01/red-ius-dob-bosco.jpg', 5, true, true, true, true);

INSERT INTO usuario_roles(roles, usuario_id) VALUES (0, '9cd0c43a-6a72-4967-a629-5f51bfbe5105');
INSERT INTO usuario_roles(roles, usuario_id) VALUES (1, '9cd0c43a-6a72-4967-a629-5f51bfbe5107');
INSERT INTO usuario_roles(roles, usuario_id) VALUES (1, '9cd0c43a-6a72-4967-a629-5f51bfbe5106');

INSERT INTO torneo (id, juego, imagen_url, fecha) VALUES ('6c3ba0d3-0521-4401-91d3-dfb296df2444', 'League of Legends', 'https://static.wikia.nocookie.net/leagueoflegendsoficial/images/8/8c/LOL_Logo.png/revision/latest?cb=20180119195439&path-prefix=es', '2024-02-28 17:00:00');
INSERT INTO torneo (id, juego, imagen_url, fecha) VALUES ('ce6758f1-5da3-4069-8ead-04ad882011c6', 'Valorant', 'https://static.vecteezy.com/system/resources/previews/022/636/388/non_2x/valorant-logo-valorant-icon-transparent-free-png.png', '2024-03-30 12:00:00');
INSERT INTO torneo (id, juego, imagen_url, fecha) VALUES ('aaeffbb6-5dfe-432f-b02e-8f02cdd54770', 'Fortnite', 'https://static-00.iconduck.com/assets.00/games-fortnite-icon-256x256-slab131e.png', '2024-03-28 13:00:00');
INSERT INTO torneo (id, juego, imagen_url, fecha) VALUES ('1139eed6-b5ec-4407-a39b-c15520c7c323', 'Smash', 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/SmashBall.svg/2048px-SmashBall.svg.png', '2024-03-27 12:00:00');

INSERT INTO categoria (id, nombre, imagen_url) VALUES ('6f5fecf2-a032-434b-9d6f-ed18e4f7d4a0', 'Funko-Pops', 'https://drimjuguetes.vtexassets.com/arquivos/ids/767973/Funko-POP-Pokemon-Pikachu.jpg?v=637486128611200000');
INSERT INTO categoria (id, nombre, imagen_url) VALUES ('6f5fecf2-a032-434b-9d6f-ed18e4f7d4a1', 'Periféricos', 'https://m.media-amazon.com/images/I/61UxfXTUyvL._AC._SR360,460.jpg');

INSERT INTO producto (id, nombre, imagen, descripcion, precio, valoracion, categoria_id) VALUES ('3300c13e-cbd5-4870-8738-71bfceb2ba67', 'Funko-Pop: Pikachu', 'https://drimjuguetes.vtexassets.com/arquivos/ids/767973/Funko-POP-Pokemon-Pikachu.jpg?v=637486128611200000', 'Funko-Pop de pikachu', 19.99, 4.2, '6f5fecf2-a032-434b-9d6f-ed18e4f7d4a0');
INSERT INTO producto (id, nombre, imagen, descripcion, precio, valoracion, categoria_id) VALUES ('07bf149e-0701-41bd-b73d-977848b06d9e', 'Gaming Mouse Logitech G203', 'https://m.media-amazon.com/images/I/61UxfXTUyvL._AC._SR360,460.jpg', 'Logitech G203 LIGHTSYNC Ratón USB Gaming con Iluminación RGB Personalizable, 6 Botones Programables, Captor 8K para Gaming, Seguimiento de hasta 8,000 DPI, Ultra-ligero - Negro', 24.99, 4.6, '6f5fecf2-a032-434b-9d6f-ed18e4f7d4a1');
INSERT INTO producto (id, nombre, imagen, descripcion, precio, valoracion, categoria_id) VALUES ('39f50c41-1746-4c1e-8e3d-b5e00818e49e', 'Funko-Pop: Spiderman', 'https://www.funkotienda.com/wp-content/uploads/2017/02/funko-pop-spiderman-homecoming-spiderman.jpg', 'Funko-Pop de Spiderman', 12.99, 4.7, '6f5fecf2-a032-434b-9d6f-ed18e4f7d4a0');
INSERT INTO producto (id, nombre, imagen, descripcion, precio, valoracion, categoria_id) VALUES ('2a501a16-b738-4627-8248-2343d5978b9d', 'Funko-Pop: Iron Man', 'https://freakland.es/8872-large_default/funko-pop-avengers-game-iron-man-stark-tech-suit.jpg', 'Funko-Pop de Iron Man', 14.99, 4.3, '6f5fecf2-a032-434b-9d6f-ed18e4f7d4a0') ;
INSERT INTO producto (id, nombre, imagen, descripcion, precio, valoracion, categoria_id) VALUES ('7a03602f-29d4-4cb1-8aee-fd1842b9e1b0', 'Funko-Pop: Baby Yoda', 'https://m.media-amazon.com/images/I/71vGpEkVJSL._AC_UF894,1000_QL80_.jpg', 'Funko-Pop de Baby Yoda', 22.99, 4.8, '6f5fecf2-a032-434b-9d6f-ed18e4f7d4a0');
INSERT INTO producto (id, nombre, imagen, descripcion, precio, valoracion, categoria_id) VALUES ('47c0d55f-d1a5-4d3d-8043-17d36473f2dc', 'Funko-Pop: Harry Potter', 'https://img.dynos.es/img/1cb91/66ff3/1K1--XP-1-3511090101-0.jpg', 'Funko-Pop de Harry Potter', 18.99, 4.6, '6f5fecf2-a032-434b-9d6f-ed18e4f7d4a0');
INSERT INTO producto (id, nombre, imagen, descripcion, precio, valoracion, categoria_id) VALUES ('2270c451-22de-4c1d-8fc9-6ffba17bc536', 'Funko-Pop: Captain America', 'https://images-na.ssl-images-amazon.com/images/I/81-+WWCE1-L._AC_SY879_.jpg', 'Funko-Pop de Captain America', 16.99, 4.4, '6f5fecf2-a032-434b-9d6f-ed18e4f7d4a0');
INSERT INTO producto (id, nombre, imagen, descripcion, precio, valoracion, categoria_id) VALUES ('da7d9e6f-5ec5-4b9a-bb3f-170cfb484f1b', 'Funko-Pop: Naruto', 'https://m.media-amazon.com/images/I/81dR3lmzABL._AC_SL1500_.jpg', 'Funko-Pop de Naruto', 20.99, 4.5, '6f5fecf2-a032-434b-9d6f-ed18e4f7d4a0');
INSERT INTO producto (id, nombre, imagen, descripcion, precio, valoracion, categoria_id) VALUES ('8e4e70f6-5d59-42ef-b075-2a8fdcf66576', 'Funko-Pop: Groot', 'https://m.media-amazon.com/images/I/81p3iNtQKvL._AC_SL1500_.jpg', 'Funko-Pop de Groot', 17.99, 4.7, '6f5fecf2-a032-434b-9d6f-ed18e4f7d4a0');
INSERT INTO producto (id, nombre, imagen, descripcion, precio, valoracion, categoria_id) VALUES ('fa4eb2e2-e4d3-46e9-bc7b-433d5e94f303', 'Funko-Pop: Superman', 'https://m.media-amazon.com/images/I/61iXyPOFdxL._AC_SY879_.jpg', 'Funko-Pop de Superman', 19.99, 4.6, '6f5fecf2-a032-434b-9d6f-ed18e4f7d4a0');
INSERT INTO producto (id, nombre, imagen, descripcion, precio, valoracion, categoria_id) VALUES ('7e5896a0-7a90-4b09-bfe7-6e3de3c20928', 'Teclado Mecánico HyperX Alloy FPS', 'https://m.media-amazon.com/images/I/51S6XuFNlsL._AC_SY550_.jpg', 'HyperX Alloy FPS - Teclado Mecánico Gaming, Cherry MX Red (Español), LED Rojo, 100% Anti-Ghosting, Layout ES', 79.99, 4.8, '6f5fecf2-a032-434b-9d6f-ed18e4f7d4a1');
INSERT INTO producto (id, nombre, imagen, descripcion, precio, valoracion, categoria_id) VALUES ('fc12e11b-2923-47cf-a255-82b6351bea08', 'Auriculares Gaming HyperX Cloud II', 'https://m.media-amazon.com/images/I/71ybggLz1hL._AC_SY450_.jpg', 'HyperX KHX-HSCP-RD Cloud II - Cascos de Gaming para PC/PS4/Mac, Negro/Rojo', 84.99, 4.7, '6f5fecf2-a032-434b-9d6f-ed18e4f7d4a1');
INSERT INTO producto (id, nombre, imagen, descripcion, precio, valoracion, categoria_id) VALUES ('b56ee8a7-6c3d-419f-819a-3e3a7e05e5e5', 'Alfombrilla Razer Goliathus Speed', 'https://m.media-amazon.com/images/I/51yXvPIasAL._AC_SY355_.jpg', 'Razer Goliathus Speed (Extended) Alfombrilla Gaming con Superficie de Tela, Ratones con Sensor óptico, Dimensiones compactas, Tamaño Mediano', 33.99, 4.5, '6f5fecf2-a032-434b-9d6f-ed18e4f7d4a1');
INSERT INTO producto (id, nombre, imagen, descripcion, precio, valoracion, categoria_id) VALUES ('6c5c8a58-7e45-437e-ba82-298a78d107ae', 'Monitor Gaming ASUS VG248QG', 'https://m.media-amazon.com/images/I/71rjPlnmiXL._AC_SY450_.jpg', 'ASUS VG248QG - Monitor de Gaming de 24" Full-HD (1920x1080, 0.5 ms, 165 Hz) Color Negro', 199.99, 4.6, '6f5fecf2-a032-434b-9d6f-ed18e4f7d4a1');

INSERT INTO pedido (id, fecha, estado_pedido, usuario) VALUES ('5fe3b57c-57b3-487b-8b0d-68e8d0ffb07c', '2024-02-28', 'CONFIRMADO', '9cd0c43a-6a72-4967-a629-5f51bfbe5105');
INSERT INTO pedido (id, fecha, estado_pedido, usuario) VALUES ('fcbc72c9-9190-436e-b651-ff9f4bab6120', '2024-03-10', 'PENDIENTE', '9cd0c43a-6a72-4967-a629-5f51bfbe5107');
INSERT INTO pedido (id, fecha, estado_pedido, usuario) VALUES ('617c63fd-e79b-44e9-956a-ac3852a66300', '2024-03-15', 'PENDIENTE', '9cd0c43a-6a72-4967-a629-5f51bfbe5107');


INSERT INTO linea_pedido (cod_linea, pedido_id, cantidad, precio_unitario, producto_id) VALUES ('039fc705-f328-411c-b3e5-350ae380195c', '5fe3b57c-57b3-487b-8b0d-68e8d0ffb07c', 1, 19.99, '3300c13e-cbd5-4870-8738-71bfceb2ba67');

INSERT INTO dispositivo (id, num_dispositivo, tipo_dispositivo, disponible) VALUES ('d13b50ed-29a8-414e-88e3-ee5ff2520471', 1, 'ORDENADOR', true);
INSERT INTO dispositivo (id, num_dispositivo, tipo_dispositivo, disponible) VALUES ('d13b50ed-29a8-414e-88e3-ee5ff2520472', 2, 'ORDENADOR', true);
INSERT INTO dispositivo (id, num_dispositivo, tipo_dispositivo, disponible) VALUES ('d13b50ed-29a8-414e-88e3-ee5ff2520473', 3, 'ORDENADOR', true);
INSERT INTO dispositivo (id, num_dispositivo, tipo_dispositivo, disponible) VALUES ('d13b50ed-29a8-414e-88e3-ee5ff2520474', 4, 'ORDENADOR', false);
INSERT INTO dispositivo (id, num_dispositivo, tipo_dispositivo, disponible) VALUES ('d13b50ed-29a8-414e-88e3-ee5ff2520475', 5, 'ORDENADOR', true);
INSERT INTO dispositivo (id, num_dispositivo, tipo_dispositivo, disponible) VALUES ('d13b50ed-29a8-414e-88e3-ee5ff2520476', 6, 'PS4', true);
INSERT INTO dispositivo (id, num_dispositivo, tipo_dispositivo, disponible) VALUES ('d13b50ed-29a8-414e-88e3-ee5ff2520477', 7, 'PS4', true);

INSERT INTO reserva (id, desde, hasta, id_usuario, id_dispositivo) VALUES ('cd7e3872-5699-48dc-bead-38566365f759', '2024-03-20 17:00:00', '2024-03-20 20:00:00', '9cd0c43a-6a72-4967-a629-5f51bfbe5105', 'd13b50ed-29a8-414e-88e3-ee5ff2520471');

