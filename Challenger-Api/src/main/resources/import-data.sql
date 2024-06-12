INSERT INTO usuario(id, username, email, password, avatar, horas_disponibles, account_non_expired, account_non_locked,credentials_non_expired, enabled) VALUES ('9cd0c43a-6a72-4967-a629-5f51bfbe5105', 'FernandoCD', 'fernandocdd02@gmail.com', '{bcrypt}$2a$12$qG8MR/W6ExYtPPdpr2Ry/eEy.x30mvHWlRyLuG6fP57lCK.6Kuz.W', 'sheamus.jpg', 5, true, true, true, true);
INSERT INTO usuario(id, username, email, password, avatar, horas_disponibles, account_non_expired, account_non_locked,credentials_non_expired, enabled) VALUES ('9cd0c43a-6a72-4967-a629-5f51bfbe5107', 'Miguel', 'miguel@gmail.com', '{bcrypt}$2a$12$qG8MR/W6ExYtPPdpr2Ry/eEy.x30mvHWlRyLuG6fP57lCK.6Kuz.W', 'hulkHogan.png', 5, true, true, true, true);
INSERT INTO usuario(id, username, email, password, avatar, horas_disponibles, account_non_expired, account_non_locked,credentials_non_expired, enabled) VALUES ('9cd0c43a-6a72-4967-a629-5f51bfbe5106', 'Luismi', 'luismi@gmail.com', '{bcrypt}$2a$12$qG8MR/W6ExYtPPdpr2Ry/eEy.x30mvHWlRyLuG6fP57lCK.6Kuz.W', 'Macho-Man-Randy-Savage.jpg', 5, true, true, true, true);

INSERT INTO usuario_roles(roles, usuario_id) VALUES (0, '9cd0c43a-6a72-4967-a629-5f51bfbe5105');
INSERT INTO usuario_roles(roles, usuario_id) VALUES (1, '9cd0c43a-6a72-4967-a629-5f51bfbe5107');
INSERT INTO usuario_roles(roles, usuario_id) VALUES (1, '9cd0c43a-6a72-4967-a629-5f51bfbe5106');

INSERT INTO categoria (id, nombre, imagen_url) VALUES ('6f5fecf2-a032-434b-9d6f-ed18e4f7d4a0', 'Funko-Pops', 'pikachu-funko.jpg');
INSERT INTO categoria (id, nombre, imagen_url) VALUES ('6f5fecf2-a032-434b-9d6f-ed18e4f7d4a1', 'Periféricos', 'ratonLogitech.jpg');

INSERT INTO reserva (id, desde, hasta, usuario, activa, tipo_dispositivo) VALUES ('9a5f704d-17e5-43a8-8039-cfd6d8bf38ea', '2024-06-10 14:30:00', '2024-06-10 16:30:00', 'Luismi', true, 'ORDENADOR');

INSERT INTO producto (id, nombre, imagen, descripcion, precio, valoracion, en_venta, categoria_id) VALUES ('3300c13e-cbd5-4870-8738-71bfceb2ba67', 'Funko-Pop: Pikachu', 'pikachu-funko.jpg', 'Funko-Pop de pikachu', 19.99, 4.2, true, '6f5fecf2-a032-434b-9d6f-ed18e4f7d4a0');
INSERT INTO producto (id, nombre, imagen, descripcion, precio, valoracion, en_venta, categoria_id) VALUES ('07bf149e-0701-41bd-b73d-977848b06d9e', 'Gaming Mouse Logitech G203', 'ratonLogitech.jpg', 'Logitech G203 LIGHTSYNC Ratón USB Gaming con Iluminación RGB Personalizable, 6 Botones Programables, Captor 8K para Gaming, Seguimiento de hasta 8,000 DPI, Ultra-ligero - Negro', 24.99, 4.6, true, '6f5fecf2-a032-434b-9d6f-ed18e4f7d4a1');
INSERT INTO producto (id, nombre, imagen, descripcion, precio, valoracion, en_venta, categoria_id) VALUES ('39f50c41-1746-4c1e-8e3d-b5e00818e49e', 'Funko-Pop: Vegeta', 'funko-pop-10-25-cm-super-sized-vegeta-exclusivo-dragon-ball.jpg', 'Funko-Pop de Vegeta', 12.99, 4.7, true, '6f5fecf2-a032-434b-9d6f-ed18e4f7d4a0');
INSERT INTO producto (id, nombre, imagen, descripcion, precio, valoracion, en_venta, categoria_id) VALUES ('2a501a16-b738-4627-8248-2343d5978b9d', 'Funko-Pop: Darth Vader', 'DartVaderFunko.jpg', 'Funko-Pop de Darth Vader', 14.99, 4.3, true, '6f5fecf2-a032-434b-9d6f-ed18e4f7d4a0') ;
INSERT INTO producto (id, nombre, imagen, descripcion, precio, valoracion, en_venta, categoria_id) VALUES ('fa4eb2e2-e4d3-46e9-bc7b-433d5e94f303', 'Funko-Pop: Zoro Ronoa', 'funko-pop-roronoa-zoro-923-one-piece.jpg', 'Funko-Pop de Zoro', 19.99, 4.6, true, '6f5fecf2-a032-434b-9d6f-ed18e4f7d4a0');
INSERT INTO producto (id, nombre, imagen, descripcion, precio, valoracion, en_venta, categoria_id) VALUES ('7e5896a0-7a90-4b09-bfe7-6e3de3c20928', 'Teclado Mecánico HyperX Alloy FPS', 'tecladoHyperX.jpg', 'HyperX Alloy FPS - Teclado Mecánico Gaming, Cherry MX Red (Español), LED Rojo, 100% Anti-Ghosting, Layout ES', 79.99, 4.8, true, '6f5fecf2-a032-434b-9d6f-ed18e4f7d4a1');
INSERT INTO producto (id, nombre, imagen, descripcion, precio, valoracion, en_venta, categoria_id) VALUES ('fc12e11b-2923-47cf-a255-82b6351bea08', 'Auriculares Gaming HyperX Cloud II', 'tecladoHyperX.jpg', 'HyperX KHX-HSCP-RD Cloud II - Cascos de Gaming para PC/PS4/Mac, Negro/Rojo', 84.99, 4.7, true, '6f5fecf2-a032-434b-9d6f-ed18e4f7d4a1');
INSERT INTO producto (id, nombre, imagen, descripcion, precio, valoracion, en_venta, categoria_id) VALUES ('b56ee8a7-6c3d-419f-819a-3e3a7e05e5e5', 'Alfombrilla Razer Goliathus Speed', 'alfombrilla-razer-goliathus-speed-cosmic-small-galeria--2.jpg', 'Razer Goliathus Speed (Extended) Alfombrilla Gaming con Superficie de Tela, Ratones con Sensor óptico, Dimensiones compactas, Tamaño Mediano', 33.99, 4.5, true, '6f5fecf2-a032-434b-9d6f-ed18e4f7d4a1');

INSERT INTO pedido (id, fecha, estado_pedido, usuario) VALUES ('5fe3b57c-57b3-487b-8b0d-68e8d0ffb07c', '2024-02-28', 'CONFIRMADO', '9cd0c43a-6a72-4967-a629-5f51bfbe5106');
INSERT INTO pedido (id, fecha, estado_pedido, usuario) VALUES ('fcbc72c9-9190-436e-b651-ff9f4bab6120', '2024-03-10', 'PENDIENTE', '9cd0c43a-6a72-4967-a629-5f51bfbe5107');

INSERT INTO linea_pedido (cod_linea, pedido_id, cantidad, precio_unitario, producto_id) VALUES ('039fc705-f328-411c-b3e5-350ae380195c', '5fe3b57c-57b3-487b-8b0d-68e8d0ffb07c', 1, 19.99, '3300c13e-cbd5-4870-8738-71bfceb2ba67');

