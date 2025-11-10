
    

    
    /*USUARIO*/
    CREATE TABLE Users (
        id INT AUTO_INCREMENT PRIMARY KEY,
        email VARCHAR(255),
        username VARCHAR(255) NOT NULL,
        password VARCHAR(255) NOT NULL
    );
    -- MATERIAS
    Create table Conceito(
        id INT PRIMARY KEY auto_increment,  -- ID da Materia
        nome VARCHAR(255) NOT NULL,           -- Nome da Materia
        materia varchar(255) NOT NULL
    );
    Create table user_Conceito( 
		id_user int not null, 
		id_Conceito int not null, 
		concluido TINYINT NOT NULL DEFAULT 0, 
		acertos int not null DEFAULT 0, 
		erros int not null DEFAULT 0, 
		atualizado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, 
		PRIMARY KEY (id_user, id_Conceito), 
		foreign key(id_user) references Users(id), 
		foreign key(id_Conceito) references Conceito(id) 
    );

    -- Conquistas
    Create table Conquista(
        id INT PRIMARY KEY auto_increment,
        nome VARCHAR(255),
        descricao NVARCHAR(500),
        raridade NVARCHAR(500),
        trigger_key VARCHAR(255)
    );

    Create table user_Conquista(
        id_user int not null,
        id_Conquista int not null,	
        concluido TINYINT NOT NULL DEFAULT 0,  
        atualizado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        primary key (id_user, id_Conquista),
        foreign key(id_user) references Users(id),
        foreign key(id_Conquista) references Conquista(id)
    );

    -- Tabela principal com a pergunta base e placeholders
    CREATE TABLE Perguntas (
        id INT AUTO_INCREMENT PRIMARY KEY,
        materia_id INT NOT NULL,
        texto TEXT NOT NULL, -- Exemplo: "Considere a equação [v1]x + [v2] = [v3]. Descubra o valor de x."
        FOREIGN KEY (materia_id) REFERENCES Conceito(id)
    );
    -- Tabela que armazena os nomes das variáveis (ex: v1, v2) e seus possíveis valores
    CREATE TABLE Variaveis (
        id INT AUTO_INCREMENT PRIMARY KEY,
        pergunta_id INT NOT NULL,
        valores JSON NOT NULL,     -- Exemplo: '{"v1": 1, "v2": 1}'
        FOREIGN KEY (pergunta_id) REFERENCES Perguntas(id) ON DELETE CASCADE
    );
    -- Tabela opcional para armazenar Alternativas geradas (ex: se quiser salvar)
    CREATE TABLE Alternativas (
        id INT AUTO_INCREMENT PRIMARY KEY,
        Variaveis_id INT NOT NULL,
        opcoes JSON NOT NULL, -- Ex: '{"op_c": 0, "op_2": 1, "op_3": 2, "op_4": 3}' - op_c é a correta!
        FOREIGN KEY (Variaveis_id) REFERENCES Variaveis(id) ON DELETE CASCADE
    );

    
    INSERT INTO Conquista (nome, descricao, raridade, trigger_key) VALUES
	('Bem vindo', 'Conquistada por fazer a primeira conta', 'Comum', 'CRIAR_CONTA'),
	('Explorador', 'Acessou 5 conteúdos diferentes', 'Comum', 'VISITAS_5_CONTEUDOS'),
	('Curioso(a)', 'Fez a primeira pergunta para a IA', 'Comum', 'CHAT_IA_PRIMEIRA_VEZ'),
	('Navegador(a)', 'Visitou tudo do site', 'Comum', 'VISITOU_TUDO'),
	('Águia', 'Concluiu uma lição sem pedir ajuda à IA', 'Rara', 'SEM_AJUDA_IA'),
    ('Primeiros Passos', 'Concluiu a primeira lição', 'Comum', 'PRIMEIRA_LICAO'),
	('Nunca desista', 'Tentou mais de duas vezes fazer a lição depois de não passar', 'Rara', 'TENTOU_VARIAS_VEZES'),
	('Memória de elefante', 'Concluiu uma lição que já havia visto novamente', 'Rara', 'LICAO_REFEITA'),
	('Primeiro Histórico', 'Viu o histórico pelo menos uma vez das lições concluídas', 'Comum', 'ABRIU_HISTORICO'),
	('Concluiu Conjuntos', 'Finalizou todos os Conceitos de Conjuntos', 'Épica', 'CONCLUIU_CONJUNTOS'),
	('Concluiu Função Afim', 'Finalizou todos os Conceitos de Função Afim', 'Épica', 'CONCLUIU_FUNCAO_AFIM'),
	('Concluiu Função Quadrática', 'Finalizou todos os Conceitos de Função Quadrática', 'Épica', 'CONCLUIU_FUNCAO_QUADRATICA'),
	('Concluiu Função Exponencial', 'Finalizou todos os Conceitos de Função Exponencial', 'Épica', 'CONCLUIU_FUNCAO_EXPONENCIAL'),
	('Concluiu Trigonometria', 'Finalizou todos os Conceitos de Trigonometria', 'Épica', 'CONCLUIU_TRIGONOMETRIA'),
	('Concluiu Matrizes', 'Finalizou todos os Conceitos de Matrizes', 'Épica', 'CONCLUIU_MATRIZES'),
	('Concluiu Sistemas Lineares', 'Finalizou todos os Conceitos de Sistemas Lineares', 'Épica', 'CONCLUIU_SISTEMAS_LINEARES'),
	('Concluiu Função Modular', 'Finalizou todos os Conceitos de Função Modular', 'Épica', 'CONCLUIU_FUNCAO_MODULAR'),
	('Concluiu Progressão Aritmética', 'Finalizou todos os Conceitos de Progressão Aritmética', 'Épica', 'CONCLUIU_PROGRESSAO_ARITMETICA'),
	('Concluiu Progressão Geométrica', 'Finalizou todos os Conceitos de Progressão Geométrica', 'Épica', 'CONCLUIU_PROGRESSAO_GEOMETRICA');
 
    insert into Conceito(nome, materia) values
    ("Elemento — Pertinência", "Conjuntos"),
    ("Conjunto universo", "Conjuntos"),
    ("Subconjuntos", "Conjuntos"),
    ("Reunião e interseção de conjuntos", "Conjuntos"),
    ("Conjuntos numéricos", "Conjuntos"),
    ("Definição", "Função Afim"),
    ("Gráfico", "Função Afim"),
    ("Coeficientes", "Função Afim"),
    ("Zero da função", "Função Afim"),
    ("Sinal da função", "Função Afim"),
    ("Definição", "Função Quadrática"),
    ("Gráfico", "Função Quadrática"),
    ("Vértice da parábola", "Função Quadrática"),
    ("Forma canônica", "Função Quadrática"),
    ("Zeros da função", "Função Quadrática"),
    ("Sinal da função quadrática", "Função Quadrática"),
    ("Definição", "Função Exponencial"),
    ("Propriedades", "Função Exponencial"),
    ("Gráfico", "Função Exponencial"),
    ("Equações exponenciais", "Função Exponencial"),
    ("Inequações exponenciais", "Função Exponencial"),
    ("seno, cosseno, tangente", "Trigonometria"),
    ("Teorema de Pitágoras", "Trigonometria"),
    ("Ciclo trigonométrico", "Trigonometria"),
    ("Relações entre ângulos e razões", "Trigonometria"),
    ("Razões especiais", "Trigonometria"),
    ("Noção de matriz", "Matrizes"),
    ("Produto de matrizes", "Matrizes"),
    ("Matriz inversível", "Matrizes"),
    ("Matriz transposta", "Matrizes"),
    ("Teorema de Cramer", "Sistemas Lineares"),
    ("Escalonamento", "Sistemas Lineares"),
    ("Sistema homogêneo", "Sistemas Lineares"),
    ("Módulo", "Função Modular"),
    ("Função modular", "Função Modular"),
    ("Inequações modulares", "Função Modular"),
    ("Fórmula do termo geral", "Progressão Aritmética"),
    ("Soma dos termos", "Progressão Aritmética"),
    ("Interpolação", "Progressão Aritmética"),
    ("Fórmula do termo geral", "Progressão Geométrica"),
    ("Soma dos termos finita e infinita", "Progressão Geométrica"),
    ("Limite de sequência", "Progressão Geométrica");
	
    
    -- Colocando o user base (User: Ceremath, id: 1)
    
    insert into Users (email, username, password) values
    ("Ceremath.tcc@gmail.com", "Ceremath", "$2y$10$2oxa34WZNDebOzzG0oe4Su2i02by9WUfhahTD9PEhpq8lLeA1d0zu");
    
    INSERT INTO user_Conceito (id_user, id_Conceito) VALUES
	(1, 1),
	(1, 2),
	(1, 3),
	(1, 4),
	(1, 5),
	(1, 6),
	(1, 7),
	(1, 8),
	(1, 9),
	(1, 10),
	(1, 11),
	(1, 12),
	(1, 13),
	(1, 14),
	(1, 15),
	(1, 16),
	(1, 17),
	(1, 18),
	(1, 19),
	(1, 20),
	(1, 21),
	(1, 22),
	(1, 23),
	(1, 24),
	(1, 25),
	(1, 26),
	(1, 27),
	(1, 28),
	(1, 29),
	(1, 30),
	(1, 31),
	(1, 32),
	(1, 33),
	(1, 34),
	(1, 35),
	(1, 36),
	(1, 37),
	(1, 38),
	(1, 39),
	(1, 40),
	(1, 41);
    
    INSERT INTO user_Conquista (id_user, id_Conquista, concluido) VALUES
	(1, 1, 1),
	(1, 2, 0),
	(1, 3, 0),
	(1, 4, 0),
	(1, 5, 0),
	(1, 6, 0),
	(1, 7, 0),
	(1, 8, 0),
	(1, 9, 0),
	(1, 10, 0),
	(1, 11, 0),
	(1, 12, 0),
	(1, 13, 0),
	(1, 14, 0),
	(1, 15, 0),
	(1, 16, 0),
	(1, 17, 0),
	(1, 18, 0);
    
    
    
    
    
    
    
    
    
    
    
    
    
    -- Inserindo as questoes, variações e as Alternativas para o banco
    -- ==========================================
-- Conceito 1: Elemento — Pertinência (Conjuntos)
-- materia_id = 1
-- ==========================================

-- Pergunta 1
INSERT INTO Perguntas (materia_id, texto)
VALUES (1, 'Dado o conjunto A = {v1, v2, v3}, o elemento v4 pertence ao conjunto A?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"1","v2":"2","v3":"3","v4":"2"}'),
(@pergunta_id, '{"v1":"1","v2":"3","v3":"5","v4":"4"}'),
(@pergunta_id, '{"v1":"a","v2":"b","v3":"c","v4":"b"}'),
(@pergunta_id, '{"v1":"x","v2":"y","v3":"z","v4":"w"}'),
(@pergunta_id, '{"v1":"brasil","v2":"argentina","v3":"chile","v4":"uruguai"}'),
(@pergunta_id, '{"v1":"azul","v2":"verde","v3":"amarelo","v4":"verde"}'),
(@pergunta_id, '{"v1":"10","v2":"20","v3":"30","v4":"10"}'),
(@pergunta_id, '{"v1":"0","v2":"1","v3":"2","v4":"3"}'),
(@pergunta_id, '{"v1":"5","v2":"10","v3":"15","v4":"20"}'),
(@pergunta_id, '{"v1":"a","v2":"e","v3":"i","v4":"x"}');

-- Alternativas (Sim / Não)
INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(1, '{"alt_c":"Sim","alt_2":"Não"}'),
(2, '{"alt_c":"Não","alt_2":"Sim"}'),
(3, '{"alt_c":"Sim","alt_2":"Não"}'),
(4, '{"alt_c":"Não","alt_2":"Sim"}'),
(5, '{"alt_c":"Não","alt_2":"Sim"}'),
(6, '{"alt_c":"Sim","alt_2":"Não"}'),
(7, '{"alt_c":"Sim","alt_2":"Não"}'),
(8, '{"alt_c":"Não","alt_2":"Sim"}'),
(9, '{"alt_c":"Não","alt_2":"Sim"}'),
(10, '{"alt_c":"Não","alt_2":"Sim"}');

-- Pergunta 2
INSERT INTO Perguntas (materia_id, texto)
VALUES (1, 'O elemento v1 está presente no conjunto A = {v2, v3, v4}?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"1","v2":"1","v3":"2","v4":"3"}'),
(@pergunta_id, '{"v1":"b","v2":"a","v3":"b","v4":"c"}'),
(@pergunta_id, '{"v1":"10","v2":"20","v3":"30","v4":"40"}'),
(@pergunta_id, '{"v1":"x","v2":"y","v3":"z","v4":"w"}'),
(@pergunta_id, '{"v1":"azul","v2":"verde","v3":"amarelo","v4":"branco"}'),
(@pergunta_id, '{"v1":"3","v2":"1","v3":"3","v4":"5"}'),
(@pergunta_id, '{"v1":"c","v2":"a","v3":"b","v4":"c"}'),
(@pergunta_id, '{"v1":"9","v2":"7","v3":"8","v4":"10"}'),
(@pergunta_id, '{"v1":"p","v2":"q","v3":"r","v4":"s"}'),
(@pergunta_id, '{"v1":"verde","v2":"vermelho","v3":"azul","v4":"roxo"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(11, '{"alt_c":"Sim","alt_2":"Não"}'),
(12, '{"alt_c":"Sim","alt_2":"Não"}'),
(13, '{"alt_c":"Não","alt_2":"Sim"}'),
(14, '{"alt_c":"Não","alt_2":"Sim"}'),
(15, '{"alt_c":"Não","alt_2":"Sim"}'),
(16, '{"alt_c":"Sim","alt_2":"Não"}'),
(17, '{"alt_c":"Sim","alt_2":"Não"}'),
(18, '{"alt_c":"Não","alt_2":"Sim"}'),
(19, '{"alt_c":"Não","alt_2":"Sim"}'),
(20, '{"alt_c":"Não","alt_2":"Sim"}');

-- ==========================================
-- PERGUNTA 3
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (1, 'O número v1 pertence ao conjunto B = {v2, v3, v4, v5}?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1": 3, "v2": 1, "v3": 2, "v4": 3, "v5": 4}'),
(@pergunta_id, '{"v1": 6, "v2": 2, "v3": 4, "v4": 8, "v5": 10}'),
(@pergunta_id, '{"v1": "a", "v2": "b", "v3": "c", "v4": "d", "v5": "e"}'),
(@pergunta_id, '{"v1": "b", "v2": "a", "v3": "b", "v4": "c", "v5": "d"}'),
(@pergunta_id, '{"v1": "m", "v2": "n", "v3": "o", "v4": "p", "v5": "q"}'),
(@pergunta_id, '{"v1": 20, "v2": 10, "v3": 15, "v4": 25, "v5": 30}'),
(@pergunta_id, '{"v1": "verde", "v2": "azul", "v3": "vermelho", "v4": "verde", "v5": "amarelo"}'),
(@pergunta_id, '{"v1": 7, "v2": 1, "v3": 3, "v4": 5, "v5": 7}'),
(@pergunta_id, '{"v1": "x", "v2": "y", "v3": "z", "v4": "w", "v5": "t"}'),
(@pergunta_id, '{"v1": 9, "v2": 1, "v3": 2, "v4": 3, "v5": 4}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(21, '{"alt_c":"Sim","alt_2":"Não"}'),
(22, '{"alt_c":"Não","alt_2":"Sim"}'),
(23, '{"alt_c":"Não","alt_2":"Sim"}'),
(24, '{"alt_c":"Sim","alt_2":"Não"}'),
(25, '{"alt_c":"Não","alt_2":"Sim"}'),
(26, '{"alt_c":"Não","alt_2":"Sim"}'),
(27, '{"alt_c":"Sim","alt_2":"Não"}'),
(28, '{"alt_c":"Sim","alt_2":"Não"}'),
(29, '{"alt_c":"Não","alt_2":"Sim"}'),
(30, '{"alt_c":"Não","alt_2":"Sim"}');

-- ==========================================
-- PERGUNTA 4
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (1, 'Entre os elementos do conjunto C = {v1, v2, v3, v4}, qual deles pertence a C?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":1,"v2":2,"v3":3,"v4":4}'),
(@pergunta_id, '{"v1":"a","v2":"b","v3":"c","v4":"d"}'),
(@pergunta_id, '{"v1":"x","v2":"y","v3":"z","v4":"w"}'),
(@pergunta_id, '{"v1":5,"v2":10,"v3":15,"v4":20}'),
(@pergunta_id, '{"v1":"brasil","v2":"argentina","v3":"chile","v4":"uruguai"}'),
(@pergunta_id, '{"v1":"vermelho","v2":"verde","v3":"azul","v4":"amarelo"}'),
(@pergunta_id, '{"v1":11,"v2":12,"v3":13,"v4":14}'),
(@pergunta_id, '{"v1":"p","v2":"q","v3":"r","v4":"s"}'),
(@pergunta_id, '{"v1":"m","v2":"n","v3":"o","v4":"p"}'),
(@pergunta_id, '{"v1":"domingo","v2":"segunda","v3":"terça","v4":"quarta"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(31, '{"alt_c":"1","alt_2":"6","alt_3":"7","alt_4":"8"}'),
(32, '{"alt_c":"a","alt_2":"e","alt_3":"f","alt_4":"g"}'),
(33, '{"alt_c":"x","alt_2":"y","alt_3":"z","alt_4":"w"}'),
(34, '{"alt_c":"10","alt_2":"25","alt_3":"30","alt_4":"35"}'),
(35, '{"alt_c":"chile","alt_2":"peru","alt_3":"mexico","alt_4":"venezuela"}'),
(36, '{"alt_c":"verde","alt_2":"roxo","alt_3":"preto","alt_4":"cinza"}'),
(37, '{"alt_c":"12","alt_2":"15","alt_3":"17","alt_4":"18"}'),
(38, '{"alt_c":"r","alt_2":"t","alt_3":"u","alt_4":"v"}'),
(39, '{"alt_c":"n","alt_2":"q","alt_3":"r","alt_4":"s"}'),
(40, '{"alt_c":"terça","alt_2":"quinta","alt_3":"sexta","alt_4":"sábado"}');

-- ==========================================
-- PERGUNTA 5
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (1, 'O elemento v1 pertence ao conjunto das vogais?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"a"}'),
(@pergunta_id, '{"v1":"b"}'),
(@pergunta_id, '{"v1":"c"}'),
(@pergunta_id, '{"v1":"e"}'),
(@pergunta_id, '{"v1":"i"}'),
(@pergunta_id, '{"v1":"o"}'),
(@pergunta_id, '{"v1":"u"}'),
(@pergunta_id, '{"v1":"x"}'),
(@pergunta_id, '{"v1":"y"}'),
(@pergunta_id, '{"v1":"z"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(41, '{"alt_c":"Sim","alt_2":"Não"}'),
(42, '{"alt_c":"Não","alt_2":"Sim"}'),
(43, '{"alt_c":"Não","alt_2":"Sim"}'),
(44, '{"alt_c":"Sim","alt_2":"Não"}'),
(45, '{"alt_c":"Sim","alt_2":"Não"}'),
(46, '{"alt_c":"Sim","alt_2":"Não"}'),
(47, '{"alt_c":"Sim","alt_2":"Não"}'),
(48, '{"alt_c":"Não","alt_2":"Sim"}'),
(49, '{"alt_c":"Não","alt_2":"Sim"}'),
(50, '{"alt_c":"Não","alt_2":"Sim"}');

-- ==========================================
--
-- CONJUNTO UNIVERSO
--
--
-- PERGUNTA 1
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (2, 'Considere o conjunto universo U = {v1, v2, v3, v4, v5}. Qual desses elementos pertence ao conjunto universo U?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"1","v2":"2","v3":"3","v4":"4","v5":"5"}'),
(@pergunta_id, '{"v1":"a","v2":"b","v3":"c","v4":"d","v5":"e"}'),
(@pergunta_id, '{"v1":"x","v2":"y","v3":"z","v4":"w","v5":"t"}'),
(@pergunta_id, '{"v1":"brasil","v2":"chile","v3":"peru","v4":"uruguai","v5":"argentina"}'),
(@pergunta_id, '{"v1":"vermelho","v2":"verde","v3":"azul","v4":"amarelo","v5":"branco"}'),
(@pergunta_id, '{"v1":"10","v2":"20","v3":"30","v4":"40","v5":"50"}'),
(@pergunta_id, '{"v1":"m","v2":"n","v3":"o","v4":"p","v5":"q"}'),
(@pergunta_id, '{"v1":"1","v2":"3","v3":"5","v4":"7","v5":"9"}'),
(@pergunta_id, '{"v1":"domingo","v2":"segunda","v3":"terça","v4":"quarta","v5":"quinta"}'),
(@pergunta_id, '{"v1":"alfa","v2":"beta","v3":"gama","v4":"delta","v5":"ômega"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(51, '{"alt_c":"3","alt_2":"6","alt_3":"7","alt_4":"8"}'),
(52, '{"alt_c":"c","alt_2":"f","alt_3":"g","alt_4":"h"}'),
(53, '{"alt_c":"z","alt_2":"a","alt_3":"b","alt_4":"c"}'),
(54, '{"alt_c":"peru","alt_2":"méxico","alt_3":"colômbia","alt_4":"venezuela"}'),
(55, '{"alt_c":"azul","alt_2":"cinza","alt_3":"preto","alt_4":"marrom"}'),
(56, '{"alt_c":"30","alt_2":"60","alt_3":"70","alt_4":"80"}'),
(57, '{"alt_c":"o","alt_2":"r","alt_3":"s","alt_4":"t"}'),
(58, '{"alt_c":"5","alt_2":"10","alt_3":"15","alt_4":"20"}'),
(59, '{"alt_c":"terça","alt_2":"sexta","alt_3":"sábado","alt_4":"domingo"}'),
(60, '{"alt_c":"gama","alt_2":"épsilon","alt_3":"zeta","alt_4":"teta"}');

-- ==========================================
-- PERGUNTA 2
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (2, 'Qual elemento não pertence ao conjunto universo U = {v1, v2, v3, v4, v5}?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"1","v2":"2","v3":"3","v4":"4","v5":"5"}'),
(@pergunta_id, '{"v1":"a","v2":"b","v3":"c","v4":"d","v5":"e"}'),
(@pergunta_id, '{"v1":"x","v2":"y","v3":"z","v4":"w","v5":"t"}'),
(@pergunta_id, '{"v1":"brasil","v2":"chile","v3":"peru","v4":"uruguai","v5":"argentina"}'),
(@pergunta_id, '{"v1":"vermelho","v2":"verde","v3":"azul","v4":"amarelo","v5":"branco"}'),
(@pergunta_id, '{"v1":"10","v2":"20","v3":"30","v4":"40","v5":"50"}'),
(@pergunta_id, '{"v1":"m","v2":"n","v3":"o","v4":"p","v5":"q"}'),
(@pergunta_id, '{"v1":"1","v2":"3","v3":"5","v4":"7","v5":"9"}'),
(@pergunta_id, '{"v1":"domingo","v2":"segunda","v3":"terça","v4":"quarta","v5":"quinta"}'),
(@pergunta_id, '{"v1":"alfa","v2":"beta","v3":"gama","v4":"delta","v5":"ômega"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(61, '{"alt_c":"6","alt_2":"1","alt_3":"2","alt_4":"3"}'),
(62, '{"alt_c":"f","alt_2":"a","alt_3":"b","alt_4":"c"}'),
(63, '{"alt_c":"u","alt_2":"x","alt_3":"y","alt_4":"z"}'),
(64, '{"alt_c":"méxico","alt_2":"brasil","alt_3":"chile","alt_4":"peru"}'),
(65, '{"alt_c":"preto","alt_2":"vermelho","alt_3":"verde","alt_4":"azul"}'),
(66, '{"alt_c":"60","alt_2":"10","alt_3":"20","alt_4":"30"}'),
(67, '{"alt_c":"r","alt_2":"m","alt_3":"n","alt_4":"o"}'),
(68, '{"alt_c":"11","alt_2":"1","alt_3":"3","alt_4":"5"}'),
(69, '{"alt_c":"sexta","alt_2":"domingo","alt_3":"segunda","alt_4":"terça"}'),
(70, '{"alt_c":"épsilon","alt_2":"alfa","alt_3":"beta","alt_4":"gama"}');

-- ==========================================
-- PERGUNTA 3
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (2, 'Dado o conjunto universo U = {v1, v2, v3, v4, v5}, quais desses conjuntos representa corretamente o universo?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"1","v2":"2","v3":"3","v4":"4","v5":"5"}'),
(@pergunta_id, '{"v1":"a","v2":"b","v3":"c","v4":"d","v5":"e"}'),
(@pergunta_id, '{"v1":"x","v2":"y","v3":"z","v4":"w","v5":"t"}'),
(@pergunta_id, '{"v1":"brasil","v2":"chile","v3":"peru","v4":"uruguai","v5":"paraguai"}'),
(@pergunta_id, '{"v1":"vermelho","v2":"verde","v3":"azul","v4":"amarelo","v5":"branco"}'),
(@pergunta_id, '{"v1":"10","v2":"20","v3":"30","v4":"40","v5":"50"}'),
(@pergunta_id, '{"v1":"m","v2":"n","v3":"o","v4":"p","v5":"q"}'),
(@pergunta_id, '{"v1":"domingo","v2":"segunda","v3":"terça","v4":"quarta","v5":"quinta"}'),
(@pergunta_id, '{"v1":"alfa","v2":"beta","v3":"gama","v4":"delta","v5":"ômega"}'),
(@pergunta_id, '{"v1":"1","v2":"3","v3":"5","v4":"7","v5":"9"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(71, '{"alt_c":"{1,2,3,4,5}","alt_2":"{1,2}","alt_3":"{2,3}","alt_4":"{3,4}"}'),
(72, '{"alt_c":"{a,b,c,d,e}","alt_2":"{a,b}","alt_3":"{b,c}","alt_4":"{c,d}"}'),
(73, '{"alt_c":"{x,y,z,w,t}","alt_2":"{x,y}","alt_3":"{y,z}","alt_4":"{z,w}"}'),
(74, '{"alt_c":"{brasil,chile,peru,uruguai,paraguai}","alt_2":"{brasil,chile}","alt_3":"{chile,peru}","alt_4":"{peru,uruguai}"}'),
(75, '{"alt_c":"{vermelho,verde,azul,amarelo,branco}","alt_2":"{vermelho,verde}","alt_3":"{verde,azul}","alt_4":"{azul,amarelo}"}'),
(76, '{"alt_c":"{10,20,30,40,50}","alt_2":"{10,20}","alt_3":"{20,30}","alt_4":"{30,40}"}'),
(77, '{"alt_c":"{m,n,o,p,q}","alt_2":"{m,n}","alt_3":"{n,o}","alt_4":"{o,p}"}'),
(78, '{"alt_c":"{domingo,segunda,terça,quarta,quinta}","alt_2":"{domingo,segunda}","alt_3":"{segunda,terça}","alt_4":"{terça,quarta}"}'),
(79, '{"alt_c":"{alfa,beta,gama,delta,ômega}","alt_2":"{alfa,beta}","alt_3":"{beta,gama}","alt_4":"{gama,delta}"}'),
(80, '{"alt_c":"{1,3,5,7,9}","alt_2":"{1,3}","alt_3":"{3,5}","alt_4":"{5,7}"}');

-- ==========================================
-- PERGUNTA 4
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (2, 'Se o conjunto universo U = {v1, v2, v3, v4, v5}, o elemento v6 pertence a U?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"1","v2":"2","v3":"3","v4":"4","v5":"5","v6":"6"}'),
(@pergunta_id, '{"v1":"a","v2":"b","v3":"c","v4":"d","v5":"e","v6":"f"}'),
(@pergunta_id, '{"v1":"x","v2":"y","v3":"z","v4":"w","v5":"t","v6":"u"}'),
(@pergunta_id, '{"v1":"brasil","v2":"chile","v3":"peru","v4":"uruguai","v5":"argentina","v6":"méxico"}'),
(@pergunta_id, '{"v1":"vermelho","v2":"verde","v3":"azul","v4":"amarelo","v5":"branco","v6":"preto"}'),
(@pergunta_id, '{"v1":"10","v2":"20","v3":"30","v4":"40","v5":"50","v6":"60"}'),
(@pergunta_id, '{"v1":"m","v2":"n","v3":"o","v4":"p","v5":"q","v6":"r"}'),
(@pergunta_id, '{"v1":"1","v2":"3","v3":"5","v4":"7","v5":"9","v6":"11"}'),
(@pergunta_id, '{"v1":"domingo","v2":"segunda","v3":"terça","v4":"quarta","v5":"quinta","v6":"sexta"}'),
(@pergunta_id, '{"v1":"alfa","v2":"beta","v3":"gama","v4":"delta","v5":"ômega","v6":"épsilon"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(81, '{"alt_c":"Não","alt_2":"Sim"}'),
(82, '{"alt_c":"Não","alt_2":"Sim"}'),
(83, '{"alt_c":"Não","alt_2":"Sim"}'),
(84, '{"alt_c":"Não","alt_2":"Sim"}'),
(85, '{"alt_c":"Não","alt_2":"Sim"}'),
(86, '{"alt_c":"Não","alt_2":"Sim"}'),
(87, '{"alt_c":"Não","alt_2":"Sim"}'),
(88, '{"alt_c":"Não","alt_2":"Sim"}'),
(89, '{"alt_c":"Não","alt_2":"Sim"}'),
(90, '{"alt_c":"Não","alt_2":"Sim"}');

-- ==========================================
-- PERGUNTA 5
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (2, 'Qual é o número de elementos do conjunto universo U = {v1, v2, v3, v4, v5}?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"1","v2":"2","v3":"3","v4":"4","v5":"5"}'),
(@pergunta_id, '{"v1":"a","v2":"b","v3":"c","v4":"d","v5":"e"}'),
(@pergunta_id, '{"v1":"x","v2":"y","v3":"z","v4":"w","v5":"t"}'),
(@pergunta_id, '{"v1":"brasil","v2":"chile","v3":"peru","v4":"uruguai","v5":"argentina"}'),
(@pergunta_id, '{"v1":"vermelho","v2":"verde","v3":"azul","v4":"amarelo","v5":"branco"}'),
(@pergunta_id, '{"v1":"10","v2":"20","v3":"30","v4":"40","v5":"50"}'),
(@pergunta_id, '{"v1":"m","v2":"n","v3":"o","v4":"p","v5":"q"}'),
(@pergunta_id, '{"v1":"domingo","v2":"segunda","v3":"terça","v4":"quarta","v5":"quinta"}'),
(@pergunta_id, '{"v1":"alfa","v2":"beta","v3":"gama","v4":"delta","v5":"ômega"}'),
(@pergunta_id, '{"v1":"1","v2":"3","v3":"5","v4":"7","v5":"9"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(91, '{"alt_c":"5","alt_2":"4","alt_3":"6","alt_4":"3"}'),
(92, '{"alt_c":"5","alt_2":"4","alt_3":"6","alt_4":"3"}'),
(93, '{"alt_c":"5","alt_2":"4","alt_3":"6","alt_4":"3"}'),
(94, '{"alt_c":"5","alt_2":"4","alt_3":"6","alt_4":"3"}'),
(95, '{"alt_c":"5","alt_2":"4","alt_3":"6","alt_4":"3"}'),
(96, '{"alt_c":"5","alt_2":"4","alt_3":"6","alt_4":"3"}'),
(97, '{"alt_c":"5","alt_2":"4","alt_3":"6","alt_4":"3"}'),
(98, '{"alt_c":"5","alt_2":"4","alt_3":"6","alt_4":"3"}'),
(99, '{"alt_c":"5","alt_2":"4","alt_3":"6","alt_4":"3"}'),
(100, '{"alt_c":"5","alt_2":"4","alt_3":"6","alt_4":"3"}');

-- ========================================== 
--
-- SUBCONJUNTO
--
--
-- PERGUNTA 1 
-- ========================================== 
INSERT INTO Perguntas (materia_id, texto)
VALUES (3, 'Dado o conjunto A = {v1, v2, v3} e o conjunto B = {v1, v2, v3, v4}, A é subconjunto de B?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"1","v2":"2","v3":"3","v4":"4"}'),
(@pergunta_id, '{"v1":"a","v2":"b","v3":"c","v4":"d"}'),
(@pergunta_id, '{"v1":"x","v2":"y","v3":"z","v4":"w"}'),
(@pergunta_id, '{"v1":"m","v2":"n","v3":"o","v4":"p"}'),
(@pergunta_id, '{"v1":"10","v2":"20","v3":"30","v4":"40"}'),
(@pergunta_id, '{"v1":"brasil","v2":"chile","v3":"peru","v4":"uruguai"}'),
(@pergunta_id, '{"v1":"vermelho","v2":"verde","v3":"azul","v4":"amarelo"}'),
(@pergunta_id, '{"v1":"alfa","v2":"beta","v3":"gama","v4":"delta"}'),
(@pergunta_id, '{"v1":"maca","v2":"pera","v3":"uva","v4":"banana"}'),
(@pergunta_id, '{"v1":"domingo","v2":"segunda","v3":"terça","v4":"quarta"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(101, '{"alt_c":"Sim","alt_2":"Não"}'),
(102, '{"alt_c":"Sim","alt_2":"Não"}'),
(103, '{"alt_c":"Sim","alt_2":"Não"}'),
(104, '{"alt_c":"Sim","alt_2":"Não"}'),
(105, '{"alt_c":"Sim","alt_2":"Não"}'),
(106, '{"alt_c":"Sim","alt_2":"Não"}'),
(107, '{"alt_c":"Sim","alt_2":"Não"}'),
(108, '{"alt_c":"Sim","alt_2":"Não"}'),
(109, '{"alt_c":"Sim","alt_2":"Não"}'),
(110, '{"alt_c":"Sim","alt_2":"Não"}');

-- ==========================================
-- PERGUNTA 2
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (3, 'O conjunto A = {v1, v2} é subconjunto próprio do conjunto B = {v1, v2, v3}?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"1","v2":"2","v3":"3"}'),
(@pergunta_id, '{"v1":"a","v2":"b","v3":"c"}'),
(@pergunta_id, '{"v1":"x","v2":"y","v3":"z"}'),
(@pergunta_id, '{"v1":"m","v2":"n","v3":"o"}'),
(@pergunta_id, '{"v1":"azul","v2":"verde","v3":"amarelo"}'),
(@pergunta_id, '{"v1":"brasil","v2":"chile","v3":"peru"}'),
(@pergunta_id, '{"v1":"10","v2":"20","v3":"30"}'),
(@pergunta_id, '{"v1":"maca","v2":"pera","v3":"uva"}'),
(@pergunta_id, '{"v1":"α","v2":"β","v3":"γ"}'),
(@pergunta_id, '{"v1":"domingo","v2":"segunda","v3":"terça"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(111, '{"alt_c":"Sim","alt_2":"Não","alt_3":"Sim, mas não propriamente","alt_4":"Não sei"}'),
(112, '{"alt_c":"Sim","alt_2":"Não","alt_3":"Sim, mas não propriamente","alt_4":"Não sei"}'),
(113, '{"alt_c":"Sim","alt_2":"Não","alt_3":"Sim, mas não propriamente","alt_4":"Não sei"}'),
(114, '{"alt_c":"Sim","alt_2":"Não","alt_3":"Sim, mas não propriamente","alt_4":"Não sei"}'),
(115, '{"alt_c":"Sim","alt_2":"Não","alt_3":"Sim, mas não propriamente","alt_4":"Não sei"}'),
(116, '{"alt_c":"Sim","alt_2":"Não","alt_3":"Sim, mas não propriamente","alt_4":"Não sei"}'),
(117, '{"alt_c":"Sim","alt_2":"Não","alt_3":"Sim, mas não propriamente","alt_4":"Não sei"}'),
(118, '{"alt_c":"Sim","alt_2":"Não","alt_3":"Sim, mas não propriamente","alt_4":"Não sei"}'),
(119, '{"alt_c":"Sim","alt_2":"Não","alt_3":"Sim, mas não propriamente","alt_4":"Não sei"}'),
(120, '{"alt_c":"Sim","alt_2":"Não","alt_3":"Sim, mas não propriamente","alt_4":"Não sei"}');

-- ==========================================
-- PERGUNTA 3
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (3, 'Se A = {v1, v2, v3} e B = {v1, v2, v3}, A é subconjunto próprio de B?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"1","v2":"2","v3":"3"}'),
(@pergunta_id, '{"v1":"a","v2":"b","v3":"c"}'),
(@pergunta_id, '{"v1":"x","v2":"y","v3":"z"}'),
(@pergunta_id, '{"v1":"m","v2":"n","v3":"o"}'),
(@pergunta_id, '{"v1":"azul","v2":"verde","v3":"amarelo"}'),
(@pergunta_id, '{"v1":"brasil","v2":"chile","v3":"peru"}'),
(@pergunta_id, '{"v1":"10","v2":"20","v3":"30"}'),
(@pergunta_id, '{"v1":"maca","v2":"pera","v3":"uva"}'),
(@pergunta_id, '{"v1":"α","v2":"β","v3":"γ"}'),
(@pergunta_id, '{"v1":"domingo","v2":"segunda","v3":"terça"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(121, '{"alt_c":"Não","alt_2":"Sim","alt_3":"Não sei","alt_4":"Sim, parcialmente"}'),
(122, '{"alt_c":"Não","alt_2":"Sim","alt_3":"Não sei","alt_4":"Sim, parcialmente"}'),
(123, '{"alt_c":"Não","alt_2":"Sim","alt_3":"Não sei","alt_4":"Sim, parcialmente"}'),
(124, '{"alt_c":"Não","alt_2":"Sim","alt_3":"Não sei","alt_4":"Sim, parcialmente"}'),
(125, '{"alt_c":"Não","alt_2":"Sim","alt_3":"Não sei","alt_4":"Sim, parcialmente"}'),
(126, '{"alt_c":"Não","alt_2":"Sim","alt_3":"Não sei","alt_4":"Sim, parcialmente"}'),
(127, '{"alt_c":"Não","alt_2":"Sim","alt_3":"Não sei","alt_4":"Sim, parcialmente"}'),
(128, '{"alt_c":"Não","alt_2":"Sim","alt_3":"Não sei","alt_4":"Sim, parcialmente"}'),
(129, '{"alt_c":"Não","alt_2":"Sim","alt_3":"Não sei","alt_4":"Sim, parcialmente"}'),
(130, '{"alt_c":"Não","alt_2":"Sim","alt_3":"Não sei","alt_4":"Sim, parcialmente"}');

-- ==========================================
-- PERGUNTA 4 (corrigida)
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (3, 'O conjunto vazio é subconjunto de qualquer conjunto?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"∅"}'),
(@pergunta_id, '{"v1":"{}"}'),
(@pergunta_id, '{"v1":"conjunto vazio"}'),
(@pergunta_id, '{"v1":"Ø"}'),
(@pergunta_id, '{"v1":"nenhum elemento"}'),
(@pergunta_id, '{"v1":"sem elementos"}'),
(@pergunta_id, '{"v1":"nulo"}'),
(@pergunta_id, '{"v1":"sem membros"}'),
(@pergunta_id, '{"v1":"zero elementos"}'),
(@pergunta_id, '{"v1":"vazio"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(131, '{"alt_c":"Sim","alt_2":"Não"}'),
(132, '{"alt_c":"Sim","alt_2":"Não"}'),
(133, '{"alt_c":"Sim","alt_2":"Não"}'),
(134, '{"alt_c":"Sim","alt_2":"Não"}'),
(135, '{"alt_c":"Sim","alt_2":"Não"}'),
(136, '{"alt_c":"Sim","alt_2":"Não"}'),
(137, '{"alt_c":"Sim","alt_2":"Não"}'),
(138, '{"alt_c":"Sim","alt_2":"Não"}'),
(139, '{"alt_c":"Sim","alt_2":"Não"}'),
(140, '{"alt_c":"Sim","alt_2":"Não"}');

-- ==========================================
-- PERGUNTA 5 (corrigida)
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (3, 'Se A é subconjunto de B e B é subconjunto de C, então A é subconjunto de C?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"1","v2":"2","v3":"3"}'),
(@pergunta_id, '{"v1":"a","v2":"b","v3":"c"}'),
(@pergunta_id, '{"v1":"x","v2":"y","v3":"z"}'),
(@pergunta_id, '{"v1":"m","v2":"n","v3":"o"}'),
(@pergunta_id, '{"v1":"azul","v2":"verde","v3":"amarelo"}'),
(@pergunta_id, '{"v1":"brasil","v2":"chile","v3":"peru"}'),
(@pergunta_id, '{"v1":"10","v2":"20","v3":"30"}'),
(@pergunta_id, '{"v1":"maca","v2":"pera","v3":"uva"}'),
(@pergunta_id, '{"v1":"α","v2":"β","v3":"γ"}'),
(@pergunta_id, '{"v1":"domingo","v2":"segunda","v3":"terça"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(141, '{"alt_c":"Sim","alt_2":"Não"}'),
(142, '{"alt_c":"Sim","alt_2":"Não"}'),
(143, '{"alt_c":"Sim","alt_2":"Não"}'),
(144, '{"alt_c":"Sim","alt_2":"Não"}'),
(145, '{"alt_c":"Sim","alt_2":"Não"}'),
(146, '{"alt_c":"Sim","alt_2":"Não"}'),
(147, '{"alt_c":"Sim","alt_2":"Não"}'),
(148, '{"alt_c":"Sim","alt_2":"Não"}'),
(149, '{"alt_c":"Sim","alt_2":"Não"}'),
(150, '{"alt_c":"Sim","alt_2":"Não"}');

-- ==========================================
--
-- REUNIÃO E INTERSECÇÃO 
--
--
-- PERGUNTA 1
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (4, 'Dado A = {v1, v2, v3} e B = {v3, v4, v5}, qual é A ∪ B (reunião de A e B)?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"1","v2":"2","v3":"3","v4":"4","v5":"5"}'),
(@pergunta_id, '{"v1":"a","v2":"b","v3":"c","v4":"d","v5":"e"}'),
(@pergunta_id, '{"v1":"x","v2":"y","v3":"z","v4":"w","v5":"t"}'),
(@pergunta_id, '{"v1":"m","v2":"n","v3":"o","v4":"p","v5":"q"}'),
(@pergunta_id, '{"v1":"vermelho","v2":"azul","v3":"verde","v4":"amarelo","v5":"roxo"}'),
(@pergunta_id, '{"v1":"10","v2":"20","v3":"30","v4":"40","v5":"50"}'),
(@pergunta_id, '{"v1":"brasil","v2":"chile","v3":"peru","v4":"uruguai","v5":"argentina"}'),
(@pergunta_id, '{"v1":"α","v2":"β","v3":"γ","v4":"δ","v5":"ε"}'),
(@pergunta_id, '{"v1":"1","v2":"3","v3":"5","v4":"7","v5":"9"}'),
(@pergunta_id, '{"v1":"domingo","v2":"segunda","v3":"terça","v4":"quarta","v5":"quinta"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(151, '{"alt_c":"{1,2,3,4,5}","alt_2":"{1,2,3}","alt_3":"{3,4,5}","alt_4":"{2,3,4}"}'),
(152, '{"alt_c":"{a,b,c,d,e}","alt_2":"{a,b,c}","alt_3":"{c,d,e}","alt_4":"{b,c,d}"}'),
(153, '{"alt_c":"{x,y,z,w,t}","alt_2":"{x,y,z}","alt_3":"{z,w,t}","alt_4":"{y,z,w}"}'),
(154, '{"alt_c":"{m,n,o,p,q}","alt_2":"{m,n,o}","alt_3":"{o,p,q}","alt_4":"{n,o,p}"}'),
(155, '{"alt_c":"{vermelho,azul,verde,amarelo,roxo}","alt_2":"{vermelho,azul,verde}","alt_3":"{verde,amarelo,roxo}","alt_4":"{azul,verde,amarelo}"}'),
(156, '{"alt_c":"{10,20,30,40,50}","alt_2":"{10,20,30}","alt_3":"{30,40,50}","alt_4":"{20,30,40}"}'),
(157, '{"alt_c":"{brasil,chile,peru,uruguai,argentina}","alt_2":"{brasil,chile,peru}","alt_3":"{peru,uruguai,argentina}","alt_4":"{chile,peru,uruguai}"}'),
(158, '{"alt_c":"{α,β,γ,δ,ε}","alt_2":"{α,β,γ}","alt_3":"{γ,δ,ε}","alt_4":"{β,γ,δ}"}'),
(159, '{"alt_c":"{1,3,5,7,9}","alt_2":"{1,3,5}","alt_3":"{5,7,9}","alt_4":"{3,5,7}"}'),
(160, '{"alt_c":"{domingo,segunda,terça,quarta,quinta}","alt_2":"{domingo,segunda,terça}","alt_3":"{terça,quarta,quinta}","alt_4":"{segunda,terça,quarta}"}');

-- ==========================================
-- PERGUNTA 2
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (4, 'Se A = {v1, v2, v3} e B = {v3, v4, v5}, qual é A ∩ B (interseção de A e B)?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"1","v2":"2","v3":"3","v4":"4","v5":"5"}'),
(@pergunta_id, '{"v1":"a","v2":"b","v3":"c","v4":"d","v5":"e"}'),
(@pergunta_id, '{"v1":"x","v2":"y","v3":"z","v4":"w","v5":"t"}'),
(@pergunta_id, '{"v1":"m","v2":"n","v3":"o","v4":"p","v5":"q"}'),
(@pergunta_id, '{"v1":"vermelho","v2":"azul","v3":"verde","v4":"amarelo","v5":"roxo"}'),
(@pergunta_id, '{"v1":"10","v2":"20","v3":"30","v4":"40","v5":"50"}'),
(@pergunta_id, '{"v1":"brasil","v2":"chile","v3":"peru","v4":"uruguai","v5":"argentina"}'),
(@pergunta_id, '{"v1":"α","v2":"β","v3":"γ","v4":"δ","v5":"ε"}'),
(@pergunta_id, '{"v1":"1","v2":"3","v3":"5","v4":"7","v5":"9"}'),
(@pergunta_id, '{"v1":"domingo","v2":"segunda","v3":"terça","v4":"quarta","v5":"quinta"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(161, '{"alt_c":"{3}","alt_2":"{1,2}","alt_3":"{4,5}","alt_4":"{2,3}"}'),
(162, '{"alt_c":"{c}","alt_2":"{a,b}","alt_3":"{d,e}","alt_4":"{b,c}"}'),
(163, '{"alt_c":"{z}","alt_2":"{x,y}","alt_3":"{w,t}","alt_4":"{y,z}"}'),
(164, '{"alt_c":"{o}","alt_2":"{m,n}","alt_3":"{p,q}","alt_4":"{n,o}"}'),
(165, '{"alt_c":"{verde}","alt_2":"{vermelho,azul}","alt_3":"{amarelo,roxo}","alt_4":"{azul,verde}"}'),
(166, '{"alt_c":"{30}","alt_2":"{10,20}","alt_3":"{40,50}","alt_4":"{20,30}"}'),
(167, '{"alt_c":"{peru}","alt_2":"{brasil,chile}","alt_3":"{uruguai,argentina}","alt_4":"{chile,peru}"}'),
(168, '{"alt_c":"{γ}","alt_2":"{α,β}","alt_3":"{δ,ε}","alt_4":"{β,γ}"}'),
(169, '{"alt_c":"{5}","alt_2":"{1,3}","alt_3":"{7,9}","alt_4":"{3,5}"}'),
(170, '{"alt_c":"{terça}","alt_2":"{domingo,segunda}","alt_3":"{quarta,quinta}","alt_4":"{segunda,terça}"}');

-- ==========================================
-- PERGUNTA 3
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (4, 'Os conjuntos A e B são disjuntos se A ∩ B = ∅?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"1","v2":"2"}'),
(@pergunta_id, '{"v1":"a","v2":"b"}'),
(@pergunta_id, '{"v1":"x","v2":"y"}'),
(@pergunta_id, '{"v1":"m","v2":"n"}'),
(@pergunta_id, '{"v1":"vermelho","v2":"verde"}'),
(@pergunta_id, '{"v1":"10","v2":"20"}'),
(@pergunta_id, '{"v1":"brasil","v2":"chile"}'),
(@pergunta_id, '{"v1":"α","v2":"β"}'),
(@pergunta_id, '{"v1":"domingo","v2":"segunda"}'),
(@pergunta_id, '{"v1":"1","v2":"3"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(171, '{"alt_c":"Sim","alt_2":"Não"}'),
(172, '{"alt_c":"Sim","alt_2":"Não"}'),
(173, '{"alt_c":"Sim","alt_2":"Não"}'),
(174, '{"alt_c":"Sim","alt_2":"Não"}'),
(175, '{"alt_c":"Sim","alt_2":"Não"}'),
(176, '{"alt_c":"Sim","alt_2":"Não"}'),
(177, '{"alt_c":"Sim","alt_2":"Não"}'),
(178, '{"alt_c":"Sim","alt_2":"Não"}'),
(179, '{"alt_c":"Sim","alt_2":"Não"}'),
(180, '{"alt_c":"Sim","alt_2":"Não"}');

-- ==========================================
-- PERGUNTA 4
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (4, 'A reunião de dois conjuntos é o conjunto que contém todos os elementos de ambos, sem repetição?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"1"}'),
(@pergunta_id, '{"v1":"a"}'),
(@pergunta_id, '{"v1":"x"}'),
(@pergunta_id, '{"v1":"m"}'),
(@pergunta_id, '{"v1":"vermelho"}'),
(@pergunta_id, '{"v1":"10"}'),
(@pergunta_id, '{"v1":"brasil"}'),
(@pergunta_id, '{"v1":"α"}'),
(@pergunta_id, '{"v1":"domingo"}'),
(@pergunta_id, '{"v1":"azul"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(181, '{"alt_c":"Sim","alt_2":"Não"}'),
(182, '{"alt_c":"Sim","alt_2":"Não"}'),
(183, '{"alt_c":"Sim","alt_2":"Não"}'),
(184, '{"alt_c":"Sim","alt_2":"Não"}'),
(185, '{"alt_c":"Sim","alt_2":"Não"}'),
(186, '{"alt_c":"Sim","alt_2":"Não"}'),
(187, '{"alt_c":"Sim","alt_2":"Não"}'),
(188, '{"alt_c":"Sim","alt_2":"Não"}'),
(189, '{"alt_c":"Sim","alt_2":"Não"}'),
(190, '{"alt_c":"Sim","alt_2":"Não"}');

-- ==========================================
-- PERGUNTA 5
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (4, 'A interseção de dois conjuntos contém os elementos que são comuns a ambos?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"1"}'),
(@pergunta_id, '{"v1":"a"}'),
(@pergunta_id, '{"v1":"x"}'),
(@pergunta_id, '{"v1":"m"}'),
(@pergunta_id, '{"v1":"vermelho"}'),
(@pergunta_id, '{"v1":"10"}'),
(@pergunta_id, '{"v1":"brasil"}'),
(@pergunta_id, '{"v1":"α"}'),
(@pergunta_id, '{"v1":"domingo"}'),
(@pergunta_id, '{"v1":"azul"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(191, '{"alt_c":"Sim","alt_2":"Não"}'),
(192, '{"alt_c":"Sim","alt_2":"Não"}'),
(193, '{"alt_c":"Sim","alt_2":"Não"}'),
(194, '{"alt_c":"Sim","alt_2":"Não"}'),
(195, '{"alt_c":"Sim","alt_2":"Não"}'),
(196, '{"alt_c":"Sim","alt_2":"Não"}'),
(197, '{"alt_c":"Sim","alt_2":"Não"}'),
(198, '{"alt_c":"Sim","alt_2":"Não"}'),
(199, '{"alt_c":"Sim","alt_2":"Não"}'),
(200, '{"alt_c":"Sim","alt_2":"Não"}');

-- ==========================================
-- PERGUNTA 1
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (5, 'Qual dos conjuntos representa corretamente o conjunto dos números naturais (N)?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"{0,1,2,3,...}","v2":"{...,-2,-1,0,1,2,...}","v3":"{1,2,3,4,...}","v4":"{0,1,2,3,4,5}"}'),
(@pergunta_id, '{"v1":"{0,1,2,3,4}","v2":"{1,2,3,4,5}","v3":"{-1,0,1,2,3}","v4":"{2,3,4,5,6}"}'),
(@pergunta_id, '{"v1":"{0,1,2,3,4,5,...}","v2":"{1,2,3,4,5,...}","v3":"{...,-1,0,1,2,...}","v4":"{-3,-2,-1,0,1}"}'),
(@pergunta_id, '{"v1":"{0,1,2,3,4,5}","v2":"{1,2,3,4,5,6}","v3":"{-1,0,1,2,3,4}","v4":"{2,3,4,5,6,7}"}'),
(@pergunta_id, '{"v1":"{0,1,2,3,4,5,6,7}","v2":"{1,2,3,4,5,6,7,8}","v3":"{...,-3,-2,-1,0,1,...}","v4":"{2,3,4,5,6,7,8,9}"}'),
(@pergunta_id, '{"v1":"{0,1,2,...}","v2":"{1,2,3,...}","v3":"{...,-2,-1,0,1,2,...}","v4":"{-3,-2,-1,0,1,2,3}"}'),
(@pergunta_id, '{"v1":"{0,1,2,3,...}","v2":"{1,2,3,4,...}","v3":"{2,3,4,5,...}","v4":"{...,-2,-1,0,1,2,...}"}'),
(@pergunta_id, '{"v1":"{0,1,2,3,...}","v2":"{1,2,3,4,...}","v3":"{-3,-2,-1,0,1}","v4":"{2,3,4,5,6}"}'),
(@pergunta_id, '{"v1":"{0,1,2,3,4,5,...}","v2":"{1,2,3,4,5,...}","v3":"{...,-2,-1,0,1,2,...}","v4":"{-1,0,1,2,3,4}"}'),
(@pergunta_id, '{"v1":"{0,1,2,3,4,5,...}","v2":"{1,2,3,4,5,...}","v3":"{-2,-1,0,1,2,3}","v4":"{...,-2,-1,0,1,2,...}"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(201, '{"alt_c":"{0,1,2,3,...}","alt_2":"{...,-2,-1,0,1,2,...}","alt_3":"{1,2,3,4,...}","alt_4":"{0,1,2,3,4,5}"}'),
(202, '{"alt_c":"{0,1,2,3,4}","alt_2":"{1,2,3,4,5}","alt_3":"{-1,0,1,2,3}","alt_4":"{2,3,4,5,6}"}'),
(203, '{"alt_c":"{0,1,2,3,4,5,...}","alt_2":"{1,2,3,4,5,...}","alt_3":"{...,-1,0,1,2,...}","alt_4":"{-3,-2,-1,0,1}"}'),
(204, '{"alt_c":"{0,1,2,3,4,5}","alt_2":"{1,2,3,4,5,6}","alt_3":"{-1,0,1,2,3,4}","alt_4":"{2,3,4,5,6,7}"}'),
(205, '{"alt_c":"{0,1,2,3,4,5,6,7}","alt_2":"{1,2,3,4,5,6,7,8}","alt_3":"{...,-3,-2,-1,0,1,...}","alt_4":"{2,3,4,5,6,7,8,9}"}'),
(206, '{"alt_c":"{0,1,2,...}","alt_2":"{1,2,3,...}","alt_3":"{...,-2,-1,0,1,2,...}","alt_4":"{-3,-2,-1,0,1,2,3}"}'),
(207, '{"alt_c":"{0,1,2,3,...}","alt_2":"{1,2,3,4,...}","alt_3":"{2,3,4,5,...}","alt_4":"{...,-2,-1,0,1,2,...}"}'),
(208, '{"alt_c":"{0,1,2,3,...}","alt_2":"{1,2,3,4,...}","alt_3":"{-3,-2,-1,0,1}","alt_4":"{2,3,4,5,6}"}'),
(209, '{"alt_c":"{0,1,2,3,4,5,...}","alt_2":"{1,2,3,4,5,...}","alt_3":"{...,-2,-1,0,1,2,...}","alt_4":"{-1,0,1,2,3,4}"}'),
(210, '{"alt_c":"{0,1,2,3,4,5,...}","alt_2":"{1,2,3,4,5,...}","alt_3":"{-2,-1,0,1,2,3}","alt_4":"{...,-2,-1,0,1,2,...}"}');

-- ==========================================
-- PERGUNTA 2
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (5, 'O conjunto dos números inteiros (Z) inclui os números negativos?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"Sim"}'),
(@pergunta_id, '{"v1":"Não"}'),
(@pergunta_id, '{"v1":"Talvez"}'),
(@pergunta_id, '{"v1":"Não sei"}'),
(@pergunta_id, '{"v1":"Depende"}'),
(@pergunta_id, '{"v1":"Sim"}'),
(@pergunta_id, '{"v1":"Não"}'),
(@pergunta_id, '{"v1":"Sim"}'),
(@pergunta_id, '{"v1":"Não"}'),
(@pergunta_id, '{"v1":"Sim"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(211, '{"alt_c":"Sim","alt_2":"Não"}'),
(212, '{"alt_c":"Sim","alt_2":"Não"}'),
(213, '{"alt_c":"Sim","alt_2":"Não"}'),
(214, '{"alt_c":"Sim","alt_2":"Não"}'),
(215, '{"alt_c":"Sim","alt_2":"Não"}'),
(216, '{"alt_c":"Sim","alt_2":"Não"}'),
(217, '{"alt_c":"Sim","alt_2":"Não"}'),
(218, '{"alt_c":"Sim","alt_2":"Não"}'),
(219, '{"alt_c":"Sim","alt_2":"Não"}'),
(220, '{"alt_c":"Sim","alt_2":"Não"}');

-- ==========================================
-- PERGUNTA 3
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (5, 'O conjunto dos números racionais (Q) é formado por números que podem ser expressos como fração?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES (@pergunta_id, '{"v1":"Sim"}'),(@pergunta_id, '{"v1":"Não"}'),
(@pergunta_id, '{"v1":"Talvez"}'),(@pergunta_id, '{"v1":"Depende"}'),
(@pergunta_id, '{"v1":"Sim"}'),(@pergunta_id, '{"v1":"Não"}'),
(@pergunta_id, '{"v1":"Sim"}'),(@pergunta_id, '{"v1":"Não"}'),
(@pergunta_id, '{"v1":"Sim"}'),(@pergunta_id, '{"v1":"Não"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES (221, '{"alt_c":"Sim","alt_2":"Não"}'),(222, '{"alt_c":"Sim","alt_2":"Não"}'),
(223, '{"alt_c":"Sim","alt_2":"Não"}'),(224, '{"alt_c":"Sim","alt_2":"Não"}'),
(225, '{"alt_c":"Sim","alt_2":"Não"}'),(226, '{"alt_c":"Sim","alt_2":"Não"}'),
(227, '{"alt_c":"Sim","alt_2":"Não"}'),(228, '{"alt_c":"Sim","alt_2":"Não"}'),
(229, '{"alt_c":"Sim","alt_2":"Não"}'),(230, '{"alt_c":"Sim","alt_2":"Não"}');

-- ==========================================
-- PERGUNTA 4
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (5, 'Todo número natural é também um número inteiro?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES (@pergunta_id, '{"v1":"Sim"}'),(@pergunta_id, '{"v1":"Não"}'),
(@pergunta_id, '{"v1":"Depende"}'),(@pergunta_id, '{"v1":"Não sei"}'),
(@pergunta_id, '{"v1":"Sim"}'),(@pergunta_id, '{"v1":"Não"}'),
(@pergunta_id, '{"v1":"Sim"}'),(@pergunta_id, '{"v1":"Não"}'),
(@pergunta_id, '{"v1":"Sim"}'),(@pergunta_id, '{"v1":"Não"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES (231, '{"alt_c":"Sim","alt_2":"Não"}'),(232, '{"alt_c":"Sim","alt_2":"Não"}'),
(233, '{"alt_c":"Sim","alt_2":"Não"}'),(234, '{"alt_c":"Sim","alt_2":"Não"}'),
(235, '{"alt_c":"Sim","alt_2":"Não"}'),(236, '{"alt_c":"Sim","alt_2":"Não"}'),
(237, '{"alt_c":"Sim","alt_2":"Não"}'),(238, '{"alt_c":"Sim","alt_2":"Não"}'),
(239, '{"alt_c":"Sim","alt_2":"Não"}'),(240, '{"alt_c":"Sim","alt_2":"Não"}');

-- ==========================================
-- PERGUNTA 5
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (5, 'Todo número inteiro é um número racional?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES (@pergunta_id, '{"v1":"Sim"}'),(@pergunta_id, '{"v1":"Não"}'),
(@pergunta_id, '{"v1":"Depende"}'),(@pergunta_id, '{"v1":"Não sei"}'),
(@pergunta_id, '{"v1":"Sim"}'),(@pergunta_id, '{"v1":"Não"}'),
(@pergunta_id, '{"v1":"Sim"}'),(@pergunta_id, '{"v1":"Não"}'),
(@pergunta_id, '{"v1":"Sim"}'),(@pergunta_id, '{"v1":"Não"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES (241, '{"alt_c":"Sim","alt_2":"Não"}'),(242, '{"alt_c":"Sim","alt_2":"Não"}'),
(243, '{"alt_c":"Sim","alt_2":"Não"}'),(244, '{"alt_c":"Sim","alt_2":"Não"}'),
(245, '{"alt_c":"Sim","alt_2":"Não"}'),(246, '{"alt_c":"Sim","alt_2":"Não"}'),
(247, '{"alt_c":"Sim","alt_2":"Não"}'),(248, '{"alt_c":"Sim","alt_2":"Não"}'),
(249, '{"alt_c":"Sim","alt_2":"Não"}'),(250, '{"alt_c":"Sim","alt_2":"Não"}');

-- ==========================================
-- PERGUNTA 1
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (6, 'Qual das expressões representa uma função afim?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"f(x)=2x+3","v2":"f(x)=x^2+3x","v3":"f(x)=3/x","v4":"f(x)=√x"}'),
(@pergunta_id, '{"v1":"f(x)=5x−1","v2":"f(x)=x^3+2x","v3":"f(x)=1/x","v4":"f(x)=|x|"}'),
(@pergunta_id, '{"v1":"f(x)=−3x+2","v2":"f(x)=x^2−1","v3":"f(x)=x/x","v4":"f(x)=√x"}'),
(@pergunta_id, '{"v1":"f(x)=4x−5","v2":"f(x)=x^3","v3":"f(x)=1/x","v4":"f(x)=x^2"}'),
(@pergunta_id, '{"v1":"f(x)=x+1","v2":"f(x)=x^2+1","v3":"f(x)=1/x","v4":"f(x)=x^3"}'),
(@pergunta_id, '{"v1":"f(x)=10x−10","v2":"f(x)=x^2−x","v3":"f(x)=√x","v4":"f(x)=x^3"}'),
(@pergunta_id, '{"v1":"f(x)=−x+7","v2":"f(x)=x^2","v3":"f(x)=x^3","v4":"f(x)=1/x"}'),
(@pergunta_id, '{"v1":"f(x)=8x−2","v2":"f(x)=x^2+3","v3":"f(x)=√x","v4":"f(x)=x^3"}'),
(@pergunta_id, '{"v1":"f(x)=x−5","v2":"f(x)=x^2−2x","v3":"f(x)=1/x","v4":"f(x)=x^3"}'),
(@pergunta_id, '{"v1":"f(x)=3x+4","v2":"f(x)=x^2−1","v3":"f(x)=1/x","v4":"f(x)=√x"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(251, '{"alt_c":"f(x)=2x+3","alt_2":"f(x)=x^2+3x","alt_3":"f(x)=3/x","alt_4":"f(x)=√x"}'),
(252, '{"alt_c":"f(x)=5x−1","alt_2":"f(x)=x^3+2x","alt_3":"f(x)=1/x","alt_4":"f(x)=|x|"}'),
(253, '{"alt_c":"f(x)=−3x+2","alt_2":"f(x)=x^2−1","alt_3":"f(x)=x/x","alt_4":"f(x)=√x"}'),
(254, '{"alt_c":"f(x)=4x−5","alt_2":"f(x)=x^3","alt_3":"f(x)=1/x","alt_4":"f(x)=x^2"}'),
(255, '{"alt_c":"f(x)=x+1","alt_2":"f(x)=x^2+1","alt_3":"f(x)=1/x","alt_4":"f(x)=x^3"}'),
(256, '{"alt_c":"f(x)=10x−10","alt_2":"f(x)=x^2−x","alt_3":"f(x)=√x","alt_4":"f(x)=x^3"}'),
(257, '{"alt_c":"f(x)=−x+7","alt_2":"f(x)=x^2","alt_3":"f(x)=x^3","alt_4":"f(x)=1/x"}'),
(258, '{"alt_c":"f(x)=8x−2","alt_2":"f(x)=x^2+3","alt_3":"f(x)=√x","alt_4":"f(x)=x^3"}'),
(259, '{"alt_c":"f(x)=x−5","alt_2":"f(x)=x^2−2x","alt_3":"f(x)=1/x","alt_4":"f(x)=x^3"}'),
(260, '{"alt_c":"f(x)=3x+4","alt_2":"f(x)=x^2−1","alt_3":"f(x)=1/x","alt_4":"f(x)=√x"}');

-- ==========================================
-- PERGUNTA 2
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (6, 'Qual é a forma geral de uma função afim?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES (@pergunta_id, '{"v1":"f(x)=ax+b","v2":"f(x)=ax^2+b","v3":"f(x)=a/x+b","v4":"f(x)=a√x+b"}'),
(@pergunta_id, '{"v1":"f(x)=ax+b","v2":"f(x)=bx+a","v3":"f(x)=ax^2+b","v4":"f(x)=a/x+b"}'),
(@pergunta_id, '{"v1":"f(x)=ax+b","v2":"f(x)=a/x+b","v3":"f(x)=ax^2+b","v4":"f(x)=|x|"}'),
(@pergunta_id, '{"v1":"f(x)=ax+b","v2":"f(x)=a/x","v3":"f(x)=ax^2","v4":"f(x)=√x"}'),
(@pergunta_id, '{"v1":"f(x)=ax+b","v2":"f(x)=a/x+b","v3":"f(x)=ax^2+b","v4":"f(x)=|x|"}'),
(@pergunta_id, '{"v1":"f(x)=ax+b","v2":"f(x)=x^2+a","v3":"f(x)=1/x","v4":"f(x)=√x"}'),
(@pergunta_id, '{"v1":"f(x)=ax+b","v2":"f(x)=ax^2","v3":"f(x)=x^3","v4":"f(x)=1/x"}'),
(@pergunta_id, '{"v1":"f(x)=ax+b","v2":"f(x)=x^2−b","v3":"f(x)=√x","v4":"f(x)=|x|"}'),
(@pergunta_id, '{"v1":"f(x)=ax+b","v2":"f(x)=ax^3","v3":"f(x)=x^2+b","v4":"f(x)=1/x"}'),
(@pergunta_id, '{"v1":"f(x)=ax+b","v2":"f(x)=x^2+3","v3":"f(x)=a/x","v4":"f(x)=√x"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES (261, '{"alt_c":"f(x)=ax+b","alt_2":"f(x)=ax^2+b","alt_3":"f(x)=a/x+b","alt_4":"f(x)=a√x+b"}'),
(262, '{"alt_c":"f(x)=ax+b","alt_2":"f(x)=bx+a","alt_3":"f(x)=ax^2+b","alt_4":"f(x)=a/x+b"}'),
(263, '{"alt_c":"f(x)=ax+b","alt_2":"f(x)=a/x+b","alt_3":"f(x)=ax^2+b","alt_4":"f(x)=|x|"}'),
(264, '{"alt_c":"f(x)=ax+b","alt_2":"f(x)=a/x","alt_3":"f(x)=ax^2","alt_4":"f(x)=√x"}'),
(265, '{"alt_c":"f(x)=ax+b","alt_2":"f(x)=a/x+b","alt_3":"f(x)=ax^2+b","alt_4":"f(x)=|x|"}'),
(266, '{"alt_c":"f(x)=ax+b","alt_2":"f(x)=x^2+a","alt_3":"f(x)=1/x","alt_4":"f(x)=√x"}'),
(267, '{"alt_c":"f(x)=ax+b","alt_2":"f(x)=ax^2","alt_3":"f(x)=x^3","alt_4":"f(x)=1/x"}'),
(268, '{"alt_c":"f(x)=ax+b","alt_2":"f(x)=x^2−b","alt_3":"f(x)=√x","alt_4":"f(x)=|x|"}'),
(269, '{"alt_c":"f(x)=ax+b","alt_2":"f(x)=ax^3","alt_3":"f(x)=x^2+b","alt_4":"f(x)=1/x"}'),
(270, '{"alt_c":"f(x)=ax+b","alt_2":"f(x)=x^2+3","alt_3":"f(x)=a/x","alt_4":"f(x)=√x"}');

-- ==========================================
-- PERGUNTA 3
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (6, 'Em uma função afim, o termo “a” representa o coeficiente angular?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES (@pergunta_id, '{"v1":"Sim"}'),(@pergunta_id, '{"v1":"Não"}'),
(@pergunta_id, '{"v1":"Depende"}'),(@pergunta_id, '{"v1":"Não sei"}'),
(@pergunta_id, '{"v1":"Sim"}'),(@pergunta_id, '{"v1":"Não"}'),
(@pergunta_id, '{"v1":"Sim"}'),(@pergunta_id, '{"v1":"Não"}'),
(@pergunta_id, '{"v1":"Sim"}'),(@pergunta_id, '{"v1":"Não"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES (271, '{"alt_c":"Sim","alt_2":"Não"}'),(272, '{"alt_c":"Sim","alt_2":"Não"}'),
(273, '{"alt_c":"Sim","alt_2":"Não"}'),(274, '{"alt_c":"Sim","alt_2":"Não"}'),
(275, '{"alt_c":"Sim","alt_2":"Não"}'),(276, '{"alt_c":"Sim","alt_2":"Não"}'),
(277, '{"alt_c":"Sim","alt_2":"Não"}'),(278, '{"alt_c":"Sim","alt_2":"Não"}'),
(279, '{"alt_c":"Sim","alt_2":"Não"}'),(280, '{"alt_c":"Sim","alt_2":"Não"}');

-- ==========================================
-- PERGUNTA 4
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (6, 'Toda função afim é também uma função de primeiro grau?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES (@pergunta_id, '{"v1":"Sim"}'),(@pergunta_id, '{"v1":"Não"}'),
(@pergunta_id, '{"v1":"Depende"}'),(@pergunta_id, '{"v1":"Não sei"}'),
(@pergunta_id, '{"v1":"Sim"}'),(@pergunta_id, '{"v1":"Não"}'),
(@pergunta_id, '{"v1":"Sim"}'),(@pergunta_id, '{"v1":"Não"}'),
(@pergunta_id, '{"v1":"Sim"}'),(@pergunta_id, '{"v1":"Não"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES (281, '{"alt_c":"Sim","alt_2":"Não"}'),(282, '{"alt_c":"Sim","alt_2":"Não"}'),
(283, '{"alt_c":"Sim","alt_2":"Não"}'),(284, '{"alt_c":"Sim","alt_2":"Não"}'),
(285, '{"alt_c":"Sim","alt_2":"Não"}'),(286, '{"alt_c":"Sim","alt_2":"Não"}'),
(287, '{"alt_c":"Sim","alt_2":"Não"}'),(288, '{"alt_c":"Sim","alt_2":"Não"}'),
(289, '{"alt_c":"Sim","alt_2":"Não"}'),(290, '{"alt_c":"Sim","alt_2":"Não"}');

-- ==========================================
-- PERGUNTA 5
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (6, 'Toda função afim é uma reta não vertical?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES (@pergunta_id, '{"v1":"Sim"}'),(@pergunta_id, '{"v1":"Não"}'),
(@pergunta_id, '{"v1":"Depende"}'),(@pergunta_id, '{"v1":"Não sei"}'),
(@pergunta_id, '{"v1":"Sim"}'),(@pergunta_id, '{"v1":"Não"}'),
(@pergunta_id, '{"v1":"Sim"}'),(@pergunta_id, '{"v1":"Não"}'),
(@pergunta_id, '{"v1":"Sim"}'),(@pergunta_id, '{"v1":"Não"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES (291, '{"alt_c":"Sim","alt_2":"Não"}'),(292, '{"alt_c":"Sim","alt_2":"Não"}'),
(293, '{"alt_c":"Sim","alt_2":"Não"}'),(294, '{"alt_c":"Sim","alt_2":"Não"}'),
(295, '{"alt_c":"Sim","alt_2":"Não"}'),(296, '{"alt_c":"Sim","alt_2":"Não"}'),
(297, '{"alt_c":"Sim","alt_2":"Não"}'),(298, '{"alt_c":"Sim","alt_2":"Não"}'),
(299, '{"alt_c":"Sim","alt_2":"Não"}'),(300, '{"alt_c":"Sim","alt_2":"Não"}');

-- ==========================================
-- PERGUNTA 1
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (7, 'O gráfico de uma função afim é sempre uma reta?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"Sim"}'),(@pergunta_id, '{"v1":"Não"}'),
(@pergunta_id, '{"v1":"Depende"}'),(@pergunta_id, '{"v1":"Não sei"}'),
(@pergunta_id, '{"v1":"Sim"}'),(@pergunta_id, '{"v1":"Não"}'),
(@pergunta_id, '{"v1":"Sim"}'),(@pergunta_id, '{"v1":"Não"}'),
(@pergunta_id, '{"v1":"Sim"}'),(@pergunta_id, '{"v1":"Não"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(301, '{"alt_c":"Sim","alt_2":"Não"}'),(302, '{"alt_c":"Sim","alt_2":"Não"}'),
(303, '{"alt_c":"Sim","alt_2":"Não"}'),(304, '{"alt_c":"Sim","alt_2":"Não"}'),
(305, '{"alt_c":"Sim","alt_2":"Não"}'),(306, '{"alt_c":"Sim","alt_2":"Não"}'),
(307, '{"alt_c":"Sim","alt_2":"Não"}'),(308, '{"alt_c":"Sim","alt_2":"Não"}'),
(309, '{"alt_c":"Sim","alt_2":"Não"}'),(310, '{"alt_c":"Sim","alt_2":"Não"}');

-- ==========================================
-- PERGUNTA 2
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (7, 'Na função afim f(x) = ax + b, o valor de “b” representa o ponto em que a reta corta o eixo:');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"y","v2":"x","v3":"origem","v4":"z"}'),
(@pergunta_id, '{"v1":"y","v2":"x","v3":"z","v4":"t"}'),
(@pergunta_id, '{"v1":"y","v2":"x","v3":"zero","v4":"origem"}'),
(@pergunta_id, '{"v1":"y","v2":"x","v3":"z","v4":"w"}'),
(@pergunta_id, '{"v1":"y","v2":"x","v3":"z","v4":"t"}'),
(@pergunta_id, '{"v1":"y","v2":"x","v3":"z","v4":"origem"}'),
(@pergunta_id, '{"v1":"y","v2":"x","v3":"z","v4":"zero"}'),
(@pergunta_id, '{"v1":"y","v2":"x","v3":"z","v4":"t"}'),
(@pergunta_id, '{"v1":"y","v2":"x","v3":"z","v4":"origem"}'),
(@pergunta_id, '{"v1":"y","v2":"x","v3":"z","v4":"zero"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(311, '{"alt_c":"y","alt_2":"x","alt_3":"origem","alt_4":"z"}'),
(312, '{"alt_c":"y","alt_2":"x","alt_3":"z","alt_4":"t"}'),
(313, '{"alt_c":"y","alt_2":"x","alt_3":"zero","alt_4":"origem"}'),
(314, '{"alt_c":"y","alt_2":"x","alt_3":"z","alt_4":"w"}'),
(315, '{"alt_c":"y","alt_2":"x","alt_3":"z","alt_4":"t"}'),
(316, '{"alt_c":"y","alt_2":"x","alt_3":"z","alt_4":"origem"}'),
(317, '{"alt_c":"y","alt_2":"x","alt_3":"z","alt_4":"zero"}'),
(318, '{"alt_c":"y","alt_2":"x","alt_3":"z","alt_4":"t"}'),
(319, '{"alt_c":"y","alt_2":"x","alt_3":"z","alt_4":"origem"}'),
(320, '{"alt_c":"y","alt_2":"x","alt_3":"z","alt_4":"zero"}');

-- ==========================================
-- PERGUNTA 3
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (7, 'Se o coeficiente “a” de uma função afim é positivo, o gráfico é uma reta:');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"crescente","v2":"decrescente","v3":"horizontal","v4":"vertical"}'),
(@pergunta_id, '{"v1":"crescente","v2":"decrescente","v3":"constante","v4":"paralela"}'),
(@pergunta_id, '{"v1":"crescente","v2":"decrescente","v3":"horizontal","v4":"sem sentido"}'),
(@pergunta_id, '{"v1":"crescente","v2":"decrescente","v3":"inclinada","v4":"reta nula"}'),
(@pergunta_id, '{"v1":"crescente","v2":"decrescente","v3":"reta fixa","v4":"sem variação"}'),
(@pergunta_id, '{"v1":"crescente","v2":"decrescente","v3":"horizontal","v4":"curva"}'),
(@pergunta_id, '{"v1":"crescente","v2":"decrescente","v3":"reta fixa","v4":"sem variação"}'),
(@pergunta_id, '{"v1":"crescente","v2":"decrescente","v3":"horizontal","v4":"reta curva"}'),
(@pergunta_id, '{"v1":"crescente","v2":"decrescente","v3":"sem variação","v4":"reta vertical"}'),
(@pergunta_id, '{"v1":"crescente","v2":"decrescente","v3":"horizontal","v4":"vertical"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(321, '{"alt_c":"crescente","alt_2":"decrescente","alt_3":"horizontal","alt_4":"vertical"}'),
(322, '{"alt_c":"crescente","alt_2":"decrescente","alt_3":"constante","alt_4":"paralela"}'),
(323, '{"alt_c":"crescente","alt_2":"decrescente","alt_3":"horizontal","alt_4":"sem sentido"}'),
(324, '{"alt_c":"crescente","alt_2":"decrescente","alt_3":"inclinada","alt_4":"reta nula"}'),
(325, '{"alt_c":"crescente","alt_2":"decrescente","alt_3":"reta fixa","alt_4":"sem variação"}'),
(326, '{"alt_c":"crescente","alt_2":"decrescente","alt_3":"horizontal","alt_4":"curva"}'),
(327, '{"alt_c":"crescente","alt_2":"decrescente","alt_3":"reta fixa","alt_4":"sem variação"}'),
(328, '{"alt_c":"crescente","alt_2":"decrescente","alt_3":"horizontal","alt_4":"reta curva"}'),
(329, '{"alt_c":"crescente","alt_2":"decrescente","alt_3":"sem variação","alt_4":"reta vertical"}'),
(330, '{"alt_c":"crescente","alt_2":"decrescente","alt_3":"horizontal","alt_4":"vertical"}');

-- ==========================================
-- PERGUNTA 4
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (7, 'Se o coeficiente “a” é negativo, o gráfico da função afim é uma reta:');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"decrescente","v2":"crescente","v3":"horizontal","v4":"vertical"}'),
(@pergunta_id, '{"v1":"decrescente","v2":"crescente","v3":"constante","v4":"reta curva"}'),
(@pergunta_id, '{"v1":"decrescente","v2":"crescente","v3":"reta fixa","v4":"sem variação"}'),
(@pergunta_id, '{"v1":"decrescente","v2":"crescente","v3":"horizontal","v4":"sem inclinação"}'),
(@pergunta_id, '{"v1":"decrescente","v2":"crescente","v3":"horizontal","v4":"reta nula"}'),
(@pergunta_id, '{"v1":"decrescente","v2":"crescente","v3":"reta curva","v4":"sem variação"}'),
(@pergunta_id, '{"v1":"decrescente","v2":"crescente","v3":"horizontal","v4":"reta curva"}'),
(@pergunta_id, '{"v1":"decrescente","v2":"crescente","v3":"constante","v4":"reta fixa"}'),
(@pergunta_id, '{"v1":"decrescente","v2":"crescente","v3":"reta curva","v4":"sem variação"}'),
(@pergunta_id, '{"v1":"decrescente","v2":"crescente","v3":"horizontal","v4":"vertical"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(331, '{"alt_c":"decrescente","alt_2":"crescente","alt_3":"horizontal","alt_4":"vertical"}'),
(332, '{"alt_c":"decrescente","alt_2":"crescente","alt_3":"constante","alt_4":"reta curva"}'),
(333, '{"alt_c":"decrescente","alt_2":"crescente","alt_3":"reta fixa","alt_4":"sem variação"}'),
(334, '{"alt_c":"decrescente","alt_2":"crescente","alt_3":"horizontal","alt_4":"sem inclinação"}'),
(335, '{"alt_c":"decrescente","alt_2":"crescente","alt_3":"horizontal","alt_4":"reta nula"}'),
(336, '{"alt_c":"decrescente","alt_2":"crescente","alt_3":"reta curva","alt_4":"sem variação"}'),
(337, '{"alt_c":"decrescente","alt_2":"crescente","alt_3":"horizontal","alt_4":"reta curva"}'),
(338, '{"alt_c":"decrescente","alt_2":"crescente","alt_3":"constante","alt_4":"reta fixa"}'),
(339, '{"alt_c":"decrescente","alt_2":"crescente","alt_3":"reta curva","alt_4":"sem variação"}'),
(340, '{"alt_c":"decrescente","alt_2":"crescente","alt_3":"horizontal","alt_4":"vertical"}');

-- ==========================================
-- PERGUNTA 5
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (7, 'Se a = 0 em f(x) = ax + b, o gráfico da função é:');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"uma reta horizontal","v2":"uma reta vertical","v3":"uma parábola","v4":"um ponto"}'),
(@pergunta_id, '{"v1":"reta horizontal","v2":"reta vertical","v3":"curva","v4":"ponto"}'),
(@pergunta_id, '{"v1":"reta constante","v2":"reta inclinada","v3":"parábola","v4":"curva"}'),
(@pergunta_id, '{"v1":"reta fixa","v2":"reta vertical","v3":"curva","v4":"sem inclinação"}'),
(@pergunta_id, '{"v1":"reta horizontal","v2":"reta curva","v3":"reta variável","v4":"parábola"}'),
(@pergunta_id, '{"v1":"reta constante","v2":"reta inclinada","v3":"curva","v4":"sem inclinação"}'),
(@pergunta_id, '{"v1":"reta horizontal","v2":"reta vertical","v3":"curva","v4":"reta inclinada"}'),
(@pergunta_id, '{"v1":"reta fixa","v2":"reta vertical","v3":"reta curva","v4":"sem variação"}'),
(@pergunta_id, '{"v1":"reta horizontal","v2":"reta vertical","v3":"reta curva","v4":"sem inclinação"}'),
(@pergunta_id, '{"v1":"reta constante","v2":"reta vertical","v3":"curva","v4":"reta inclinada"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(341, '{"alt_c":"uma reta horizontal","alt_2":"uma reta vertical","alt_3":"uma parábola","alt_4":"um ponto"}'),
(342, '{"alt_c":"reta horizontal","alt_2":"reta vertical","alt_3":"curva","alt_4":"ponto"}'),
(343, '{"alt_c":"reta constante","alt_2":"reta inclinada","alt_3":"parábola","alt_4":"curva"}'),
(344, '{"alt_c":"reta fixa","alt_2":"reta vertical","alt_3":"curva","alt_4":"sem inclinação"}'),
(345, '{"alt_c":"reta horizontal","alt_2":"reta curva","alt_3":"reta variável","alt_4":"parábola"}'),
(346, '{"alt_c":"reta constante","alt_2":"reta inclinada","alt_3":"curva","alt_4":"sem inclinação"}'),
(347, '{"alt_c":"reta horizontal","alt_2":"reta vertical","alt_3":"curva","alt_4":"reta inclinada"}'),
(348, '{"alt_c":"reta fixa","alt_2":"reta vertical","alt_3":"reta curva","alt_4":"sem variação"}'),
(349, '{"alt_c":"reta horizontal","alt_2":"reta vertical","alt_3":"reta curva","alt_4":"sem inclinação"}'),
(350, '{"alt_c":"reta constante","alt_2":"reta vertical","alt_3":"curva","alt_4":"reta inclinada"}');

-- ==========================================
-- PERGUNTA 1
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (8, 'Na função afim f(x) = ax + b, o coeficiente “a” indica a inclinação da reta?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"Sim"}'),(@pergunta_id, '{"v1":"Não"}'),
(@pergunta_id, '{"v1":"Depende"}'),(@pergunta_id, '{"v1":"Não sei"}'),
(@pergunta_id, '{"v1":"Sim"}'),(@pergunta_id, '{"v1":"Não"}'),
(@pergunta_id, '{"v1":"Sim"}'),(@pergunta_id, '{"v1":"Não"}'),
(@pergunta_id, '{"v1":"Sim"}'),(@pergunta_id, '{"v1":"Não"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(351, '{"alt_c":"Sim","alt_2":"Não"}'),(352, '{"alt_c":"Sim","alt_2":"Não"}'),
(353, '{"alt_c":"Sim","alt_2":"Não"}'),(354, '{"alt_c":"Sim","alt_2":"Não"}'),
(355, '{"alt_c":"Sim","alt_2":"Não"}'),(356, '{"alt_c":"Sim","alt_2":"Não"}'),
(357, '{"alt_c":"Sim","alt_2":"Não"}'),(358, '{"alt_c":"Sim","alt_2":"Não"}'),
(359, '{"alt_c":"Sim","alt_2":"Não"}'),(360, '{"alt_c":"Sim","alt_2":"Não"}');

-- ==========================================
-- PERGUNTA 2
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (8, 'Se o coeficiente “a” é positivo, a reta é:');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"crescente","v2":"decrescente","v3":"horizontal","v4":"vertical"}'),
(@pergunta_id, '{"v1":"crescente","v2":"decrescente","v3":"reta curva","v4":"reta fixa"}'),
(@pergunta_id, '{"v1":"crescente","v2":"decrescente","v3":"sem inclinação","v4":"constante"}'),
(@pergunta_id, '{"v1":"crescente","v2":"decrescente","v3":"horizontal","v4":"reta vertical"}'),
(@pergunta_id, '{"v1":"crescente","v2":"decrescente","v3":"constante","v4":"sem variação"}'),
(@pergunta_id, '{"v1":"crescente","v2":"decrescente","v3":"horizontal","v4":"sem sentido"}'),
(@pergunta_id, '{"v1":"crescente","v2":"decrescente","v3":"reta curva","v4":"reta horizontal"}'),
(@pergunta_id, '{"v1":"crescente","v2":"decrescente","v3":"constante","v4":"reta curva"}'),
(@pergunta_id, '{"v1":"crescente","v2":"decrescente","v3":"horizontal","v4":"reta variável"}'),
(@pergunta_id, '{"v1":"crescente","v2":"decrescente","v3":"reta curva","v4":"sem variação"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(361, '{"alt_c":"crescente","alt_2":"decrescente","alt_3":"horizontal","alt_4":"vertical"}'),
(362, '{"alt_c":"crescente","alt_2":"decrescente","alt_3":"reta curva","alt_4":"reta fixa"}'),
(363, '{"alt_c":"crescente","alt_2":"decrescente","alt_3":"sem inclinação","alt_4":"constante"}'),
(364, '{"alt_c":"crescente","alt_2":"decrescente","alt_3":"horizontal","alt_4":"reta vertical"}'),
(365, '{"alt_c":"crescente","alt_2":"decrescente","alt_3":"constante","alt_4":"sem variação"}'),
(366, '{"alt_c":"crescente","alt_2":"decrescente","alt_3":"horizontal","alt_4":"sem sentido"}'),
(367, '{"alt_c":"crescente","alt_2":"decrescente","alt_3":"reta curva","alt_4":"reta horizontal"}'),
(368, '{"alt_c":"crescente","alt_2":"decrescente","alt_3":"constante","alt_4":"reta curva"}'),
(369, '{"alt_c":"crescente","alt_2":"decrescente","alt_3":"horizontal","alt_4":"reta variável"}'),
(370, '{"alt_c":"crescente","alt_2":"decrescente","alt_3":"reta curva","alt_4":"sem variação"}');

-- ==========================================
-- PERGUNTA 3
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (8, 'Se o coeficiente “a” é negativo, a reta é:');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"decrescente","v2":"crescente","v3":"horizontal","v4":"vertical"}'),
(@pergunta_id, '{"v1":"decrescente","v2":"crescente","v3":"reta curva","v4":"reta fixa"}'),
(@pergunta_id, '{"v1":"decrescente","v2":"crescente","v3":"sem inclinação","v4":"reta variável"}'),
(@pergunta_id, '{"v1":"decrescente","v2":"crescente","v3":"horizontal","v4":"reta curva"}'),
(@pergunta_id, '{"v1":"decrescente","v2":"crescente","v3":"constante","v4":"reta curva"}'),
(@pergunta_id, '{"v1":"decrescente","v2":"crescente","v3":"horizontal","v4":"sem sentido"}'),
(@pergunta_id, '{"v1":"decrescente","v2":"crescente","v3":"reta curva","v4":"sem variação"}'),
(@pergunta_id, '{"v1":"decrescente","v2":"crescente","v3":"reta curva","v4":"reta variável"}'),
(@pergunta_id, '{"v1":"decrescente","v2":"crescente","v3":"horizontal","v4":"reta curva"}'),
(@pergunta_id, '{"v1":"decrescente","v2":"crescente","v3":"reta curva","v4":"sem inclinação"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(371, '{"alt_c":"decrescente","alt_2":"crescente","alt_3":"horizontal","alt_4":"vertical"}'),
(372, '{"alt_c":"decrescente","alt_2":"crescente","alt_3":"reta curva","alt_4":"reta fixa"}'),
(373, '{"alt_c":"decrescente","alt_2":"crescente","alt_3":"sem inclinação","alt_4":"reta variável"}'),
(374, '{"alt_c":"decrescente","alt_2":"crescente","alt_3":"horizontal","alt_4":"reta curva"}'),
(375, '{"alt_c":"decrescente","alt_2":"crescente","alt_3":"constante","alt_4":"reta curva"}'),
(376, '{"alt_c":"decrescente","alt_2":"crescente","alt_3":"horizontal","alt_4":"sem sentido"}'),
(377, '{"alt_c":"decrescente","alt_2":"crescente","alt_3":"reta curva","alt_4":"sem variação"}'),
(378, '{"alt_c":"decrescente","alt_2":"crescente","alt_3":"reta curva","alt_4":"reta variável"}'),
(379, '{"alt_c":"decrescente","alt_2":"crescente","alt_3":"horizontal","alt_4":"reta curva"}'),
(380, '{"alt_c":"decrescente","alt_2":"crescente","alt_3":"reta curva","alt_4":"sem inclinação"}');

-- ==========================================
-- PERGUNTA 4
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (8, 'O coeficiente “b” em f(x)=ax+b indica o ponto em que a reta corta o eixo y?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"Sim"}'),(@pergunta_id, '{"v1":"Não"}'),
(@pergunta_id, '{"v1":"Depende"}'),(@pergunta_id, '{"v1":"Não sei"}'),
(@pergunta_id, '{"v1":"Sim"}'),(@pergunta_id, '{"v1":"Não"}'),
(@pergunta_id, '{"v1":"Sim"}'),(@pergunta_id, '{"v1":"Não"}'),
(@pergunta_id, '{"v1":"Sim"}'),(@pergunta_id, '{"v1":"Não"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(381, '{"alt_c":"Sim","alt_2":"Não"}'),(382, '{"alt_c":"Sim","alt_2":"Não"}'),
(383, '{"alt_c":"Sim","alt_2":"Não"}'),(384, '{"alt_c":"Sim","alt_2":"Não"}'),
(385, '{"alt_c":"Sim","alt_2":"Não"}'),(386, '{"alt_c":"Sim","alt_2":"Não"}'),
(387, '{"alt_c":"Sim","alt_2":"Não"}'),(388, '{"alt_c":"Sim","alt_2":"Não"}'),
(389, '{"alt_c":"Sim","alt_2":"Não"}'),(390, '{"alt_c":"Sim","alt_2":"Não"}');

-- ==========================================
-- PERGUNTA 5
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (8, 'Se o coeficiente “a” for igual a zero, a função é constante?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"Sim"}'),(@pergunta_id, '{"v1":"Não"}'),
(@pergunta_id, '{"v1":"Depende"}'),(@pergunta_id, '{"v1":"Não sei"}'),
(@pergunta_id, '{"v1":"Sim"}'),(@pergunta_id, '{"v1":"Não"}'),
(@pergunta_id, '{"v1":"Sim"}'),(@pergunta_id, '{"v1":"Não"}'),
(@pergunta_id, '{"v1":"Sim"}'),(@pergunta_id, '{"v1":"Não"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(391, '{"alt_c":"Sim","alt_2":"Não"}'),(392, '{"alt_c":"Sim","alt_2":"Não"}'),
(393, '{"alt_c":"Sim","alt_2":"Não"}'),(394, '{"alt_c":"Sim","alt_2":"Não"}'),
(395, '{"alt_c":"Sim","alt_2":"Não"}'),(396, '{"alt_c":"Sim","alt_2":"Não"}'),
(397, '{"alt_c":"Sim","alt_2":"Não"}'),(398, '{"alt_c":"Sim","alt_2":"Não"}'),
(399, '{"alt_c":"Sim","alt_2":"Não"}'),(400, '{"alt_c":"Sim","alt_2":"Não"}');

-- ==========================================
-- PERGUNTA 1
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (9, 'O zero da função afim f(x) = ax + b é o valor de x para o qual f(x) = 0?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"Sim"}'),(@pergunta_id, '{"v1":"Não"}'),
(@pergunta_id, '{"v1":"Depende"}'),(@pergunta_id, '{"v1":"Não sei"}'),
(@pergunta_id, '{"v1":"Sim"}'),(@pergunta_id, '{"v1":"Não"}'),
(@pergunta_id, '{"v1":"Sim"}'),(@pergunta_id, '{"v1":"Não"}'),
(@pergunta_id, '{"v1":"Sim"}'),(@pergunta_id, '{"v1":"Não"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(401, '{"alt_c":"Sim","alt_2":"Não"}'),(402, '{"alt_c":"Sim","alt_2":"Não"}'),
(403, '{"alt_c":"Sim","alt_2":"Não"}'),(404, '{"alt_c":"Sim","alt_2":"Não"}'),
(405, '{"alt_c":"Sim","alt_2":"Não"}'),(406, '{"alt_c":"Sim","alt_2":"Não"}'),
(407, '{"alt_c":"Sim","alt_2":"Não"}'),(408, '{"alt_c":"Sim","alt_2":"Não"}'),
(409, '{"alt_c":"Sim","alt_2":"Não"}'),(410, '{"alt_c":"Sim","alt_2":"Não"}');

-- ==========================================
-- PERGUNTA 2
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (9, 'Qual é o zero da função f(x) = 2x - 6?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"3","v2":"-3","v3":"6","v4":"0"}'),
(@pergunta_id, '{"v1":"4","v2":"2","v3":"3","v4":"-6"}'),
(@pergunta_id, '{"v1":"5","v2":"3","v3":"-2","v4":"1"}'),
(@pergunta_id, '{"v1":"3","v2":"1","v3":"2","v4":"-1"}'),
(@pergunta_id, '{"v1":"3","v2":"-2","v3":"2","v4":"0"}'),
(@pergunta_id, '{"v1":"3","v2":"2","v3":"1","v4":"0"}'),
(@pergunta_id, '{"v1":"3","v2":"4","v3":"-3","v4":"1"}'),
(@pergunta_id, '{"v1":"3","v2":"0","v3":"1","v4":"2"}'),
(@pergunta_id, '{"v1":"3","v2":"2","v3":"4","v4":"5"}'),
(@pergunta_id, '{"v1":"3","v2":"1","v3":"0","v4":"-2"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(411, '{"alt_c":"3","alt_2":"-3","alt_3":"6","alt_4":"0"}'),
(412, '{"alt_c":"3","alt_2":"4","alt_3":"2","alt_4":"-6"}'),
(413, '{"alt_c":"3","alt_2":"5","alt_3":"-2","alt_4":"1"}'),
(414, '{"alt_c":"3","alt_2":"1","alt_3":"2","alt_4":"-1"}'),
(415, '{"alt_c":"3","alt_2":"-2","alt_3":"2","alt_4":"0"}'),
(416, '{"alt_c":"3","alt_2":"2","alt_3":"1","alt_4":"0"}'),
(417, '{"alt_c":"3","alt_2":"4","alt_3":"-3","alt_4":"1"}'),
(418, '{"alt_c":"3","alt_2":"0","alt_3":"1","alt_4":"2"}'),
(419, '{"alt_c":"3","alt_2":"2","alt_3":"4","alt_4":"5"}'),
(420, '{"alt_c":"3","alt_2":"1","alt_3":"0","alt_4":"-2"}');

-- ==========================================
-- PERGUNTA 3
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (9, 'Em f(x) = ax + b, como se calcula o zero da função?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"-b/a","v2":"b/a","v3":"a/b","v4":"a+b"}'),
(@pergunta_id, '{"v1":"-b/a","v2":"b/a","v3":"a-b","v4":"b-a"}'),
(@pergunta_id, '{"v1":"-b/a","v2":"b/a","v3":"a*b","v4":"b/a"}'),
(@pergunta_id, '{"v1":"-b/a","v2":"b/a","v3":"a/b","v4":"a*b"}'),
(@pergunta_id, '{"v1":"-b/a","v2":"a/b","v3":"a*b","v4":"a+b"}'),
(@pergunta_id, '{"v1":"-b/a","v2":"b/a","v3":"a*b","v4":"b/a"}'),
(@pergunta_id, '{"v1":"-b/a","v2":"b/a","v3":"a-b","v4":"b-a"}'),
(@pergunta_id, '{"v1":"-b/a","v2":"b/a","v3":"a/b","v4":"a+b"}'),
(@pergunta_id, '{"v1":"-b/a","v2":"b/a","v3":"a-b","v4":"a*b"}'),
(@pergunta_id, '{"v1":"-b/a","v2":"b/a","v3":"a*b","v4":"a+b"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(421, '{"alt_c":"-b/a","alt_2":"b/a","alt_3":"a/b","alt_4":"a+b"}'),
(422, '{"alt_c":"-b/a","alt_2":"b/a","alt_3":"a-b","alt_4":"b-a"}'),
(423, '{"alt_c":"-b/a","alt_2":"b/a","alt_3":"a*b","alt_4":"b/a"}'),
(424, '{"alt_c":"-b/a","alt_2":"b/a","alt_3":"a/b","alt_4":"a*b"}'),
(425, '{"alt_c":"-b/a","alt_2":"a/b","alt_3":"a*b","alt_4":"a+b"}'),
(426, '{"alt_c":"-b/a","alt_2":"b/a","alt_3":"a*b","alt_4":"b/a"}'),
(427, '{"alt_c":"-b/a","alt_2":"b/a","alt_3":"a-b","alt_4":"b-a"}'),
(428, '{"alt_c":"-b/a","alt_2":"b/a","alt_3":"a/b","alt_4":"a+b"}'),
(429, '{"alt_c":"-b/a","alt_2":"b/a","alt_3":"a-b","alt_4":"a*b"}'),
(430, '{"alt_c":"-b/a","alt_2":"b/a","alt_3":"a*b","alt_4":"a+b"}');

-- ==========================================
-- PERGUNTA 4
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (9, 'Se o coeficiente “b” é igual a zero, qual é o zero da função f(x) = ax + b?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"x = 0"}'),(@pergunta_id, '{"v1":"x = -b/a"}'),
(@pergunta_id, '{"v1":"x = 1"}'),(@pergunta_id, '{"v1":"x = a"}'),
(@pergunta_id, '{"v1":"x = 0"}'),(@pergunta_id, '{"v1":"x = -b/a"}'),
(@pergunta_id, '{"v1":"x = 0"}'),(@pergunta_id, '{"v1":"x = -b/a"}'),
(@pergunta_id, '{"v1":"x = 0"}'),(@pergunta_id, '{"v1":"x = -b/a"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(431, '{"alt_c":"x = 0","alt_2":"x = -b/a"}'),
(432, '{"alt_c":"x = 0","alt_2":"x = -b/a"}'),
(433, '{"alt_c":"x = 0","alt_2":"x = -b/a"}'),
(434, '{"alt_c":"x = 0","alt_2":"x = -b/a"}'),
(435, '{"alt_c":"x = 0","alt_2":"x = -b/a"}'),
(436, '{"alt_c":"x = 0","alt_2":"x = -b/a"}'),
(437, '{"alt_c":"x = 0","alt_2":"x = -b/a"}'),
(438, '{"alt_c":"x = 0","alt_2":"x = -b/a"}'),
(439, '{"alt_c":"x = 0","alt_2":"x = -b/a"}'),
(440, '{"alt_c":"x = 0","alt_2":"x = -b/a"}');

-- ==========================================
-- PERGUNTA 5
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (9, 'Se uma função afim não corta o eixo x, podemos afirmar que não há zero da função?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"Sim"}'),(@pergunta_id, '{"v1":"Não"}'),
(@pergunta_id, '{"v1":"Depende"}'),(@pergunta_id, '{"v1":"Não sei"}'),
(@pergunta_id, '{"v1":"Sim"}'),(@pergunta_id, '{"v1":"Não"}'),
(@pergunta_id, '{"v1":"Sim"}'),(@pergunta_id, '{"v1":"Não"}'),
(@pergunta_id, '{"v1":"Sim"}'),(@pergunta_id, '{"v1":"Não"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(441, '{"alt_c":"Sim","alt_2":"Não"}'),(442, '{"alt_c":"Sim","alt_2":"Não"}'),
(443, '{"alt_c":"Sim","alt_2":"Não"}'),(444, '{"alt_c":"Sim","alt_2":"Não"}'),
(445, '{"alt_c":"Sim","alt_2":"Não"}'),(446, '{"alt_c":"Sim","alt_2":"Não"}'),
(447, '{"alt_c":"Sim","alt_2":"Não"}'),(448, '{"alt_c":"Sim","alt_2":"Não"}'),
(449, '{"alt_c":"Sim","alt_2":"Não"}'),(450, '{"alt_c":"Sim","alt_2":"Não"}');

-- ==========================================
-- PERGUNTA 1
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (10, 'Quando a função afim f(x) = ax + b é positiva?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"Quando ax + b > 0"}'),
(@pergunta_id, '{"v1":"Quando ax + b < 0"}'),
(@pergunta_id, '{"v1":"Quando ax + b = 0"}'),
(@pergunta_id, '{"v1":"Quando a < 0"}'),
(@pergunta_id, '{"v1":"Quando b < 0"}'),
(@pergunta_id, '{"v1":"Quando x > -b/a"}'),
(@pergunta_id, '{"v1":"Quando x < -b/a"}'),
(@pergunta_id, '{"v1":"Sempre"}'),
(@pergunta_id, '{"v1":"Nunca"}'),
(@pergunta_id, '{"v1":"Quando a > 0 e x > -b/a"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(451, '{"alt_c":"Quando ax + b > 0","alt_2":"Quando ax + b < 0","alt_3":"Quando ax + b = 0","alt_4":"Nunca"}'),
(452, '{"alt_c":"Quando ax + b > 0","alt_2":"Quando ax + b < 0","alt_3":"Quando a < 0","alt_4":"Sempre"}'),
(453, '{"alt_c":"Quando ax + b > 0","alt_2":"Quando ax + b = 0","alt_3":"Quando b < 0","alt_4":"Quando a < 0"}'),
(454, '{"alt_c":"Quando ax + b > 0","alt_2":"Quando ax + b < 0","alt_3":"Quando a < 0","alt_4":"Quando x < -b/a"}'),
(455, '{"alt_c":"Quando ax + b > 0","alt_2":"Quando ax + b < 0","alt_3":"Quando b < 0","alt_4":"Quando a > 0"}'),
(456, '{"alt_c":"Quando ax + b > 0","alt_2":"Quando ax + b < 0","alt_3":"Quando a = 0","alt_4":"Quando b = 0"}'),
(457, '{"alt_c":"Quando ax + b > 0","alt_2":"Quando ax + b < 0","alt_3":"Quando a > 0","alt_4":"Sempre"}'),
(458, '{"alt_c":"Quando ax + b > 0","alt_2":"Nunca","alt_3":"Sempre","alt_4":"Quando ax + b < 0"}'),
(459, '{"alt_c":"Quando ax + b > 0","alt_2":"Quando ax + b = 0","alt_3":"Nunca","alt_4":"Quando ax + b < 0"}'),
(460, '{"alt_c":"Quando ax + b > 0","alt_2":"Quando x > -b/a","alt_3":"Quando x < -b/a","alt_4":"Quando a = 0"}');

-- ==========================================
-- PERGUNTA 2
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (10, 'Quando a função afim é negativa?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"Quando ax + b < 0"}'),
(@pergunta_id, '{"v1":"Quando ax + b > 0"}'),
(@pergunta_id, '{"v1":"Quando ax + b = 0"}'),
(@pergunta_id, '{"v1":"Quando a < 0"}'),
(@pergunta_id, '{"v1":"Quando x < -b/a"}'),
(@pergunta_id, '{"v1":"Quando x > -b/a"}'),
(@pergunta_id, '{"v1":"Sempre"}'),
(@pergunta_id, '{"v1":"Nunca"}'),
(@pergunta_id, '{"v1":"Quando b < 0"}'),
(@pergunta_id, '{"v1":"Quando a > 0"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(461, '{"alt_c":"Quando ax + b < 0","alt_2":"Quando ax + b > 0","alt_3":"Quando ax + b = 0","alt_4":"Nunca"}'),
(462, '{"alt_c":"Quando ax + b < 0","alt_2":"Quando ax + b > 0","alt_3":"Quando a < 0","alt_4":"Sempre"}'),
(463, '{"alt_c":"Quando ax + b < 0","alt_2":"Quando ax + b > 0","alt_3":"Quando b < 0","alt_4":"Quando a > 0"}'),
(464, '{"alt_c":"Quando ax + b < 0","alt_2":"Quando ax + b > 0","alt_3":"Quando a < 0","alt_4":"Quando x > -b/a"}'),
(465, '{"alt_c":"Quando ax + b < 0","alt_2":"Quando ax + b > 0","alt_3":"Sempre","alt_4":"Nunca"}'),
(466, '{"alt_c":"Quando ax + b < 0","alt_2":"Quando ax + b > 0","alt_3":"Quando a = 0","alt_4":"Quando b = 0"}'),
(467, '{"alt_c":"Quando ax + b < 0","alt_2":"Quando ax + b > 0","alt_3":"Quando a > 0","alt_4":"Sempre"}'),
(468, '{"alt_c":"Quando ax + b < 0","alt_2":"Nunca","alt_3":"Sempre","alt_4":"Quando ax + b > 0"}'),
(469, '{"alt_c":"Quando ax + b < 0","alt_2":"Quando ax + b = 0","alt_3":"Nunca","alt_4":"Quando ax + b > 0"}'),
(470, '{"alt_c":"Quando ax + b < 0","alt_2":"Quando x < -b/a","alt_3":"Quando x > -b/a","alt_4":"Quando a = 0"}');

-- ==========================================
-- PERGUNTA 3
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (10, 'Se o coeficiente a é positivo, a função é crescente ou decrescente?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"Crescente"}'),
(@pergunta_id, '{"v1":"Decrescente"}'),
(@pergunta_id, '{"v1":"Constante"}'),
(@pergunta_id, '{"v1":"Não sei"}'),
(@pergunta_id, '{"v1":"Crescente"}'),
(@pergunta_id, '{"v1":"Decrescente"}'),
(@pergunta_id, '{"v1":"Crescente"}'),
(@pergunta_id, '{"v1":"Decrescente"}'),
(@pergunta_id, '{"v1":"Crescente"}'),
(@pergunta_id, '{"v1":"Decrescente"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(471, '{"alt_c":"Crescente","alt_2":"Decrescente"}'),
(472, '{"alt_c":"Crescente","alt_2":"Decrescente"}'),
(473, '{"alt_c":"Crescente","alt_2":"Decrescente"}'),
(474, '{"alt_c":"Crescente","alt_2":"Decrescente"}'),
(475, '{"alt_c":"Crescente","alt_2":"Decrescente"}'),
(476, '{"alt_c":"Crescente","alt_2":"Decrescente"}'),
(477, '{"alt_c":"Crescente","alt_2":"Decrescente"}'),
(478, '{"alt_c":"Crescente","alt_2":"Decrescente"}'),
(479, '{"alt_c":"Crescente","alt_2":"Decrescente"}'),
(480, '{"alt_c":"Crescente","alt_2":"Decrescente"}');

-- ==========================================
-- PERGUNTA 4
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (10, 'Se o coeficiente a é negativo, a função é crescente ou decrescente?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"Decrescente"}'),
(@pergunta_id, '{"v1":"Crescente"}'),
(@pergunta_id, '{"v1":"Constante"}'),
(@pergunta_id, '{"v1":"Não sei"}'),
(@pergunta_id, '{"v1":"Decrescente"}'),
(@pergunta_id, '{"v1":"Crescente"}'),
(@pergunta_id, '{"v1":"Decrescente"}'),
(@pergunta_id, '{"v1":"Crescente"}'),
(@pergunta_id, '{"v1":"Decrescente"}'),
(@pergunta_id, '{"v1":"Crescente"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(481, '{"alt_c":"Decrescente","alt_2":"Crescente"}'),
(482, '{"alt_c":"Decrescente","alt_2":"Crescente"}'),
(483, '{"alt_c":"Decrescente","alt_2":"Crescente"}'),
(484, '{"alt_c":"Decrescente","alt_2":"Crescente"}'),
(485, '{"alt_c":"Decrescente","alt_2":"Crescente"}'),
(486, '{"alt_c":"Decrescente","alt_2":"Crescente"}'),
(487, '{"alt_c":"Decrescente","alt_2":"Crescente"}'),
(488, '{"alt_c":"Decrescente","alt_2":"Crescente"}'),
(489, '{"alt_c":"Decrescente","alt_2":"Crescente"}'),
(490, '{"alt_c":"Decrescente","alt_2":"Crescente"}');

-- ==========================================
-- PERGUNTA 5
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (10, 'Em que ponto a função afim muda de sinal?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"No zero da função"}'),
(@pergunta_id, '{"v1":"Quando a = 0"}'),
(@pergunta_id, '{"v1":"Quando b = 0"}'),
(@pergunta_id, '{"v1":"Nunca"}'),
(@pergunta_id, '{"v1":"No zero da função"}'),
(@pergunta_id, '{"v1":"Quando x = 1"}'),
(@pergunta_id, '{"v1":"Quando x = -1"}'),
(@pergunta_id, '{"v1":"Quando x = 0"}'),
(@pergunta_id, '{"v1":"Quando a > 0"}'),
(@pergunta_id, '{"v1":"Quando b < 0"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(491, '{"alt_c":"No zero da função","alt_2":"Quando a = 0","alt_3":"Quando b = 0","alt_4":"Nunca"}'),
(492, '{"alt_c":"No zero da função","alt_2":"Quando x = 1","alt_3":"Quando x = -1","alt_4":"Nunca"}'),
(493, '{"alt_c":"No zero da função","alt_2":"Quando b = 0","alt_3":"Quando a = 0","alt_4":"Nunca"}'),
(494, '{"alt_c":"No zero da função","alt_2":"Quando x = 0","alt_3":"Quando a > 0","alt_4":"Nunca"}'),
(495, '{"alt_c":"No zero da função","alt_2":"Quando b < 0","alt_3":"Quando a = 0","alt_4":"Nunca"}'),
(496, '{"alt_c":"No zero da função","alt_2":"Quando x = 1","alt_3":"Quando x = -1","alt_4":"Nunca"}'),
(497, '{"alt_c":"No zero da função","alt_2":"Quando a = 0","alt_3":"Quando b = 0","alt_4":"Nunca"}'),
(498, '{"alt_c":"No zero da função","alt_2":"Quando a > 0","alt_3":"Quando b < 0","alt_4":"Nunca"}'),
(499, '{"alt_c":"No zero da função","alt_2":"Quando x = 0","alt_3":"Quando a > 0","alt_4":"Nunca"}'),
(500, '{"alt_c":"No zero da função","alt_2":"Quando b = 0","alt_3":"Quando x = 1","alt_4":"Nunca"}');

-- ==========================================
-- PERGUNTA 1
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (11, 'Qual é a forma geral de uma função quadrática?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"f(x) = ax² + bx + c"}'),
(@pergunta_id, '{"v1":"f(x) = ax + b"}'),
(@pergunta_id, '{"v1":"f(x) = a/x + b"}'),
(@pergunta_id, '{"v1":"f(x) = ax³ + bx² + c"}'),
(@pergunta_id, '{"v1":"y = ax² + bx + c"}'),
(@pergunta_id, '{"v1":"f(x) = ax² + bx"}'),
(@pergunta_id, '{"v1":"y = ax²"}'),
(@pergunta_id, '{"v1":"f(x) = ax² + bx + c"}'),
(@pergunta_id, '{"v1":"f(x) = a(x+b)² + c"}'),
(@pergunta_id, '{"v1":"f(x) = ax² - bx + c"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(501, '{"alt_c":"f(x) = ax² + bx + c","alt_2":"f(x) = ax + b","alt_3":"f(x) = a/x + b","alt_4":"f(x) = ax³ + bx² + c"}'),
(502, '{"alt_c":"f(x) = ax² + bx + c","alt_2":"f(x) = ax + b","alt_3":"f(x) = ax³ + bx² + c","alt_4":"y = ax²"}'),
(503, '{"alt_c":"f(x) = ax² + bx + c","alt_2":"f(x) = ax² + bx","alt_3":"y = ax²","alt_4":"f(x) = a/x + b"}'),
(504, '{"alt_c":"f(x) = ax² + bx + c","alt_2":"f(x) = ax³ + bx² + c","alt_3":"y = ax²","alt_4":"f(x) = ax² - bx + c"}'),
(505, '{"alt_c":"f(x) = ax² + bx + c","alt_2":"y = ax²","alt_3":"f(x) = a/x + b","alt_4":"f(x) = ax³ + bx² + c"}'),
(506, '{"alt_c":"f(x) = ax² + bx + c","alt_2":"f(x) = ax + b","alt_3":"y = ax²","alt_4":"f(x) = ax² + bx"}'),
(507, '{"alt_c":"f(x) = ax² + bx + c","alt_2":"f(x) = ax²","alt_3":"f(x) = ax² + bx","alt_4":"y = ax²"}'),
(508, '{"alt_c":"f(x) = ax² + bx + c","alt_2":"f(x) = ax + b","alt_3":"f(x) = a/x + b","alt_4":"y = ax²"}'),
(509, '{"alt_c":"f(x) = ax² + bx + c","alt_2":"f(x) = a(x+b)² + c","alt_3":"f(x) = ax² + bx","alt_4":"y = ax²"}'),
(510, '{"alt_c":"f(x) = ax² + bx + c","alt_2":"f(x) = ax² - bx + c","alt_3":"f(x) = a/x + b","alt_4":"y = ax²"}');

-- ==========================================
-- PERGUNTA 2
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (11, 'Qual é o grau de uma função quadrática?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"2"}'),
(@pergunta_id, '{"v1":"1"}'),
(@pergunta_id, '{"v1":"3"}'),
(@pergunta_id, '{"v1":"4"}'),
(@pergunta_id, '{"v1":"2"}'),
(@pergunta_id, '{"v1":"2"}'),
(@pergunta_id, '{"v1":"3"}'),
(@pergunta_id, '{"v1":"1"}'),
(@pergunta_id, '{"v1":"4"}'),
(@pergunta_id, '{"v1":"2"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(511, '{"alt_c":"2","alt_2":"1","alt_3":"3","alt_4":"4"}'),
(512, '{"alt_c":"2","alt_2":"1","alt_3":"3","alt_4":"4"}'),
(513, '{"alt_c":"2","alt_2":"3","alt_3":"1","alt_4":"4"}'),
(514, '{"alt_c":"2","alt_2":"4","alt_3":"3","alt_4":"1"}'),
(515, '{"alt_c":"2","alt_2":"1","alt_3":"4","alt_4":"3"}'),
(516, '{"alt_c":"2","alt_2":"3","alt_3":"1","alt_4":"4"}'),
(517, '{"alt_c":"2","alt_2":"4","alt_3":"1","alt_4":"3"}'),
(518, '{"alt_c":"2","alt_2":"1","alt_3":"3","alt_4":"4"}'),
(519, '{"alt_c":"2","alt_2":"3","alt_3":"4","alt_4":"1"}'),
(520, '{"alt_c":"2","alt_2":"1","alt_3":"3","alt_4":"4"}');

-- ==========================================
-- PERGUNTA 3
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (11, 'Em uma função quadrática, qual coeficiente determina a concavidade da parábola?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"a"}'),
(@pergunta_id, '{"v1":"b"}'),
(@pergunta_id, '{"v1":"c"}'),
(@pergunta_id, '{"v1":"x"}'),
(@pergunta_id, '{"v1":"a"}'),
(@pergunta_id, '{"v1":"b"}'),
(@pergunta_id, '{"v1":"a"}'),
(@pergunta_id, '{"v1":"c"}'),
(@pergunta_id, '{"v1":"a"}'),
(@pergunta_id, '{"v1":"b"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(521, '{"alt_c":"a","alt_2":"b","alt_3":"c","alt_4":"x"}'),
(522, '{"alt_c":"a","alt_2":"b","alt_3":"c","alt_4":"x"}'),
(523, '{"alt_c":"a","alt_2":"c","alt_3":"b","alt_4":"x"}'),
(524, '{"alt_c":"a","alt_2":"b","alt_3":"c","alt_4":"x"}'),
(525, '{"alt_c":"a","alt_2":"b","alt_3":"c","alt_4":"x"}'),
(526, '{"alt_c":"a","alt_2":"b","alt_3":"c","alt_4":"x"}'),
(527, '{"alt_c":"a","alt_2":"c","alt_3":"b","alt_4":"x"}'),
(528, '{"alt_c":"a","alt_2":"b","alt_3":"c","alt_4":"x"}'),
(529, '{"alt_c":"a","alt_2":"b","alt_3":"c","alt_4":"x"}'),
(530, '{"alt_c":"a","alt_2":"b","alt_3":"c","alt_4":"x"}');

-- ==========================================
-- PERGUNTA 4
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (11, 'Se a > 0, a concavidade da parábola é voltada para cima ou para baixo?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"Para cima"}'),
(@pergunta_id, '{"v1":"Para baixo"}'),
(@pergunta_id, '{"v1":"Depende de b"}'),
(@pergunta_id, '{"v1":"Não sei"}'),
(@pergunta_id, '{"v1":"Para cima"}'),
(@pergunta_id, '{"v1":"Para baixo"}'),
(@pergunta_id, '{"v1":"Para cima"}'),
(@pergunta_id, '{"v1":"Para baixo"}'),
(@pergunta_id, '{"v1":"Para cima"}'),
(@pergunta_id, '{"v1":"Para baixo"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(531, '{"alt_c":"Para cima","alt_2":"Para baixo"}'),
(532, '{"alt_c":"Para cima","alt_2":"Para baixo"}'),
(533, '{"alt_c":"Para cima","alt_2":"Para baixo"}'),
(534, '{"alt_c":"Para cima","alt_2":"Para baixo"}'),
(535, '{"alt_c":"Para cima","alt_2":"Para baixo"}'),
(536, '{"alt_c":"Para cima","alt_2":"Para baixo"}'),
(537, '{"alt_c":"Para cima","alt_2":"Para baixo"}'),
(538, '{"alt_c":"Para cima","alt_2":"Para baixo"}'),
(539, '{"alt_c":"Para cima","alt_2":"Para baixo"}'),
(540, '{"alt_c":"Para cima","alt_2":"Para baixo"}');

-- ==========================================
-- PERGUNTA 5
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (11, 'Se a < 0, a concavidade da parábola é voltada para cima ou para baixo?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"Para baixo"}'),
(@pergunta_id, '{"v1":"Para cima"}'),
(@pergunta_id, '{"v1":"Depende de b"}'),
(@pergunta_id, '{"v1":"Não sei"}'),
(@pergunta_id, '{"v1":"Para baixo"}'),
(@pergunta_id, '{"v1":"Para cima"}'),
(@pergunta_id, '{"v1":"Para baixo"}'),
(@pergunta_id, '{"v1":"Para cima"}'),
(@pergunta_id, '{"v1":"Para baixo"}'),
(@pergunta_id, '{"v1":"Para cima"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(541, '{"alt_c":"Para baixo","alt_2":"Para cima"}'),
(542, '{"alt_c":"Para baixo","alt_2":"Para cima"}'),
(543, '{"alt_c":"Para baixo","alt_2":"Para cima"}'),
(544, '{"alt_c":"Para baixo","alt_2":"Para cima"}'),
(545, '{"alt_c":"Para baixo","alt_2":"Para cima"}'),
(546, '{"alt_c":"Para baixo","alt_2":"Para cima"}'),
(547, '{"alt_c":"Para baixo","alt_2":"Para cima"}'),
(548, '{"alt_c":"Para baixo","alt_2":"Para cima"}'),
(549, '{"alt_c":"Para baixo","alt_2":"Para cima"}'),
(550, '{"alt_c":"Para baixo","alt_2":"Para cima"}');

-- ==========================================
-- PERGUNTA 1
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (12, 'O gráfico de uma função quadrática é uma parábola?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"Sim"}'),(@pergunta_id, '{"v1":"Não"}'),
(@pergunta_id, '{"v1":"Depende"}'),(@pergunta_id, '{"v1":"Não sei"}'),
(@pergunta_id, '{"v1":"Sim"}'),(@pergunta_id, '{"v1":"Não"}'),
(@pergunta_id, '{"v1":"Sim"}'),(@pergunta_id, '{"v1":"Não"}'),
(@pergunta_id, '{"v1":"Sim"}'),(@pergunta_id, '{"v1":"Não"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(551, '{"alt_c":"Sim","alt_2":"Não"}'),
(552, '{"alt_c":"Sim","alt_2":"Não"}'),
(553, '{"alt_c":"Sim","alt_2":"Não"}'),
(554, '{"alt_c":"Sim","alt_2":"Não"}'),
(555, '{"alt_c":"Sim","alt_2":"Não"}'),
(556, '{"alt_c":"Sim","alt_2":"Não"}'),
(557, '{"alt_c":"Sim","alt_2":"Não"}'),
(558, '{"alt_c":"Sim","alt_2":"Não"}'),
(559, '{"alt_c":"Sim","alt_2":"Não"}'),
(560, '{"alt_c":"Sim","alt_2":"Não"}');

-- ==========================================
-- PERGUNTA 2
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (12, 'Quando o coeficiente a é positivo, a parábola se abre para qual direção?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"Para cima"}'),
(@pergunta_id, '{"v1":"Para baixo"}'),
(@pergunta_id, '{"v1":"Para a direita"}'),
(@pergunta_id, '{"v1":"Para a esquerda"}'),
(@pergunta_id, '{"v1":"Para cima"}'),
(@pergunta_id, '{"v1":"Para baixo"}'),
(@pergunta_id, '{"v1":"Para cima"}'),
(@pergunta_id, '{"v1":"Para baixo"}'),
(@pergunta_id, '{"v1":"Para cima"}'),
(@pergunta_id, '{"v1":"Para baixo"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(561, '{"alt_c":"Para cima","alt_2":"Para baixo"}'),
(562, '{"alt_c":"Para cima","alt_2":"Para baixo"}'),
(563, '{"alt_c":"Para cima","alt_2":"Para baixo"}'),
(564, '{"alt_c":"Para cima","alt_2":"Para baixo"}'),
(565, '{"alt_c":"Para cima","alt_2":"Para baixo"}'),
(566, '{"alt_c":"Para cima","alt_2":"Para baixo"}'),
(567, '{"alt_c":"Para cima","alt_2":"Para baixo"}'),
(568, '{"alt_c":"Para cima","alt_2":"Para baixo"}'),
(569, '{"alt_c":"Para cima","alt_2":"Para baixo"}'),
(570, '{"alt_c":"Para cima","alt_2":"Para baixo"}');

-- ==========================================
-- PERGUNTA 3
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (12, 'Quando o coeficiente a é negativo, a parábola se abre para qual direção?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"Para baixo"}'),
(@pergunta_id, '{"v1":"Para cima"}'),
(@pergunta_id, '{"v1":"Para a direita"}'),
(@pergunta_id, '{"v1":"Para a esquerda"}'),
(@pergunta_id, '{"v1":"Para baixo"}'),
(@pergunta_id, '{"v1":"Para cima"}'),
(@pergunta_id, '{"v1":"Para baixo"}'),
(@pergunta_id, '{"v1":"Para cima"}'),
(@pergunta_id, '{"v1":"Para baixo"}'),
(@pergunta_id, '{"v1":"Para cima"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(571, '{"alt_c":"Para baixo","alt_2":"Para cima"}'),
(572, '{"alt_c":"Para baixo","alt_2":"Para cima"}'),
(573, '{"alt_c":"Para baixo","alt_2":"Para cima"}'),
(574, '{"alt_c":"Para baixo","alt_2":"Para cima"}'),
(575, '{"alt_c":"Para baixo","alt_2":"Para cima"}'),
(576, '{"alt_c":"Para baixo","alt_2":"Para cima"}'),
(577, '{"alt_c":"Para baixo","alt_2":"Para cima"}'),
(578, '{"alt_c":"Para baixo","alt_2":"Para cima"}'),
(579, '{"alt_c":"Para baixo","alt_2":"Para cima"}'),
(580, '{"alt_c":"Para baixo","alt_2":"Para cima"}');

-- ==========================================
-- PERGUNTA 4
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (12, 'O ponto em que a parábola muda de direção é chamado de quê?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"Vértice"}'),
(@pergunta_id, '{"v1":"Eixo"}'),
(@pergunta_id, '{"v1":"Origem"}'),
(@pergunta_id, '{"v1":"Raiz"}'),
(@pergunta_id, '{"v1":"Vértice"}'),
(@pergunta_id, '{"v1":"Máximo"}'),
(@pergunta_id, '{"v1":"Mínimo"}'),
(@pergunta_id, '{"v1":"Centro"}'),
(@pergunta_id, '{"v1":"Ponto médio"}'),
(@pergunta_id, '{"v1":"Interseção"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(581, '{"alt_c":"Vértice","alt_2":"Eixo","alt_3":"Origem","alt_4":"Raiz"}'),
(582, '{"alt_c":"Vértice","alt_2":"Máximo","alt_3":"Mínimo","alt_4":"Centro"}'),
(583, '{"alt_c":"Vértice","alt_2":"Ponto médio","alt_3":"Interseção","alt_4":"Raiz"}'),
(584, '{"alt_c":"Vértice","alt_2":"Eixo","alt_3":"Origem","alt_4":"Centro"}'),
(585, '{"alt_c":"Vértice","alt_2":"Máximo","alt_3":"Mínimo","alt_4":"Origem"}'),
(586, '{"alt_c":"Vértice","alt_2":"Eixo","alt_3":"Origem","alt_4":"Centro"}'),
(587, '{"alt_c":"Vértice","alt_2":"Interseção","alt_3":"Raiz","alt_4":"Origem"}'),
(588, '{"alt_c":"Vértice","alt_2":"Centro","alt_3":"Máximo","alt_4":"Mínimo"}'),
(589, '{"alt_c":"Vértice","alt_2":"Eixo","alt_3":"Centro","alt_4":"Origem"}'),
(590, '{"alt_c":"Vértice","alt_2":"Máximo","alt_3":"Mínimo","alt_4":"Centro"}');

-- ==========================================
-- PERGUNTA 5
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (12, 'O eixo de simetria da parábola é representado por qual equação?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"x = -b / (2a)"}'),
(@pergunta_id, '{"v1":"y = ax + b"}'),
(@pergunta_id, '{"v1":"y = -b / (2a)"}'),
(@pergunta_id, '{"v1":"x = b / (2a)"}'),
(@pergunta_id, '{"v1":"x = -b / (2a)"}'),
(@pergunta_id, '{"v1":"x = b / (2a)"}'),
(@pergunta_id, '{"v1":"y = ax² + bx + c"}'),
(@pergunta_id, '{"v1":"x = -b / (2a)"}'),
(@pergunta_id, '{"v1":"y = b / (2a)"}'),
(@pergunta_id, '{"v1":"x = -b / (2a)"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(591, '{"alt_c":"x = -b / (2a)","alt_2":"y = ax + b","alt_3":"y = -b / (2a)","alt_4":"x = b / (2a)"}'),
(592, '{"alt_c":"x = -b / (2a)","alt_2":"y = ax² + bx + c","alt_3":"y = ax + b","alt_4":"x = b / (2a)"}'),
(593, '{"alt_c":"x = -b / (2a)","alt_2":"y = -b / (2a)","alt_3":"x = b / (2a)","alt_4":"y = ax + b"}'),
(594, '{"alt_c":"x = -b / (2a)","alt_2":"x = b / (2a)","alt_3":"y = ax + b","alt_4":"y = ax² + bx + c"}'),
(595, '{"alt_c":"x = -b / (2a)","alt_2":"y = -b / (2a)","alt_3":"x = b / (2a)","alt_4":"y = ax + b"}'),
(596, '{"alt_c":"x = -b / (2a)","alt_2":"x = b / (2a)","alt_3":"y = ax² + bx + c","alt_4":"y = ax + b"}'),
(597, '{"alt_c":"x = -b / (2a)","alt_2":"y = ax + b","alt_3":"x = b / (2a)","alt_4":"y = -b / (2a)"}'),
(598, '{"alt_c":"x = -b / (2a)","alt_2":"y = ax² + bx + c","alt_3":"x = b / (2a)","alt_4":"y = ax + b"}'),
(599, '{"alt_c":"x = -b / (2a)","alt_2":"y = b / (2a)","alt_3":"y = ax + b","alt_4":"x = b / (2a)"}'),
(600, '{"alt_c":"x = -b / (2a)","alt_2":"y = ax² + bx + c","alt_3":"y = ax + b","alt_4":"x = b / (2a)"}');

-- ==========================================
-- PERGUNTA 1
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (13, 'O vértice da parábola representa qual ponto no gráfico de uma função quadrática?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"O ponto de máximo ou mínimo"}'),
(@pergunta_id, '{"v1":"A interseção com o eixo x"}'),
(@pergunta_id, '{"v1":"A interseção com o eixo y"}'),
(@pergunta_id, '{"v1":"O ponto médio da parábola"}'),
(@pergunta_id, '{"v1":"O ponto de máximo ou mínimo"}'),
(@pergunta_id, '{"v1":"O ponto de inflexão"}'),
(@pergunta_id, '{"v1":"O início do gráfico"}'),
(@pergunta_id, '{"v1":"O ponto mais distante da origem"}'),
(@pergunta_id, '{"v1":"O ponto mais baixo ou mais alto da curva"}'),
(@pergunta_id, '{"v1":"O ponto onde a função muda de direção"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(601, '{"alt_c":"O ponto de máximo ou mínimo","alt_2":"A interseção com o eixo x","alt_3":"A interseção com o eixo y","alt_4":"O ponto médio da parábola"}'),
(602, '{"alt_c":"O ponto de máximo ou mínimo","alt_2":"O ponto de inflexão","alt_3":"O início do gráfico","alt_4":"A interseção com o eixo y"}'),
(603, '{"alt_c":"O ponto de máximo ou mínimo","alt_2":"O ponto mais distante da origem","alt_3":"A interseção com o eixo x","alt_4":"O ponto médio da parábola"}'),
(604, '{"alt_c":"O ponto de máximo ou mínimo","alt_2":"O ponto onde a função muda de direção","alt_3":"A interseção com o eixo y","alt_4":"O ponto de inflexão"}'),
(605, '{"alt_c":"O ponto de máximo ou mínimo","alt_2":"O ponto mais baixo ou mais alto da curva","alt_3":"O ponto de inflexão","alt_4":"O ponto médio da parábola"}'),
(606, '{"alt_c":"O ponto de máximo ou mínimo","alt_2":"A interseção com o eixo y","alt_3":"O início do gráfico","alt_4":"O ponto de inflexão"}'),
(607, '{"alt_c":"O ponto de máximo ou mínimo","alt_2":"A interseção com o eixo x","alt_3":"O ponto médio da parábola","alt_4":"O ponto mais distante da origem"}'),
(608, '{"alt_c":"O ponto de máximo ou mínimo","alt_2":"O ponto mais baixo ou mais alto da curva","alt_3":"O ponto onde a função muda de direção","alt_4":"O ponto médio"}'),
(609, '{"alt_c":"O ponto de máximo ou mínimo","alt_2":"A interseção com o eixo y","alt_3":"O ponto mais distante da origem","alt_4":"O ponto médio da parábola"}'),
(610, '{"alt_c":"O ponto de máximo ou mínimo","alt_2":"O ponto de inflexão","alt_3":"O ponto onde a função muda de direção","alt_4":"O início do gráfico"}');

-- ==========================================
-- PERGUNTA 2
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (13, 'Quais são as coordenadas do vértice da parábola?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"(-b/2a, -Δ/4a)"}'),
(@pergunta_id, '{"v1":"(-b/2a, c)"}'),
(@pergunta_id, '{"v1":"(b/2a, -Δ/4a)"}'),
(@pergunta_id, '{"v1":"(b/2a, c)"}'),
(@pergunta_id, '{"v1":"(-b/2a, -Δ/4a)"}'),
(@pergunta_id, '{"v1":"(-b/2a, -b²/4a + c)"}'),
(@pergunta_id, '{"v1":"(-b/2a, b²/4a - c)"}'),
(@pergunta_id, '{"v1":"(-b/2a, -Δ/4a)"}'),
(@pergunta_id, '{"v1":"(-b/2a, -Δ/4a)"}'),
(@pergunta_id, '{"v1":"(b/2a, -Δ/4a)"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(611, '{"alt_c":"(-b/2a, -Δ/4a)","alt_2":"(-b/2a, c)","alt_3":"(b/2a, -Δ/4a)","alt_4":"(b/2a, c)"}'),
(612, '{"alt_c":"(-b/2a, -Δ/4a)","alt_2":"(-b/2a, -b²/4a + c)","alt_3":"(b/2a, c)","alt_4":"(b/2a, -Δ/4a)"}'),
(613, '{"alt_c":"(-b/2a, -Δ/4a)","alt_2":"(b/2a, -Δ/4a)","alt_3":"(b/2a, c)","alt_4":"(-b/2a, c)"}'),
(614, '{"alt_c":"(-b/2a, -Δ/4a)","alt_2":"(-b/2a, c)","alt_3":"(b/2a, -Δ/4a)","alt_4":"(-b/2a, -b²/4a + c)"}'),
(615, '{"alt_c":"(-b/2a, -Δ/4a)","alt_2":"(-b/2a, b²/4a - c)","alt_3":"(-b/2a, c)","alt_4":"(b/2a, c)"}'),
(616, '{"alt_c":"(-b/2a, -Δ/4a)","alt_2":"(-b/2a, -b²/4a + c)","alt_3":"(b/2a, -Δ/4a)","alt_4":"(b/2a, c)"}'),
(617, '{"alt_c":"(-b/2a, -Δ/4a)","alt_2":"(-b/2a, c)","alt_3":"(-b/2a, -b²/4a + c)","alt_4":"(b/2a, -Δ/4a)"}'),
(618, '{"alt_c":"(-b/2a, -Δ/4a)","alt_2":"(-b/2a, c)","alt_3":"(b/2a, c)","alt_4":"(-b/2a, -b²/4a + c)"}'),
(619, '{"alt_c":"(-b/2a, -Δ/4a)","alt_2":"(b/2a, -Δ/4a)","alt_3":"(b/2a, c)","alt_4":"(-b/2a, c)"}'),
(620, '{"alt_c":"(-b/2a, -Δ/4a)","alt_2":"(b/2a, c)","alt_3":"(-b/2a, c)","alt_4":"(b/2a, -Δ/4a)"}');

-- ==========================================
-- PERGUNTA 3
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (13, 'Quando a > 0, o vértice representa um ponto de máximo ou mínimo?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"Mínimo"}'),
(@pergunta_id, '{"v1":"Máximo"}'),
(@pergunta_id, '{"v1":"Nenhum"}'),
(@pergunta_id, '{"v1":"Não sei"}'),
(@pergunta_id, '{"v1":"Mínimo"}'),
(@pergunta_id, '{"v1":"Máximo"}'),
(@pergunta_id, '{"v1":"Mínimo"}'),
(@pergunta_id, '{"v1":"Máximo"}'),
(@pergunta_id, '{"v1":"Mínimo"}'),
(@pergunta_id, '{"v1":"Máximo"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(621, '{"alt_c":"Mínimo","alt_2":"Máximo"}'),
(622, '{"alt_c":"Mínimo","alt_2":"Máximo"}'),
(623, '{"alt_c":"Mínimo","alt_2":"Máximo"}'),
(624, '{"alt_c":"Mínimo","alt_2":"Máximo"}'),
(625, '{"alt_c":"Mínimo","alt_2":"Máximo"}'),
(626, '{"alt_c":"Mínimo","alt_2":"Máximo"}'),
(627, '{"alt_c":"Mínimo","alt_2":"Máximo"}'),
(628, '{"alt_c":"Mínimo","alt_2":"Máximo"}'),
(629, '{"alt_c":"Mínimo","alt_2":"Máximo"}'),
(630, '{"alt_c":"Mínimo","alt_2":"Máximo"}');

-- ==========================================
-- PERGUNTA 4
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (13, 'Quando a < 0, o vértice representa um ponto de máximo ou mínimo?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"Máximo"}'),
(@pergunta_id, '{"v1":"Mínimo"}'),
(@pergunta_id, '{"v1":"Nenhum"}'),
(@pergunta_id, '{"v1":"Não sei"}'),
(@pergunta_id, '{"v1":"Máximo"}'),
(@pergunta_id, '{"v1":"Mínimo"}'),
(@pergunta_id, '{"v1":"Máximo"}'),
(@pergunta_id, '{"v1":"Mínimo"}'),
(@pergunta_id, '{"v1":"Máximo"}'),
(@pergunta_id, '{"v1":"Mínimo"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(631, '{"alt_c":"Máximo","alt_2":"Mínimo"}'),
(632, '{"alt_c":"Máximo","alt_2":"Mínimo"}'),
(633, '{"alt_c":"Máximo","alt_2":"Mínimo"}'),
(634, '{"alt_c":"Máximo","alt_2":"Mínimo"}'),
(635, '{"alt_c":"Máximo","alt_2":"Mínimo"}'),
(636, '{"alt_c":"Máximo","alt_2":"Mínimo"}'),
(637, '{"alt_c":"Máximo","alt_2":"Mínimo"}'),
(638, '{"alt_c":"Máximo","alt_2":"Mínimo"}'),
(639, '{"alt_c":"Máximo","alt_2":"Mínimo"}'),
(640, '{"alt_c":"Máximo","alt_2":"Mínimo"}');

-- ==========================================
-- PERGUNTA 5
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (13, 'Como determinar o valor de yv (ordenada do vértice)?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"Substituindo xv em f(x)"}'),
(@pergunta_id, '{"v1":"Usando Δ = b² - 4ac"}'),
(@pergunta_id, '{"v1":"Usando xv = -b/2a"}'),
(@pergunta_id, '{"v1":"Usando y = 0"}'),
(@pergunta_id, '{"v1":"Substituindo xv em f(x)"}'),
(@pergunta_id, '{"v1":"Calculando -Δ/4a"}'),
(@pergunta_id, '{"v1":"Usando a fórmula de Bhaskara"}'),
(@pergunta_id, '{"v1":"Substituindo b e c diretamente"}'),
(@pergunta_id, '{"v1":"Substituindo xv em f(x)"}'),
(@pergunta_id, '{"v1":"Usando f(0)"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(641, '{"alt_c":"Substituindo xv em f(x)","alt_2":"Usando Δ = b² - 4ac","alt_3":"Usando xv = -b/2a","alt_4":"Usando y = 0"}'),
(642, '{"alt_c":"Substituindo xv em f(x)","alt_2":"Usando f(0)","alt_3":"Usando xv = -b/2a","alt_4":"Usando Δ = b² - 4ac"}'),
(643, '{"alt_c":"Substituindo xv em f(x)","alt_2":"Usando Δ = b² - 4ac","alt_3":"Usando y = 0","alt_4":"Usando a fórmula de Bhaskara"}'),
(644, '{"alt_c":"Substituindo xv em f(x)","alt_2":"Usando xv = -b/2a","alt_3":"Substituindo b e c diretamente","alt_4":"Usando f(0)"}'),
(645, '{"alt_c":"Substituindo xv em f(x)","alt_2":"Calculando -Δ/4a","alt_3":"Usando xv = -b/2a","alt_4":"Usando y = 0"}'),
(646, '{"alt_c":"Substituindo xv em f(x)","alt_2":"Usando Δ = b² - 4ac","alt_3":"Usando f(0)","alt_4":"Usando xv = -b/2a"}'),
(647, '{"alt_c":"Substituindo xv em f(x)","alt_2":"Usando a fórmula de Bhaskara","alt_3":"Substituindo b e c diretamente","alt_4":"Usando f(0)"}'),
(648, '{"alt_c":"Substituindo xv em f(x)","alt_2":"Usando xv = -b/2a","alt_3":"Usando Δ = b² - 4ac","alt_4":"Usando y = 0"}'),
(649, '{"alt_c":"Substituindo xv em f(x)","alt_2":"Usando Δ = b² - 4ac","alt_3":"Usando xv = -b/2a","alt_4":"Usando f(0)"}'),
(650, '{"alt_c":"Substituindo xv em f(x)","alt_2":"Usando y = 0","alt_3":"Usando xv = -b/2a","alt_4":"Usando Δ = b² - 4ac"}');

-- ==========================================
-- PERGUNTA 1
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (14, 'Qual é a forma canônica de uma função quadrática?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"f(x) = a(x - x_v)² + y_v"}'),
(@pergunta_id, '{"v1":"f(x) = ax² + bx + c"}'),
(@pergunta_id, '{"v1":"f(x) = a(x + b)² + c"}'),
(@pergunta_id, '{"v1":"f(x) = a(x - h)² + k"}'),
(@pergunta_id, '{"v1":"f(x) = a(x - x_v)² + y_v"}'),
(@pergunta_id, '{"v1":"f(x) = a(x + b)² - c"}'),
(@pergunta_id, '{"v1":"f(x) = ax² + bx"}'),
(@pergunta_id, '{"v1":"f(x) = a(x - x_v)² + y_v"}'),
(@pergunta_id, '{"v1":"f(x) = a(x - x₀)² + y₀"}'),
(@pergunta_id, '{"v1":"f(x) = a(x + x_v)² - y_v"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(651, '{"alt_c":"f(x) = a(x - x_v)² + y_v","alt_2":"f(x) = ax² + bx + c","alt_3":"f(x) = a(x + b)² + c","alt_4":"f(x) = a(x + x_v)² - y_v"}'),
(652, '{"alt_c":"f(x) = a(x - x_v)² + y_v","alt_2":"f(x) = a(x - h)² + k","alt_3":"f(x) = ax² + bx","alt_4":"f(x) = a(x + b)² - c"}'),
(653, '{"alt_c":"f(x) = a(x - x_v)² + y_v","alt_2":"f(x) = a(x - x₀)² + y₀","alt_3":"f(x) = a(x + b)² + c","alt_4":"f(x) = ax² + bx + c"}'),
(654, '{"alt_c":"f(x) = a(x - x_v)² + y_v","alt_2":"f(x) = a(x + b)² + c","alt_3":"f(x) = ax² + bx","alt_4":"f(x) = a(x - h)² + k"}'),
(655, '{"alt_c":"f(x) = a(x - x_v)² + y_v","alt_2":"f(x) = a(x + x_v)² - y_v","alt_3":"f(x) = a(x + b)² - c","alt_4":"f(x) = ax² + bx + c"}'),
(656, '{"alt_c":"f(x) = a(x - x_v)² + y_v","alt_2":"f(x) = a(x - h)² + k","alt_3":"f(x) = ax² + bx","alt_4":"f(x) = a(x + b)² + c"}'),
(657, '{"alt_c":"f(x) = a(x - x_v)² + y_v","alt_2":"f(x) = ax² + bx + c","alt_3":"f(x) = a(x - h)² + k","alt_4":"f(x) = a(x + b)² - c"}'),
(658, '{"alt_c":"f(x) = a(x - x_v)² + y_v","alt_2":"f(x) = a(x + x_v)² - y_v","alt_3":"f(x) = a(x - h)² + k","alt_4":"f(x) = a(x + b)² + c"}'),
(659, '{"alt_c":"f(x) = a(x - x_v)² + y_v","alt_2":"f(x) = a(x - x₀)² + y₀","alt_3":"f(x) = a(x + b)² - c","alt_4":"f(x) = ax² + bx"}'),
(660, '{"alt_c":"f(x) = a(x - x_v)² + y_v","alt_2":"f(x) = a(x - h)² + k","alt_3":"f(x) = ax² + bx + c","alt_4":"f(x) = a(x + b)² - c"}');

-- ==========================================
-- PERGUNTA 2
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (14, 'Na forma canônica f(x) = a(x - x_v)² + y_v, o ponto (x_v, y_v) representa:');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"O vértice da parábola"}'),
(@pergunta_id, '{"v1":"A origem do gráfico"}'),
(@pergunta_id, '{"v1":"A interseção com o eixo x"}'),
(@pergunta_id, '{"v1":"A interseção com o eixo y"}'),
(@pergunta_id, '{"v1":"O vértice da parábola"}'),
(@pergunta_id, '{"v1":"O ponto máximo da função"}'),
(@pergunta_id, '{"v1":"O ponto mínimo da função"}'),
(@pergunta_id, '{"v1":"Um ponto qualquer da parábola"}'),
(@pergunta_id, '{"v1":"O centro da parábola"}'),
(@pergunta_id, '{"v1":"O ponto onde a parábola muda de concavidade"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(661, '{"alt_c":"O vértice da parábola","alt_2":"A origem do gráfico","alt_3":"A interseção com o eixo x","alt_4":"A interseção com o eixo y"}'),
(662, '{"alt_c":"O vértice da parábola","alt_2":"O ponto máximo da função","alt_3":"O centro da parábola","alt_4":"A origem do gráfico"}'),
(663, '{"alt_c":"O vértice da parábola","alt_2":"O ponto mínimo da função","alt_3":"A interseção com o eixo x","alt_4":"Um ponto qualquer da parábola"}'),
(664, '{"alt_c":"O vértice da parábola","alt_2":"O ponto onde a parábola muda de concavidade","alt_3":"A interseção com o eixo y","alt_4":"A origem do gráfico"}'),
(665, '{"alt_c":"O vértice da parábola","alt_2":"O ponto máximo da função","alt_3":"O ponto mínimo da função","alt_4":"O centro da parábola"}'),
(666, '{"alt_c":"O vértice da parábola","alt_2":"A interseção com o eixo x","alt_3":"A origem do gráfico","alt_4":"A interseção com o eixo y"}'),
(667, '{"alt_c":"O vértice da parábola","alt_2":"Um ponto qualquer da parábola","alt_3":"O ponto máximo da função","alt_4":"A origem do gráfico"}'),
(668, '{"alt_c":"O vértice da parábola","alt_2":"O ponto mínimo da função","alt_3":"O centro da parábola","alt_4":"A interseção com o eixo x"}'),
(669, '{"alt_c":"O vértice da parábola","alt_2":"A interseção com o eixo y","alt_3":"A origem do gráfico","alt_4":"O ponto máximo da função"}'),
(670, '{"alt_c":"O vértice da parábola","alt_2":"O ponto onde a parábola muda de concavidade","alt_3":"Um ponto qualquer da parábola","alt_4":"O centro da parábola"}');

-- ==========================================
-- PERGUNTA 3
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (14, 'Qual é a principal utilidade da forma canônica?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"Determinar o vértice da parábola"}'),
(@pergunta_id, '{"v1":"Encontrar as raízes"}'),
(@pergunta_id, '{"v1":"Calcular o discriminante"}'),
(@pergunta_id, '{"v1":"Obter o coeficiente angular"}'),
(@pergunta_id, '{"v1":"Determinar o vértice da parábola"}'),
(@pergunta_id, '{"v1":"Simplificar a forma geral"}'),
(@pergunta_id, '{"v1":"Transformar a parábola em reta"}'),
(@pergunta_id, '{"v1":"Facilitar o esboço do gráfico"}'),
(@pergunta_id, '{"v1":"Determinar o ponto de interseção com o eixo y"}'),
(@pergunta_id, '{"v1":"Encontrar o foco"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(671, '{"alt_c":"Determinar o vértice da parábola","alt_2":"Encontrar as raízes","alt_3":"Calcular o discriminante","alt_4":"Obter o coeficiente angular"}'),
(672, '{"alt_c":"Determinar o vértice da parábola","alt_2":"Facilitar o esboço do gráfico","alt_3":"Simplificar a forma geral","alt_4":"Encontrar o foco"}'),
(673, '{"alt_c":"Determinar o vértice da parábola","alt_2":"Encontrar as raízes","alt_3":"Simplificar a forma geral","alt_4":"Calcular o discriminante"}'),
(674, '{"alt_c":"Determinar o vértice da parábola","alt_2":"Facilitar o esboço do gráfico","alt_3":"Obter o coeficiente angular","alt_4":"Encontrar o foco"}'),
(675, '{"alt_c":"Determinar o vértice da parábola","alt_2":"Encontrar as raízes","alt_3":"Simplificar a forma geral","alt_4":"Calcular o discriminante"}'),
(676, '{"alt_c":"Determinar o vértice da parábola","alt_2":"Facilitar o esboço do gráfico","alt_3":"Encontrar o foco","alt_4":"Obter o coeficiente angular"}'),
(677, '{"alt_c":"Determinar o vértice da parábola","alt_2":"Simplificar a forma geral","alt_3":"Encontrar as raízes","alt_4":"Calcular o discriminante"}'),
(678, '{"alt_c":"Determinar o vértice da parábola","alt_2":"Encontrar o foco","alt_3":"Facilitar o esboço do gráfico","alt_4":"Obter o coeficiente angular"}'),
(679, '{"alt_c":"Determinar o vértice da parábola","alt_2":"Encontrar as raízes","alt_3":"Simplificar a forma geral","alt_4":"Encontrar o foco"}'),
(680, '{"alt_c":"Determinar o vértice da parábola","alt_2":"Facilitar o esboço do gráfico","alt_3":"Calcular o discriminante","alt_4":"Obter o coeficiente angular"}');

-- ==========================================
-- PERGUNTA 4
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (14, 'Na forma canônica, o coeficiente a indica:');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"A concavidade e a abertura da parábola"}'),
(@pergunta_id, '{"v1":"A posição do vértice"}'),
(@pergunta_id, '{"v1":"A interseção com o eixo y"}'),
(@pergunta_id, '{"v1":"A distância entre as raízes"}'),
(@pergunta_id, '{"v1":"A concavidade e a abertura da parábola"}'),
(@pergunta_id, '{"v1":"O deslocamento horizontal"}'),
(@pergunta_id, '{"v1":"O valor de y_v"}'),
(@pergunta_id, '{"v1":"O formato da parábola"}'),
(@pergunta_id, '{"v1":"A orientação da curva"}'),
(@pergunta_id, '{"v1":"O grau do polinômio"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(681, '{"alt_c":"A concavidade e a abertura da parábola","alt_2":"A posição do vértice","alt_3":"A interseção com o eixo y","alt_4":"A distância entre as raízes"}'),
(682, '{"alt_c":"A concavidade e a abertura da parábola","alt_2":"O deslocamento horizontal","alt_3":"O valor de y_v","alt_4":"O formato da parábola"}'),
(683, '{"alt_c":"A concavidade e a abertura da parábola","alt_2":"O grau do polinômio","alt_3":"A posição do vértice","alt_4":"A interseção com o eixo y"}'),
(684, '{"alt_c":"A concavidade e a abertura da parábola","alt_2":"O formato da parábola","alt_3":"A distância entre as raízes","alt_4":"A orientação da curva"}'),
(685, '{"alt_c":"A concavidade e a abertura da parábola","alt_2":"A posição do vértice","alt_3":"O valor de y_v","alt_4":"O deslocamento horizontal"}'),
(686, '{"alt_c":"A concavidade e a abertura da parábola","alt_2":"A orientação da curva","alt_3":"O grau do polinômio","alt_4":"A distância entre as raízes"}'),
(687, '{"alt_c":"A concavidade e a abertura da parábola","alt_2":"O formato da parábola","alt_3":"O valor de y_v","alt_4":"A posição do vértice"}'),
(688, '{"alt_c":"A concavidade e a abertura da parábola","alt_2":"A distância entre as raízes","alt_3":"A orientação da curva","alt_4":"A posição do vértice"}'),
(689, '{"alt_c":"A concavidade e a abertura da parábola","alt_2":"A interseção com o eixo y","alt_3":"O formato da parábola","alt_4":"O grau do polinômio"}'),
(690, '{"alt_c":"A concavidade e a abertura da parábola","alt_2":"O deslocamento horizontal","alt_3":"A orientação da curva","alt_4":"A posição do vértice"}');

-- ==========================================
-- PERGUNTA 5
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (14, 'Como converter da forma geral f(x) = ax² + bx + c para a forma canônica?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"Completando o quadrado"}'),
(@pergunta_id, '{"v1":"Usando Bhaskara"}'),
(@pergunta_id, '{"v1":"Derivando a função"}'),
(@pergunta_id, '{"v1":"Somando os coeficientes"}'),
(@pergunta_id, '{"v1":"Completando o quadrado"}'),
(@pergunta_id, '{"v1":"Usando a fórmula do vértice"}'),
(@pergunta_id, '{"v1":"Substituindo b = 2a"}'),
(@pergunta_id, '{"v1":"Completando o quadrado"}'),
(@pergunta_id, '{"v1":"Aplicando Δ = b² - 4ac"}'),
(@pergunta_id, '{"v1":"Isolando o x"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(691, '{"alt_c":"Completando o quadrado","alt_2":"Usando Bhaskara","alt_3":"Derivando a função","alt_4":"Somando os coeficientes"}'),
(692, '{"alt_c":"Completando o quadrado","alt_2":"Usando a fórmula do vértice","alt_3":"Isolando o x","alt_4":"Aplicando Δ = b² - 4ac"}'),
(693, '{"alt_c":"Completando o quadrado","alt_2":"Substituindo b = 2a","alt_3":"Usando Bhaskara","alt_4":"Isolando o x"}'),
(694, '{"alt_c":"Completando o quadrado","alt_2":"Usando a fórmula do vértice","alt_3":"Somando os coeficientes","alt_4":"Aplicando Δ = b² - 4ac"}'),
(695, '{"alt_c":"Completando o quadrado","alt_2":"Derivando a função","alt_3":"Substituindo b = 2a","alt_4":"Usando Bhaskara"}'),
(696, '{"alt_c":"Completando o quadrado","alt_2":"Usando a fórmula do vértice","alt_3":"Aplicando Δ = b² - 4ac","alt_4":"Somando os coeficientes"}'),
(697, '{"alt_c":"Completando o quadrado","alt_2":"Isolando o x","alt_3":"Usando Bhaskara","alt_4":"Substituindo b = 2a"}'),
(698, '{"alt_c":"Completando o quadrado","alt_2":"Somando os coeficientes","alt_3":"Derivando a função","alt_4":"Aplicando Δ = b² - 4ac"}'),
(699, '{"alt_c":"Completando o quadrado","alt_2":"Usando a fórmula do vértice","alt_3":"Isolando o x","alt_4":"Somando os coeficientes"}'),
(700, '{"alt_c":"Completando o quadrado","alt_2":"Substituindo b = 2a","alt_3":"Aplicando Δ = b² - 4ac","alt_4":"Usando Bhaskara"}');

-- ==========================================
-- PERGUNTA 1
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (15, 'O que representam os zeros de uma função quadrática?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"Os valores de x que tornam f(x) = 0"}'),
(@pergunta_id, '{"v1":"Os valores máximos da parábola"}'),
(@pergunta_id, '{"v1":"Os valores de y para os quais x = 0"}'),
(@pergunta_id, '{"v1":"O ponto mais alto do gráfico"}'),
(@pergunta_id, '{"v1":"As interseções com o eixo x"}'),
(@pergunta_id, '{"v1":"Os pontos onde a parábola corta o eixo y"}'),
(@pergunta_id, '{"v1":"Os valores de x em que f(x) ≠ 0"}'),
(@pergunta_id, '{"v1":"Os vértices da parábola"}'),
(@pergunta_id, '{"v1":"Os coeficientes da equação"}'),
(@pergunta_id, '{"v1":"As soluções da equação quadrática"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(701, '{"alt_c":"Os valores de x que tornam f(x) = 0","alt_2":"Os valores máximos da parábola","alt_3":"Os valores de y para os quais x = 0","alt_4":"Os coeficientes da equação"}'),
(702, '{"alt_c":"Os valores de x que tornam f(x) = 0","alt_2":"As interseções com o eixo x","alt_3":"Os pontos onde a parábola corta o eixo y","alt_4":"Os vértices da parábola"}'),
(703, '{"alt_c":"Os valores de x que tornam f(x) = 0","alt_2":"Os valores de y para os quais x = 0","alt_3":"Os valores máximos da parábola","alt_4":"O ponto mais alto do gráfico"}'),
(704, '{"alt_c":"Os valores de x que tornam f(x) = 0","alt_2":"As soluções da equação quadrática","alt_3":"Os vértices da parábola","alt_4":"Os coeficientes da equação"}'),
(705, '{"alt_c":"Os valores de x que tornam f(x) = 0","alt_2":"Os valores máximos da parábola","alt_3":"Os valores de x em que f(x) ≠ 0","alt_4":"O ponto mais alto do gráfico"}'),
(706, '{"alt_c":"Os valores de x que tornam f(x) = 0","alt_2":"As interseções com o eixo x","alt_3":"Os vértices da parábola","alt_4":"Os coeficientes da equação"}'),
(707, '{"alt_c":"Os valores de x que tornam f(x) = 0","alt_2":"Os valores máximos da parábola","alt_3":"Os valores de y para os quais x = 0","alt_4":"O ponto mais alto do gráfico"}'),
(708, '{"alt_c":"Os valores de x que tornam f(x) = 0","alt_2":"Os coeficientes da equação","alt_3":"Os vértices da parábola","alt_4":"As interseções com o eixo x"}'),
(709, '{"alt_c":"Os valores de x que tornam f(x) = 0","alt_2":"Os valores máximos da parábola","alt_3":"Os valores de y para os quais x = 0","alt_4":"As soluções da equação quadrática"}'),
(710, '{"alt_c":"Os valores de x que tornam f(x) = 0","alt_2":"Os vértices da parábola","alt_3":"Os coeficientes da equação","alt_4":"O ponto mais alto do gráfico"}');

-- ==========================================
-- PERGUNTA 2 (PRÁTICA - Corrigida com notação HTML)
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (15, 'Descubra as raízes da equação ( v1 ) x² + ( v2 ) x + ( v3 ) = 0.');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":1,"v2":-3,"v3":2}'),
(@pergunta_id, '{"v1":1,"v2":-5,"v3":6}'),
(@pergunta_id, '{"v1":1,"v2":2,"v3":-3}'),
(@pergunta_id, '{"v1":1,"v2":0,"v3":-4}'),
(@pergunta_id, '{"v1":2,"v2":-7,"v3":3}'),
(@pergunta_id, '{"v1":1,"v2":-1,"v3":-6}'),
(@pergunta_id, '{"v1":3,"v2":-5,"v3":2}'),
(@pergunta_id, '{"v1":1,"v2":-4,"v3":4}'),
(@pergunta_id, '{"v1":2,"v2":-8,"v3":6}'),
(@pergunta_id, '{"v1":1,"v2":1,"v3":-12}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(711, '{"alt_c":"x&#8321;=1, x&#8322;=2","alt_2":"x&#8321;=-1, x&#8322;=-2","alt_3":"x&#8321;=3, x&#8322;=-2","alt_4":"x&#8321;=0, x&#8322;=2"}'),
(712, '{"alt_c":"x&#8321;=2, x&#8322;=3","alt_2":"x&#8321;=1, x&#8322;=6","alt_3":"x&#8321;=-1, x&#8322;=-3","alt_4":"x&#8321;=0, x&#8322;=5"}'),
(713, '{"alt_c":"x&#8321;=1, x&#8322;=-3","alt_2":"x&#8321;=-1, x&#8322;=3","alt_3":"x&#8321;=2, x&#8322;=-2","alt_4":"x&#8321;=-3, x&#8322;=1"}'),
(714, '{"alt_c":"x&#8321;=2, x&#8322;=-2","alt_2":"x&#8321;=-4, x&#8322;=0","alt_3":"x&#8321;=1, x&#8322;=4","alt_4":"x&#8321;=0, x&#8322;=3"}'),
(715, '{"alt_c":"x&#8321;=3, x&#8322;=0.5","alt_2":"x&#8321;=1, x&#8322;=2","alt_3":"x&#8321;=4, x&#8322;=-3","alt_4":"x&#8321;=2, x&#8322;=-1"}'),
(716, '{"alt_c":"x&#8321;=3, x&#8322;=-2","alt_2":"x&#8321;=2, x&#8322;=-3","alt_3":"x&#8321;=1, x&#8322;=-6","alt_4":"x&#8321;=-1, x&#8322;=6"}'),
(717, '{"alt_c":"x&#8321;=1, x&#8322;=2/3","alt_2":"x&#8321;=3, x&#8322;=5","alt_3":"x&#8321;=-1, x&#8322;=-2","alt_4":"x&#8321;=0, x&#8322;=1"}'),
(718, '{"alt_c":"x&#8321;=2, x&#8322;=2","alt_2":"x&#8321;=-2, x&#8322;=2","alt_3":"x&#8321;=4, x&#8322;=-4","alt_4":"x&#8321;=0, x&#8322;=4"}'),
(719, '{"alt_c":"x&#8321;=2, x&#8322;=1.5","alt_2":"x&#8321;=3, x&#8322;=-2","alt_3":"x&#8321;=0, x&#8322;=4","alt_4":"x&#8321;=-3, x&#8322;=1"}'),
(720, '{"alt_c":"x&#8321;=3, x&#8322;=-4","alt_2":"x&#8321;=-3, x&#8322;=4","alt_3":"x&#8321;=6, x&#8322;=-2","alt_4":"x&#8321;=-1, x&#8322;=12"}');

-- ==========================================
-- PERGUNTA 3
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (15, 'Quantos zeros reais uma função quadrática pode ter?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"0, 1 ou 2"}'),
(@pergunta_id, '{"v1":"Apenas 2"}'),
(@pergunta_id, '{"v1":"Apenas 1"}'),
(@pergunta_id, '{"v1":"Infinitos"}'),
(@pergunta_id, '{"v1":"Depende do valor de Δ"}'),
(@pergunta_id, '{"v1":"Pode não ter zeros reais"}'),
(@pergunta_id, '{"v1":"Apenas 0"}'),
(@pergunta_id, '{"v1":"Depende dos coeficientes"}'),
(@pergunta_id, '{"v1":"Entre 0 e 3"}'),
(@pergunta_id, '{"v1":"Apenas quando Δ > 0"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(721, '{"alt_c":"0, 1 ou 2","alt_2":"Apenas 2","alt_3":"Apenas 1","alt_4":"Infinitos"}'),
(722, '{"alt_c":"0, 1 ou 2","alt_2":"Depende do valor de Δ","alt_3":"Pode não ter zeros reais","alt_4":"Apenas quando Δ > 0"}'),
(723, '{"alt_c":"0, 1 ou 2","alt_2":"Depende dos coeficientes","alt_3":"Apenas 1","alt_4":"Apenas 0"}'),
(724, '{"alt_c":"0, 1 ou 2","alt_2":"Apenas 2","alt_3":"Depende do valor de Δ","alt_4":"Pode não ter zeros reais"}'),
(725, '{"alt_c":"0, 1 ou 2","alt_2":"Depende do valor de Δ","alt_3":"Depende dos coeficientes","alt_4":"Apenas 1"}'),
(726, '{"alt_c":"0, 1 ou 2","alt_2":"Apenas quando Δ > 0","alt_3":"Pode não ter zeros reais","alt_4":"Infinitos"}'),
(727, '{"alt_c":"0, 1 ou 2","alt_2":"Depende dos coeficientes","alt_3":"Apenas 1","alt_4":"Apenas 0"}'),
(728, '{"alt_c":"0, 1 ou 2","alt_2":"Depende do valor de Δ","alt_3":"Apenas quando Δ > 0","alt_4":"Apenas 2"}'),
(729, '{"alt_c":"0, 1 ou 2","alt_2":"Depende dos coeficientes","alt_3":"Apenas 0","alt_4":"Infinitos"}'),
(730, '{"alt_c":"0, 1 ou 2","alt_2":"Pode não ter zeros reais","alt_3":"Depende do valor de Δ","alt_4":"Apenas quando Δ > 0"}');

-- ==========================================
-- PERGUNTA 4
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (15, 'O que indica o valor do discriminante (Δ) em uma função quadrática?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"O número de raízes reais"}'),
(@pergunta_id, '{"v1":"A concavidade da parábola"}'),
(@pergunta_id, '{"v1":"O vértice da parábola"}'),
(@pergunta_id, '{"v1":"O valor máximo de f(x)"}'),
(@pergunta_id, '{"v1":"A posição do eixo de simetria"}'),
(@pergunta_id, '{"v1":"A quantidade de interseções com o eixo x"}'),
(@pergunta_id, '{"v1":"A existência de raízes reais"}'),
(@pergunta_id, '{"v1":"O ponto onde f(x)=0"}'),
(@pergunta_id, '{"v1":"O deslocamento horizontal"}'),
(@pergunta_id, '{"v1":"O valor de y quando x=0"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(731, '{"alt_c":"O número de raízes reais","alt_2":"A concavidade da parábola","alt_3":"O vértice da parábola","alt_4":"O valor máximo de f(x)"}'),
(732, '{"alt_c":"O número de raízes reais","alt_2":"A existência de raízes reais","alt_3":"A posição do eixo de simetria","alt_4":"O deslocamento horizontal"}'),
(733, '{"alt_c":"O número de raízes reais","alt_2":"A quantidade de interseções com o eixo x","alt_3":"O ponto onde f(x)=0","alt_4":"O valor de y quando x=0"}'),
(734, '{"alt_c":"O número de raízes reais","alt_2":"O vértice da parábola","alt_3":"A concavidade da parábola","alt_4":"O valor de y quando x=0"}'),
(735, '{"alt_c":"O número de raízes reais","alt_2":"A posição do eixo de simetria","alt_3":"O deslocamento horizontal","alt_4":"O vértice da parábola"}'),
(736, '{"alt_c":"O número de raízes reais","alt_2":"O ponto onde f(x)=0","alt_3":"A concavidade da parábola","alt_4":"A existência de raízes reais"}'),
(737, '{"alt_c":"O número de raízes reais","alt_2":"A concavidade da parábola","alt_3":"O vértice da parábola","alt_4":"A posição do eixo de simetria"}'),
(738, '{"alt_c":"O número de raízes reais","alt_2":"A quantidade de interseções com o eixo x","alt_3":"A existência de raízes reais","alt_4":"O valor máximo de f(x)"}'),
(739, '{"alt_c":"O número de raízes reais","alt_2":"O vértice da parábola","alt_3":"A concavidade da parábola","alt_4":"O deslocamento horizontal"}'),
(740, '{"alt_c":"O número de raízes reais","alt_2":"A posição do eixo de simetria","alt_3":"A existência de raízes reais","alt_4":"O valor máximo de f(x)"}');

-- ==========================================
-- PERGUNTA 5 (PRÁTICA)
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (15, 'Descubra as raízes da equação ( v1 ) x² + ( v2 ) x + ( v3 ) = 0.');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":1,"v2":-2,"v3":-3}'),
(@pergunta_id, '{"v1":1,"v2":4,"v3":-5}'),
(@pergunta_id, '{"v1":1,"v2":0,"v3":-9}'),
(@pergunta_id, '{"v1":2,"v2":-3,"v3":1}'),
(@pergunta_id, '{"v1":3,"v2":-6,"v3":0}'),
(@pergunta_id, '{"v1":1,"v2":-7,"v3":10}'),
(@pergunta_id, '{"v1":2,"v2":-5,"v3":-3}'),
(@pergunta_id, '{"v1":1,"v2":2,"v3":1}'),
(@pergunta_id, '{"v1":1,"v2":-8,"v3":12}'),
(@pergunta_id, '{"v1":2,"v2":0,"v3":-8}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(741, '{"alt_c":"x&#8321;=3, x&#8322;=-1","alt_2":"x&#8321;=-3, x&#8322;=1","alt_3":"x&#8321;=2, x&#8322;=-3","alt_4":"x&#8321;=-1, x&#8322;=-2"}'),
(742, '{"alt_c":"x&#8321;=1, x&#8322;=-5","alt_2":"x&#8321;=-1, x&#8322;=5","alt_3":"x&#8321;=2, x&#8322;=-4","alt_4":"x&#8321;=-5, x&#8322;=1"}'),
(743, '{"alt_c":"x&#8321;=3, x&#8322;=-3","alt_2":"x&#8321;=0, x&#8322;=9","alt_3":"x&#8321;=-9, x&#8322;=9","alt_4":"x&#8321;=-3, x&#8322;=0"}'),
(744, '{"alt_c":"x&#8321;=1, x&#8322;=0.5","alt_2":"x&#8321;=2, x&#8322;=-0.5","alt_3":"x&#8321;=-1, x&#8322;=1","alt_4":"x&#8321;=-0.5, x&#8322;=-1"}'),
(745, '{"alt_c":"x&#8321;=2, x&#8322;=0","alt_2":"x&#8321;=0, x&#8322;=-2","alt_3":"x&#8321;=-3, x&#8322;=1","alt_4":"x&#8321;=3, x&#8322;=-1"}'),
(746, '{"alt_c":"x&#8321;=5, x&#8322;=2","alt_2":"x&#8321;=-5, x&#8322;=-2","alt_3":"x&#8321;=10, x&#8322;=-1","alt_4":"x&#8321;=7, x&#8322;=-10"}'),
(747, '{"alt_c":"x&#8321;=3, x&#8322;=-0.5","alt_2":"x&#8321;=-3, x&#8322;=0.5","alt_3":"x&#8321;=2, x&#8322;=-1","alt_4":"x&#8321;=-2, x&#8322;=1"}'),
(748, '{"alt_c":"x&#8321;=-1","alt_2":"x&#8321;=1","alt_3":"x&#8321;=2","alt_4":"x&#8321;=0"}'),
(749, '{"alt_c":"x&#8321;=6, x&#8322;=2","alt_2":"x&#8321;=8, x&#8322;=-12","alt_3":"x&#8321;=4, x&#8322;=3","alt_4":"x&#8321;=-6, x&#8322;=-2"}'),
(750, '{"alt_c":"x&#8321;=2, x&#8322;=-2","alt_2":"x&#8321;=1, x&#8322;=-4","alt_3":"x&#8321;=0, x&#8322;=8","alt_4":"x&#8321;=-8, x&#8322;=0"}');

-- ==========================================
-- PERGUNTA 1
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (16, 'O sinal da função quadrática depende de qual elemento da equação?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"Do coeficiente a"}'),
(@pergunta_id, '{"v1":"Do coeficiente b"}'),
(@pergunta_id, '{"v1":"Do coeficiente c"}'),
(@pergunta_id, '{"v1":"Do discriminante Δ"}'),
(@pergunta_id, '{"v1":"Do vértice"}'),
(@pergunta_id, '{"v1":"Da concavidade da parábola"}'),
(@pergunta_id, '{"v1":"Do coeficiente a"}'),
(@pergunta_id, '{"v1":"Do coeficiente a e do Δ"}'),
(@pergunta_id, '{"v1":"Do eixo de simetria"}'),
(@pergunta_id, '{"v1":"Da soma das raízes"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(751, '{"alt_c":"Do coeficiente a","alt_2":"Do coeficiente b","alt_3":"Do coeficiente c","alt_4":"Do discriminante Δ"}'),
(752, '{"alt_c":"Do coeficiente a","alt_2":"Do vértice","alt_3":"Do eixo de simetria","alt_4":"Da concavidade da parábola"}'),
(753, '{"alt_c":"Do coeficiente a","alt_2":"Do coeficiente b","alt_3":"Da soma das raízes","alt_4":"Do discriminante Δ"}'),
(754, '{"alt_c":"Do coeficiente a","alt_2":"Da concavidade da parábola","alt_3":"Do coeficiente c","alt_4":"Do vértice"}'),
(755, '{"alt_c":"Do coeficiente a","alt_2":"Do coeficiente a e do Δ","alt_3":"Do discriminante Δ","alt_4":"Da soma das raízes"}'),
(756, '{"alt_c":"Do coeficiente a","alt_2":"Do coeficiente b","alt_3":"Do coeficiente c","alt_4":"Do eixo de simetria"}'),
(757, '{"alt_c":"Do coeficiente a","alt_2":"Do coeficiente a e do Δ","alt_3":"Da concavidade da parábola","alt_4":"Do vértice"}'),
(758, '{"alt_c":"Do coeficiente a","alt_2":"Do coeficiente b","alt_3":"Do coeficiente c","alt_4":"Do discriminante Δ"}'),
(759, '{"alt_c":"Do coeficiente a","alt_2":"Do coeficiente a e do Δ","alt_3":"Da concavidade da parábola","alt_4":"Do eixo de simetria"}'),
(760, '{"alt_c":"Do coeficiente a","alt_2":"Da soma das raízes","alt_3":"Do vértice","alt_4":"Do discriminante Δ"}');

-- ==========================================
-- PERGUNTA 2 (PRÁTICA)
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (16, 'Determine o sinal da função f(x) = ( v1 )x² + ( v2 )x + ( v3 ).');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":1,"v2":-3,"v3":2}'),
(@pergunta_id, '{"v1":-1,"v2":2,"v3":3}'),
(@pergunta_id, '{"v1":1,"v2":0,"v3":-4}'),
(@pergunta_id, '{"v1":-2,"v2":8,"v3":-6}'),
(@pergunta_id, '{"v1":1,"v2":2,"v3":1}'),
(@pergunta_id, '{"v1":-1,"v2":0,"v3":4}'),
(@pergunta_id, '{"v1":1,"v2":-6,"v3":9}'),
(@pergunta_id, '{"v1":-1,"v2":3,"v3":-2}'),
(@pergunta_id, '{"v1":2,"v2":-4,"v3":2}'),
(@pergunta_id, '{"v1":-2,"v2":6,"v3":-4}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(761, '{"alt_c":"f(x)>0 fora do intervalo entre as raízes","alt_2":"f(x)<0 fora do intervalo","alt_3":"f(x)>0 sempre","alt_4":"f(x)<0 sempre"}'),
(762, '{"alt_c":"f(x)<0 fora do intervalo entre as raízes","alt_2":"f(x)>0 fora do intervalo","alt_3":"f(x)<0 sempre","alt_4":"f(x)>0 sempre"}'),
(763, '{"alt_c":"f(x)>0 fora do intervalo entre as raízes","alt_2":"f(x)<0 fora do intervalo","alt_3":"f(x)>0 sempre","alt_4":"f(x)<0 sempre"}'),
(764, '{"alt_c":"f(x)<0 fora do intervalo entre as raízes","alt_2":"f(x)>0 dentro do intervalo","alt_3":"f(x)>0 sempre","alt_4":"f(x)<0 sempre"}'),
(765, '{"alt_c":"f(x)>0 sempre","alt_2":"f(x)<0 sempre","alt_3":"f(x)<0 fora do intervalo","alt_4":"f(x)>0 fora do intervalo"}'),
(766, '{"alt_c":"f(x)<0 sempre","alt_2":"f(x)>0 fora do intervalo","alt_3":"f(x)<0 fora do intervalo","alt_4":"f(x)>0 sempre"}'),
(767, '{"alt_c":"f(x)>0 sempre","alt_2":"f(x)<0 sempre","alt_3":"f(x)<0 fora do intervalo","alt_4":"f(x)>0 fora do intervalo"}'),
(768, '{"alt_c":"f(x)<0 fora do intervalo entre as raízes","alt_2":"f(x)>0 fora do intervalo","alt_3":"f(x)>0 sempre","alt_4":"f(x)<0 sempre"}'),
(769, '{"alt_c":"f(x)>0 sempre","alt_2":"f(x)<0 fora do intervalo","alt_3":"f(x)>0 fora do intervalo","alt_4":"f(x)<0 sempre"}'),
(770, '{"alt_c":"f(x)<0 fora do intervalo entre as raízes","alt_2":"f(x)>0 fora do intervalo","alt_3":"f(x)<0 sempre","alt_4":"f(x)>0 sempre"}');

-- ==========================================
-- PERGUNTA 3
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (16, 'Quando o coeficiente a é positivo, em quais intervalos a função quadrática é positiva?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"Fora do intervalo entre as raízes"}'),
(@pergunta_id, '{"v1":"Entre as raízes"}'),
(@pergunta_id, '{"v1":"Somente nas raízes"}'),
(@pergunta_id, '{"v1":"Nunca"}'),
(@pergunta_id, '{"v1":"Em todo o domínio"}'),
(@pergunta_id, '{"v1":"Fora das interseções com o eixo x"}'),
(@pergunta_id, '{"v1":"Apenas entre x&#8321; e x&#8322;"}'),
(@pergunta_id, '{"v1":"Sempre que f(x)>0"}'),
(@pergunta_id, '{"v1":"Quando Δ<0"}'),
(@pergunta_id, '{"v1":"Quando Δ>0"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(771, '{"alt_c":"Fora do intervalo entre as raízes","alt_2":"Entre as raízes","alt_3":"Somente nas raízes","alt_4":"Nunca"}'),
(772, '{"alt_c":"Fora do intervalo entre as raízes","alt_2":"Entre as raízes","alt_3":"Quando Δ>0","alt_4":"Em todo o domínio"}'),
(773, '{"alt_c":"Fora do intervalo entre as raízes","alt_2":"Fora das interseções com o eixo x","alt_3":"Quando Δ<0","alt_4":"Sempre que f(x)>0"}'),
(774, '{"alt_c":"Fora do intervalo entre as raízes","alt_2":"Entre as raízes","alt_3":"Somente nas raízes","alt_4":"Em todo o domínio"}'),
(775, '{"alt_c":"Fora do intervalo entre as raízes","alt_2":"Fora das interseções com o eixo x","alt_3":"Quando Δ<0","alt_4":"Quando Δ>0"}'),
(776, '{"alt_c":"Fora do intervalo entre as raízes","alt_2":"Entre as raízes","alt_3":"Em todo o domínio","alt_4":"Quando Δ>0"}'),
(777, '{"alt_c":"Fora do intervalo entre as raízes","alt_2":"Entre as raízes","alt_3":"Quando Δ<0","alt_4":"Somente nas raízes"}'),
(778, '{"alt_c":"Fora do intervalo entre as raízes","alt_2":"Entre as raízes","alt_3":"Quando Δ>0","alt_4":"Quando Δ<0"}'),
(779, '{"alt_c":"Fora do intervalo entre as raízes","alt_2":"Fora das interseções com o eixo x","alt_3":"Somente nas raízes","alt_4":"Em todo o domínio"}'),
(780, '{"alt_c":"Fora do intervalo entre as raízes","alt_2":"Entre as raízes","alt_3":"Quando Δ>0","alt_4":"Quando Δ<0"}');

-- ==========================================
-- PERGUNTA 4 (PRÁTICA)
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (16, 'Para a função f(x) = ( v1 )x² + ( v2 )x + ( v3 ), determine onde f(x) é positiva.');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":1,"v2":-3,"v3":2}'),
(@pergunta_id, '{"v1":1,"v2":0,"v3":-9}'),
(@pergunta_id, '{"v1":-1,"v2":2,"v3":3}'),
(@pergunta_id, '{"v1":2,"v2":-8,"v3":6}'),
(@pergunta_id, '{"v1":1,"v2":-6,"v3":9}'),
(@pergunta_id, '{"v1":-1,"v2":0,"v3":4}'),
(@pergunta_id, '{"v1":1,"v2":2,"v3":1}'),
(@pergunta_id, '{"v1":-1,"v2":4,"v3":-3}'),
(@pergunta_id, '{"v1":1,"v2":-2,"v3":-3}'),
(@pergunta_id, '{"v1":2,"v2":-4,"v3":2}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(781, '{"alt_c":"f(x)>0 para x<1 ou x>2","alt_2":"f(x)>0 entre 1 e 2","alt_3":"f(x)<0 sempre","alt_4":"f(x)>0 sempre"}'),
(782, '{"alt_c":"f(x)>0 para x<-3 ou x>3","alt_2":"f(x)>0 entre -3 e 3","alt_3":"f(x)>0 sempre","alt_4":"f(x)<0 sempre"}'),
(783, '{"alt_c":"f(x)<0 para todo x","alt_2":"f(x)>0 para todo x","alt_3":"f(x)>0 entre as raízes","alt_4":"f(x)<0 fora das raízes"}'),
(784, '{"alt_c":"f(x)<0 fora do intervalo","alt_2":"f(x)>0 fora do intervalo","alt_3":"f(x)>0 sempre","alt_4":"f(x)<0 sempre"}'),
(785, '{"alt_c":"f(x)>0 sempre","alt_2":"f(x)<0 sempre","alt_3":"f(x)>0 fora do intervalo","alt_4":"f(x)<0 fora do intervalo"}'),
(786, '{"alt_c":"f(x)<0 sempre","alt_2":"f(x)>0 sempre","alt_3":"f(x)>0 entre as raízes","alt_4":"f(x)<0 fora das raízes"}'),
(787, '{"alt_c":"f(x)>0 sempre","alt_2":"f(x)<0 sempre","alt_3":"f(x)>0 fora do intervalo","alt_4":"f(x)<0 fora do intervalo"}'),
(788, '{"alt_c":"f(x)<0 fora do intervalo","alt_2":"f(x)>0 fora do intervalo","alt_3":"f(x)>0 sempre","alt_4":"f(x)<0 sempre"}'),
(789, '{"alt_c":"f(x)>0 fora do intervalo","alt_2":"f(x)<0 fora do intervalo","alt_3":"f(x)<0 sempre","alt_4":"f(x)>0 sempre"}'),
(790, '{"alt_c":"f(x)>0 sempre","alt_2":"f(x)<0 sempre","alt_3":"f(x)>0 fora do intervalo","alt_4":"f(x)<0 fora do intervalo"}');

-- ==========================================
-- PERGUNTA 5
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (16, 'Como o sinal de f(x) se comporta de acordo com o valor de a e o discriminante Δ?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"a>0, Δ>0"}'),
(@pergunta_id, '{"v1":"a>0, Δ=0"}'),
(@pergunta_id, '{"v1":"a>0, Δ<0"}'),
(@pergunta_id, '{"v1":"a<0, Δ>0"}'),
(@pergunta_id, '{"v1":"a<0, Δ=0"}'),
(@pergunta_id, '{"v1":"a<0, Δ<0"}'),
(@pergunta_id, '{"v1":"a>0, Δ>0"}'),
(@pergunta_id, '{"v1":"a<0, Δ>0"}'),
(@pergunta_id, '{"v1":"a>0, Δ<0"}'),
(@pergunta_id, '{"v1":"a<0, Δ<0"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(791, '{"alt_c":"f(x)>0 fora do intervalo das raízes","alt_2":"f(x)<0 fora do intervalo","alt_3":"f(x)>0 entre as raízes","alt_4":"f(x)<0 sempre"}'),
(792, '{"alt_c":"f(x)>0 sempre, exceto na raiz dupla","alt_2":"f(x)<0 sempre","alt_3":"f(x)>0 entre as raízes","alt_4":"f(x)<0 fora do intervalo"}'),
(793, '{"alt_c":"f(x)>0 para todo x","alt_2":"f(x)<0 para todo x","alt_3":"f(x)>0 entre as raízes","alt_4":"f(x)<0 fora do intervalo"}'),
(794, '{"alt_c":"f(x)<0 fora do intervalo das raízes","alt_2":"f(x)>0 fora do intervalo","alt_3":"f(x)>0 sempre","alt_4":"f(x)<0 sempre"}'),
(795, '{"alt_c":"f(x)<0 sempre, exceto na raiz dupla","alt_2":"f(x)>0 sempre","alt_3":"f(x)>0 entre as raízes","alt_4":"f(x)<0 fora do intervalo"}'),
(796, '{"alt_c":"f(x)<0 para todo x","alt_2":"f(x)>0 para todo x","alt_3":"f(x)<0 fora do intervalo","alt_4":"f(x)>0 fora do intervalo"}'),
(797, '{"alt_c":"f(x)>0 fora do intervalo das raízes","alt_2":"f(x)<0 fora do intervalo","alt_3":"f(x)>0 sempre","alt_4":"f(x)<0 sempre"}'),
(798, '{"alt_c":"f(x)<0 fora do intervalo das raízes","alt_2":"f(x)>0 fora do intervalo","alt_3":"f(x)<0 sempre","alt_4":"f(x)>0 sempre"}'),
(799, '{"alt_c":"f(x)>0 sempre","alt_2":"f(x)<0 fora do intervalo","alt_3":"f(x)<0 sempre","alt_4":"f(x)>0 fora do intervalo"}'),
(800, '{"alt_c":"f(x)<0 sempre","alt_2":"f(x)>0 fora do intervalo","alt_3":"f(x)>0 sempre","alt_4":"f(x)<0 fora do intervalo"}');

-- ==========================================
-- PERGUNTA 1
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (17, 'O que é uma função exponencial?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"Função do tipo f(x) = a^x, com a > 0 e a ≠ 1"}'),
(@pergunta_id, '{"v1":"Função do tipo f(x) = x^a, com a > 0"}'),
(@pergunta_id, '{"v1":"Função do tipo f(x) = ax + b"}'),
(@pergunta_id, '{"v1":"Função do tipo f(x) = a/x"}'),
(@pergunta_id, '{"v1":"Função do tipo f(x) = log_a(x)"}'),
(@pergunta_id, '{"v1":"Função do tipo f(x) = sen(x)"}'),
(@pergunta_id, '{"v1":"Função do tipo f(x) = a^x, com a > 1"}'),
(@pergunta_id, '{"v1":"Função do tipo f(x) = a^x, com a < 0"}'),
(@pergunta_id, '{"v1":"Função do tipo f(x) = a^x, com a = 1"}'),
(@pergunta_id, '{"v1":"Função do tipo f(x) = a^x, com a > 0"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(801, '{"alt_c":"Função do tipo f(x) = a^x, com a > 0 e a ≠ 1","alt_2":"Função do tipo f(x) = x^a, com a > 0","alt_3":"Função do tipo f(x) = ax + b","alt_4":"Função do tipo f(x) = log_a(x)"}'),
(802, '{"alt_c":"Função do tipo f(x) = a^x, com a > 0 e a ≠ 1","alt_2":"Função do tipo f(x) = sen(x)","alt_3":"Função do tipo f(x) = a/x","alt_4":"Função do tipo f(x) = ax + b"}'),
(803, '{"alt_c":"Função do tipo f(x) = a^x, com a > 0 e a ≠ 1","alt_2":"Função do tipo f(x) = a^x, com a = 1","alt_3":"Função do tipo f(x) = log_a(x)","alt_4":"Função do tipo f(x) = sen(x)"}'),
(804, '{"alt_c":"Função do tipo f(x) = a^x, com a > 0 e a ≠ 1","alt_2":"Função do tipo f(x) = x^a","alt_3":"Função do tipo f(x) = a/x","alt_4":"Função do tipo f(x) = ax + b"}'),
(805, '{"alt_c":"Função do tipo f(x) = a^x, com a > 0 e a ≠ 1","alt_2":"Função do tipo f(x) = log_a(x)","alt_3":"Função do tipo f(x) = a/x","alt_4":"Função do tipo f(x) = sen(x)"}'),
(806, '{"alt_c":"Função do tipo f(x) = a^x, com a > 0 e a ≠ 1","alt_2":"Função do tipo f(x) = sen(x)","alt_3":"Função do tipo f(x) = ax + b","alt_4":"Função do tipo f(x) = a/x"}'),
(807, '{"alt_c":"Função do tipo f(x) = a^x, com a > 0 e a ≠ 1","alt_2":"Função do tipo f(x) = a^x, com a > 1","alt_3":"Função do tipo f(x) = a^x, com a = 1","alt_4":"Função do tipo f(x) = a/x"}'),
(808, '{"alt_c":"Função do tipo f(x) = a^x, com a > 0 e a ≠ 1","alt_2":"Função do tipo f(x) = a^x, com a < 0","alt_3":"Função do tipo f(x) = sen(x)","alt_4":"Função do tipo f(x) = ax + b"}'),
(809, '{"alt_c":"Função do tipo f(x) = a^x, com a > 0 e a ≠ 1","alt_2":"Função do tipo f(x) = a^x, com a = 1","alt_3":"Função do tipo f(x) = a/x","alt_4":"Função do tipo f(x) = log_a(x)"}'),
(810, '{"alt_c":"Função do tipo f(x) = a^x, com a > 0 e a ≠ 1","alt_2":"Função do tipo f(x) = log_a(x)","alt_3":"Função do tipo f(x) = a/x","alt_4":"Função do tipo f(x) = ax + b"}');

-- ==========================================
-- PERGUNTA 2
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (17, 'Qual é o domínio de uma função exponencial f(x) = a^x?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"R"}'),
(@pergunta_id, '{"v1":"R*"}'),
(@pergunta_id, '{"v1":"R+, exceto 0"}'),
(@pergunta_id, '{"v1":"x > 0"}'),
(@pergunta_id, '{"v1":"x < 0"}'),
(@pergunta_id, '{"v1":"x ≥ 0"}'),
(@pergunta_id, '{"v1":"x ≠ 0"}'),
(@pergunta_id, '{"v1":"Todos os números reais"}'),
(@pergunta_id, '{"v1":"Apenas inteiros positivos"}'),
(@pergunta_id, '{"v1":"Números naturais"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(811, '{"alt_c":"R","alt_2":"x > 0","alt_3":"x < 0","alt_4":"x ≠ 0"}'),
(812, '{"alt_c":"R","alt_2":"R+","alt_3":"R-","alt_4":"x ≥ 0"}'),
(813, '{"alt_c":"R","alt_2":"Números naturais","alt_3":"Apenas inteiros positivos","alt_4":"x > 0"}'),
(814, '{"alt_c":"R","alt_2":"R*","alt_3":"x ≥ 0","alt_4":"x < 0"}'),
(815, '{"alt_c":"R","alt_2":"x > 0","alt_3":"x < 0","alt_4":"x ≠ 0"}'),
(816, '{"alt_c":"R","alt_2":"x ≥ 0","alt_3":"x > 0","alt_4":"Números naturais"}'),
(817, '{"alt_c":"R","alt_2":"R+","alt_3":"x ≥ 0","alt_4":"x > 0"}'),
(818, '{"alt_c":"R","alt_2":"x ≠ 0","alt_3":"R*","alt_4":"x > 0"}'),
(819, '{"alt_c":"R","alt_2":"R*","alt_3":"x ≥ 0","alt_4":"Números naturais"}'),
(820, '{"alt_c":"R","alt_2":"x > 0","alt_3":"x ≥ 0","alt_4":"x < 0"}');

-- ==========================================
-- PERGUNTA 3
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (17, 'A função exponencial é crescente quando:');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"a > 1"}'),
(@pergunta_id, '{"v1":"a < 1"}'),
(@pergunta_id, '{"v1":"a = 1"}'),
(@pergunta_id, '{"v1":"a ≤ 0"}'),
(@pergunta_id, '{"v1":"a > 0 e a ≠ 1"}'),
(@pergunta_id, '{"v1":"a = 2"}'),
(@pergunta_id, '{"v1":"a = 10"}'),
(@pergunta_id, '{"v1":"a = 1/2"}'),
(@pergunta_id, '{"v1":"a < 0"}'),
(@pergunta_id, '{"v1":"a > 1 e x > 0"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(821, '{"alt_c":"a > 1","alt_2":"a < 1","alt_3":"a = 1","alt_4":"a ≤ 0"}'),
(822, '{"alt_c":"a > 1","alt_2":"a < 1","alt_3":"a = 1","alt_4":"a = 0"}'),
(823, '{"alt_c":"a > 1","alt_2":"a < 1","alt_3":"a = 1","alt_4":"a = 2"}'),
(824, '{"alt_c":"a > 1","alt_2":"a = 1","alt_3":"a < 1","alt_4":"a > 0"}'),
(825, '{"alt_c":"a > 1","alt_2":"a < 1","alt_3":"a > 0","alt_4":"a = 1"}'),
(826, '{"alt_c":"a > 1","alt_2":"a = 1","alt_3":"a < 1","alt_4":"a ≤ 0"}'),
(827, '{"alt_c":"a > 1","alt_2":"a < 1","alt_3":"a = 1","alt_4":"a = 10"}'),
(828, '{"alt_c":"a > 1","alt_2":"a < 1","alt_3":"a = 1","alt_4":"a = 1/2"}'),
(829, '{"alt_c":"a > 1","alt_2":"a < 1","alt_3":"a = 1","alt_4":"a < 0"}'),
(830, '{"alt_c":"a > 1","alt_2":"a < 1","alt_3":"a = 1","alt_4":"a = 0"}');

-- ==========================================
-- PERGUNTA 4 (PRÁTICA)
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (17, 'Dada a função f(x) = ( v1 )^(x + v2), determine se ela é crescente ou decrescente.');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":2,"v2":1}'),
(@pergunta_id, '{"v1":0.5,"v2":3}'),
(@pergunta_id, '{"v1":5,"v2":-2}'),
(@pergunta_id, '{"v1":"1/3","v2":0}'),
(@pergunta_id, '{"v1":4,"v2":-1}'),
(@pergunta_id, '{"v1":0.25,"v2":2}'),
(@pergunta_id, '{"v1":10,"v2":1}'),
(@pergunta_id, '{"v1":0.2,"v2":4}'),
(@pergunta_id, '{"v1":3,"v2":0}'),
(@pergunta_id, '{"v1":0.8,"v2":-1}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(831, '{"alt_c":"Crescente","alt_2":"Decrescente","alt_3":"Constante","alt_4":"Indefinida"}'),
(832, '{"alt_c":"Decrescente","alt_2":"Crescente","alt_3":"Constante","alt_4":"Indefinida"}'),
(833, '{"alt_c":"Crescente","alt_2":"Decrescente","alt_3":"Constante","alt_4":"Indefinida"}'),
(834, '{"alt_c":"Decrescente","alt_2":"Crescente","alt_3":"Constante","alt_4":"Indefinida"}'),
(835, '{"alt_c":"Crescente","alt_2":"Decrescente","alt_3":"Constante","alt_4":"Indefinida"}'),
(836, '{"alt_c":"Decrescente","alt_2":"Crescente","alt_3":"Constante","alt_4":"Indefinida"}'),
(837, '{"alt_c":"Crescente","alt_2":"Decrescente","alt_3":"Constante","alt_4":"Indefinida"}'),
(838, '{"alt_c":"Decrescente","alt_2":"Crescente","alt_3":"Constante","alt_4":"Indefinida"}'),
(839, '{"alt_c":"Crescente","alt_2":"Decrescente","alt_3":"Constante","alt_4":"Indefinida"}'),
(840, '{"alt_c":"Decrescente","alt_2":"Crescente","alt_3":"Constante","alt_4":"Indefinida"}');

-- ==========================================
-- PERGUNTA 5
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (17, 'Qual é a imagem (conjunto de valores possíveis) de uma função exponencial f(x) = a^x?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"R+"}'),
(@pergunta_id, '{"v1":"R"}'),
(@pergunta_id, '{"v1":"R-, exceto 0"}'),
(@pergunta_id, '{"v1":"x > 0"}'),
(@pergunta_id, '{"v1":"y > 0"}'),
(@pergunta_id, '{"v1":"y ≥ 0"}'),
(@pergunta_id, '{"v1":"x ≥ 0"}'),
(@pergunta_id, '{"v1":"Todos os números reais"}'),
(@pergunta_id, '{"v1":"R*, exceto 1"}'),
(@pergunta_id, '{"v1":"y < 0"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(841, '{"alt_c":"R+, ou seja, (0, +∞)","alt_2":"R","alt_3":"y ≥ 0","alt_4":"R-, exceto 0"}'),
(842, '{"alt_c":"R+, ou seja, (0, +∞)","alt_2":"R*","alt_3":"y > 0","alt_4":"y < 0"}'),
(843, '{"alt_c":"R+, ou seja, (0, +∞)","alt_2":"R","alt_3":"y ≥ 0","alt_4":"R-, exceto 0"}'),
(844, '{"alt_c":"R+, ou seja, (0, +∞)","alt_2":"y > 0","alt_3":"y < 0","alt_4":"y ≥ 0"}'),
(845, '{"alt_c":"R+, ou seja, (0, +∞)","alt_2":"R*","alt_3":"R","alt_4":"y > 0"}'),
(846, '{"alt_c":"R+, ou seja, (0, +∞)","alt_2":"R","alt_3":"y ≥ 0","alt_4":"R-, exceto 0"}'),
(847, '{"alt_c":"R+, ou seja, (0, +∞)","alt_2":"y ≥ 0","alt_3":"R","alt_4":"R*"}'),
(848, '{"alt_c":"R+, ou seja, (0, +∞)","alt_2":"y > 0","alt_3":"y ≥ 0","alt_4":"y < 0"}'),
(849, '{"alt_c":"R+, ou seja, (0, +∞)","alt_2":"R","alt_3":"R*, exceto 1","alt_4":"R-, exceto 0"}'),
(850, '{"alt_c":"R+, ou seja, (0, +∞)","alt_2":"y ≥ 0","alt_3":"R","alt_4":"y > 0"}');

-- ==========================================
-- PERGUNTA 1
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (18, 'Qual das propriedades abaixo é verdadeira para funções exponenciais?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"a^m · a^n = a^(m + n)"}'),
(@pergunta_id, '{"v1":"a^m · a^n = a^(m - n)"}'),
(@pergunta_id, '{"v1":"a^m ÷ a^n = a^(m + n)"}'),
(@pergunta_id, '{"v1":"(a · b)^n = a^n ÷ b^n"}'),
(@pergunta_id, '{"v1":"(a / b)^n = a^n / b^n"}'),
(@pergunta_id, '{"v1":"(a^m)^n = a^(m · n)"}'),
(@pergunta_id, '{"v1":"a^0 = 1"}'),
(@pergunta_id, '{"v1":"a^1 = 0"}'),
(@pergunta_id, '{"v1":"(a · b)^n = a^n + b^n"}'),
(@pergunta_id, '{"v1":"a^(-n) = 1 / a^n"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(851, '{"alt_c":"a^m · a^n = a^(m + n)","alt_2":"a^m ÷ a^n = a^(m + n)","alt_3":"(a · b)^n = a^n ÷ b^n","alt_4":"a^1 = 0"}'),
(852, '{"alt_c":"a^m · a^n = a^(m + n)","alt_2":"a^m · a^n = a^(m - n)","alt_3":"a^0 = 0","alt_4":"a^1 = 1"}'),
(853, '{"alt_c":"a^m · a^n = a^(m + n)","alt_2":"a^m ÷ a^n = a^(m + n)","alt_3":"a^(-n) = 1 / a^n","alt_4":"a^m ÷ a^n = a^(m - n)"}'),
(854, '{"alt_c":"a^m · a^n = a^(m + n)","alt_2":"a^m ÷ a^n = a^(m - n)","alt_3":"a^1 = 0","alt_4":"(a · b)^n = a^n ÷ b^n"}'),
(855, '{"alt_c":"a^m · a^n = a^(m + n)","alt_2":"a^1 = 0","alt_3":"(a · b)^n = a^n ÷ b^n","alt_4":"(a / b)^n = a^n / b^n"}'),
(856, '{"alt_c":"a^m · a^n = a^(m + n)","alt_2":"(a^m)^n = a^(m · n)","alt_3":"a^(-n) = 1 / a^n","alt_4":"(a · b)^n = a^n ÷ b^n"}'),
(857, '{"alt_c":"a^m · a^n = a^(m + n)","alt_2":"a^0 = 1","alt_3":"a^(-n) = 1 / a^n","alt_4":"a^1 = 0"}'),
(858, '{"alt_c":"a^m · a^n = a^(m + n)","alt_2":"a^m ÷ a^n = a^(m - n)","alt_3":"(a / b)^n = a^n / b^n","alt_4":"a^1 = 0"}'),
(859, '{"alt_c":"a^m · a^n = a^(m + n)","alt_2":"(a^m)^n = a^(m · n)","alt_3":"a^0 = 1","alt_4":"a^1 = 0"}'),
(860, '{"alt_c":"a^m · a^n = a^(m + n)","alt_2":"a^(-n) = 1 / a^n","alt_3":"(a · b)^n = a^n + b^n","alt_4":"a^1 = 0"}');

-- ==========================================
-- PERGUNTA 2
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (18, 'Qual o valor de a^0, para a ≠ 0?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"a=2"}'),
(@pergunta_id, '{"v1":"a=5"}'),
(@pergunta_id, '{"v1":"a=10"}'),
(@pergunta_id, '{"v1":"a=1/2"}'),
(@pergunta_id, '{"v1":"a=-3"}'),
(@pergunta_id, '{"v1":"a=4"}'),
(@pergunta_id, '{"v1":"a=8"}'),
(@pergunta_id, '{"v1":"a=1/3"}'),
(@pergunta_id, '{"v1":"a=-5"}'),
(@pergunta_id, '{"v1":"a=7"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(861, '{"alt_c":"1","alt_2":"0","alt_3":"a","alt_4":"Indefinido"}'),
(862, '{"alt_c":"1","alt_2":"0","alt_3":"a","alt_4":"Indefinido"}'),
(863, '{"alt_c":"1","alt_2":"0","alt_3":"a","alt_4":"Indefinido"}'),
(864, '{"alt_c":"1","alt_2":"0","alt_3":"a","alt_4":"Indefinido"}'),
(865, '{"alt_c":"1","alt_2":"0","alt_3":"a","alt_4":"Indefinido"}'),
(866, '{"alt_c":"1","alt_2":"0","alt_3":"a","alt_4":"Indefinido"}'),
(867, '{"alt_c":"1","alt_2":"0","alt_3":"a","alt_4":"Indefinido"}'),
(868, '{"alt_c":"1","alt_2":"0","alt_3":"a","alt_4":"Indefinido"}'),
(869, '{"alt_c":"1","alt_2":"0","alt_3":"a","alt_4":"Indefinido"}'),
(870, '{"alt_c":"1","alt_2":"0","alt_3":"a","alt_4":"Indefinido"}');

-- ==========================================
-- PERGUNTA 3 (PRÁTICA)
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (18, 'Calcule o valor de ( v1 )^( v2 ) × ( v1 )^( v3 ).');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":2,"v2":3,"v3":4}'),
(@pergunta_id, '{"v1":3,"v2":2,"v3":5}'),
(@pergunta_id, '{"v1":4,"v2":1,"v3":3}'),
(@pergunta_id, '{"v1":5,"v2":2,"v3":2}'),
(@pergunta_id, '{"v1":10,"v2":1,"v3":2}'),
(@pergunta_id, '{"v1":2,"v2":4,"v3":3}'),
(@pergunta_id, '{"v1":3,"v2":1,"v3":4}'),
(@pergunta_id, '{"v1":6,"v2":2,"v3":1}'),
(@pergunta_id, '{"v1":2,"v2":5,"v3":2}'),
(@pergunta_id, '{"v1":4,"v2":2,"v3":3}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(871, '{"alt_c":"2^7","alt_2":"2^12","alt_3":"2^6","alt_4":"2^5"}'),
(872, '{"alt_c":"3^7","alt_2":"3^10","alt_3":"3^6","alt_4":"3^5"}'),
(873, '{"alt_c":"4^4","alt_2":"4^3","alt_3":"4^5","alt_4":"4^6"}'),
(874, '{"alt_c":"5^4","alt_2":"5^5","alt_3":"5^6","alt_4":"5^3"}'),
(875, '{"alt_c":"10^3","alt_2":"10^2","alt_3":"10^1","alt_4":"10^4"}'),
(876, '{"alt_c":"2^7","alt_2":"2^6","alt_3":"2^8","alt_4":"2^5"}'),
(877, '{"alt_c":"3^5","alt_2":"3^4","alt_3":"3^6","alt_4":"3^3"}'),
(878, '{"alt_c":"6^3","alt_2":"6^4","alt_3":"6^5","alt_4":"6^2"}'),
(879, '{"alt_c":"2^7","alt_2":"2^6","alt_3":"2^5","alt_4":"2^8"}'),
(880, '{"alt_c":"4^5","alt_2":"4^6","alt_3":"4^7","alt_4":"4^4"}');

-- ==========================================
-- PERGUNTA 4
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (18, 'Qual é a propriedade correta para a divisão de potências de mesma base?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"a^m ÷ a^n"}'),
(@pergunta_id, '{"v1":"a^n ÷ a^m"}'),
(@pergunta_id, '{"v1":"a^m ÷ b^n"}'),
(@pergunta_id, '{"v1":"b^m ÷ a^n"}'),
(@pergunta_id, '{"v1":"a^m ÷ a^n, com a ≠ 0"}'),
(@pergunta_id, '{"v1":"a^m ÷ a^n = a^(m - n)"}'),
(@pergunta_id, '{"v1":"a^m ÷ a^n = a^(m + n)"}'),
(@pergunta_id, '{"v1":"a^m ÷ a^n = a^(n - m)"}'),
(@pergunta_id, '{"v1":"a^m ÷ a^n = a^(m / n)"}'),
(@pergunta_id, '{"v1":"a^m ÷ a^n = a^(m - n)"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(881, '{"alt_c":"a^m ÷ a^n = a^(m - n)","alt_2":"a^m ÷ a^n = a^(m + n)","alt_3":"a^m ÷ a^n = a^(n - m)","alt_4":"a^m ÷ a^n = a^(m / n)"}'),
(882, '{"alt_c":"a^m ÷ a^n = a^(m - n)","alt_2":"a^m ÷ a^n = a^(m + n)","alt_3":"a^m ÷ a^n = a^(n - m)","alt_4":"a^m ÷ a^n = a^(m / n)"}'),
(883, '{"alt_c":"a^m ÷ a^n = a^(m - n)","alt_2":"a^m ÷ a^n = a^(m + n)","alt_3":"a^m ÷ a^n = a^(n - m)","alt_4":"a^m ÷ a^n = a^(m / n)"}'),
(884, '{"alt_c":"a^m ÷ a^n = a^(m - n)","alt_2":"a^m ÷ a^n = a^(m + n)","alt_3":"a^m ÷ a^n = a^(n - m)","alt_4":"a^m ÷ a^n = a^(m / n)"}'),
(885, '{"alt_c":"a^m ÷ a^n = a^(m - n)","alt_2":"a^m ÷ a^n = a^(m + n)","alt_3":"a^m ÷ a^n = a^(n - m)","alt_4":"a^m ÷ a^n = a^(m / n)"}'),
(886, '{"alt_c":"a^m ÷ a^n = a^(m - n)","alt_2":"a^m ÷ a^n = a^(m + n)","alt_3":"a^m ÷ a^n = a^(n - m)","alt_4":"a^m ÷ a^n = a^(m / n)"}'),
(887, '{"alt_c":"a^m ÷ a^n = a^(m - n)","alt_2":"a^m ÷ a^n = a^(m + n)","alt_3":"a^m ÷ a^n = a^(n - m)","alt_4":"a^m ÷ a^n = a^(m / n)"}'),
(888, '{"alt_c":"a^m ÷ a^n = a^(m - n)","alt_2":"a^m ÷ a^n = a^(m + n)","alt_3":"a^m ÷ a^n = a^(n - m)","alt_4":"a^m ÷ a^n = a^(m / n)"}'),
(889, '{"alt_c":"a^m ÷ a^n = a^(m - n)","alt_2":"a^m ÷ a^n = a^(m + n)","alt_3":"a^m ÷ a^n = a^(n - m)","alt_4":"a^m ÷ a^n = a^(m / n)"}'),
(890, '{"alt_c":"a^m ÷ a^n = a^(m - n)","alt_2":"a^m ÷ a^n = a^(m + n)","alt_3":"a^m ÷ a^n = a^(n - m)","alt_4":"a^m ÷ a^n = a^(m / n)"}');

-- ==========================================
-- PERGUNTA 5
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (18, 'A expressão ( a^m )^n é igual a:');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"a^m"}'),
(@pergunta_id, '{"v1":"a^(m·n)"}'),
(@pergunta_id, '{"v1":"a^(m+n)"}'),
(@pergunta_id, '{"v1":"a^(m/n)"}'),
(@pergunta_id, '{"v1":"(a^n)^m"}'),
(@pergunta_id, '{"v1":"a^(n·m)"}'),
(@pergunta_id, '{"v1":"a^(m+n)"}'),
(@pergunta_id, '{"v1":"a^(n+m)"}'),
(@pergunta_id, '{"v1":"a^(m·n)"}'),
(@pergunta_id, '{"v1":"a^(n·m)"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(891, '{"alt_c":"a^(m·n)","alt_2":"a^(m+n)","alt_3":"a^(m/n)","alt_4":"a^(n/m)"}'),
(892, '{"alt_c":"a^(m·n)","alt_2":"a^(m+n)","alt_3":"a^(m/n)","alt_4":"a^(n/m)"}'),
(893, '{"alt_c":"a^(m·n)","alt_2":"a^(m+n)","alt_3":"a^(m/n)","alt_4":"a^(n/m)"}'),
(894, '{"alt_c":"a^(m·n)","alt_2":"a^(m+n)","alt_3":"a^(m/n)","alt_4":"a^(n/m)"}'),
(895, '{"alt_c":"a^(m·n)","alt_2":"a^(m+n)","alt_3":"a^(m/n)","alt_4":"a^(n/m)"}'),
(896, '{"alt_c":"a^(m·n)","alt_2":"a^(m+n)","alt_3":"a^(m/n)","alt_4":"a^(n/m)"}'),
(897, '{"alt_c":"a^(m·n)","alt_2":"a^(m+n)","alt_3":"a^(m/n)","alt_4":"a^(n/m)"}'),
(898, '{"alt_c":"a^(m·n)","alt_2":"a^(m+n)","alt_3":"a^(m/n)","alt_4":"a^(n/m)"}'),
(899, '{"alt_c":"a^(m·n)","alt_2":"a^(m+n)","alt_3":"a^(m/n)","alt_4":"a^(n/m)"}'),
(900, '{"alt_c":"a^(m·n)","alt_2":"a^(m+n)","alt_3":"a^(m/n)","alt_4":"a^(n/m)"}');

-- ==========================================
-- PERGUNTA 1
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (19, 'Qual das Alternativas descreve corretamente o gráfico de uma função exponencial crescente?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"a > 1"}'),
(@pergunta_id, '{"v1":"a < 1"}'),
(@pergunta_id, '{"v1":"a = 1"}'),
(@pergunta_id, '{"v1":"a = 0"}'),
(@pergunta_id, '{"v1":"a = 2"}'),
(@pergunta_id, '{"v1":"a = 3"}'),
(@pergunta_id, '{"v1":"a = 10"}'),
(@pergunta_id, '{"v1":"a = 1/2"}'),
(@pergunta_id, '{"v1":"a = 1/3"}'),
(@pergunta_id, '{"v1":"a = 4"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(901, '{"alt_c":"Gráfico crescente, passando pelo ponto (0,1)","alt_2":"Gráfico decrescente, passando por (1,0)","alt_3":"Gráfico constante","alt_4":"Gráfico simétrico ao eixo y"}'),
(902, '{"alt_c":"Gráfico crescente, passando pelo ponto (0,1)","alt_2":"Gráfico decrescente","alt_3":"Gráfico constante","alt_4":"Gráfico que cruza o eixo y em (1,0)"}'),
(903, '{"alt_c":"Gráfico crescente, passando pelo ponto (0,1)","alt_2":"Gráfico decrescente","alt_3":"Gráfico simétrico","alt_4":"Gráfico horizontal"}'),
(904, '{"alt_c":"Gráfico crescente, passando pelo ponto (0,1)","alt_2":"Gráfico decrescente","alt_3":"Gráfico constante","alt_4":"Gráfico sem intercepto com o eixo y"}'),
(905, '{"alt_c":"Gráfico crescente, passando pelo ponto (0,1)","alt_2":"Gráfico decrescente","alt_3":"Gráfico constante","alt_4":"Gráfico simétrico"}'),
(906, '{"alt_c":"Gráfico crescente, passando pelo ponto (0,1)","alt_2":"Gráfico decrescente","alt_3":"Gráfico constante","alt_4":"Gráfico horizontal"}'),
(907, '{"alt_c":"Gráfico crescente, passando pelo ponto (0,1)","alt_2":"Gráfico decrescente","alt_3":"Gráfico constante","alt_4":"Gráfico simétrico"}'),
(908, '{"alt_c":"Gráfico crescente, passando pelo ponto (0,1)","alt_2":"Gráfico decrescente","alt_3":"Gráfico constante","alt_4":"Gráfico horizontal"}'),
(909, '{"alt_c":"Gráfico crescente, passando pelo ponto (0,1)","alt_2":"Gráfico decrescente","alt_3":"Gráfico constante","alt_4":"Gráfico simétrico"}'),
(910, '{"alt_c":"Gráfico crescente, passando pelo ponto (0,1)","alt_2":"Gráfico decrescente","alt_3":"Gráfico constante","alt_4":"Gráfico horizontal"}');

-- ==========================================
-- PERGUNTA 2
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (19, 'Qual o ponto fixo comum a todos os gráficos de funções exponenciais f(x) = a^x?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"(0,1)"}'),
(@pergunta_id, '{"v1":"(1,0)"}'),
(@pergunta_id, '{"v1":"(1,1)"}'),
(@pergunta_id, '{"v1":"(0,0)"}'),
(@pergunta_id, '{"v1":"(-1,1)"}'),
(@pergunta_id, '{"v1":"(2,1)"}'),
(@pergunta_id, '{"v1":"(-1,0)"}'),
(@pergunta_id, '{"v1":"(0,-1)"}'),
(@pergunta_id, '{"v1":"(0,2)"}'),
(@pergunta_id, '{"v1":"(1,2)"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(911, '{"alt_c":"(0,1)","alt_2":"(1,0)","alt_3":"(1,1)","alt_4":"(0,0)"}'),
(912, '{"alt_c":"(0,1)","alt_2":"(1,0)","alt_3":"(1,2)","alt_4":"(0,0)"}'),
(913, '{"alt_c":"(0,1)","alt_2":"(0,2)","alt_3":"(0,-1)","alt_4":"(-1,1)"}'),
(914, '{"alt_c":"(0,1)","alt_2":"(1,1)","alt_3":"(2,1)","alt_4":"(-1,1)"}'),
(915, '{"alt_c":"(0,1)","alt_2":"(1,0)","alt_3":"(1,1)","alt_4":"(0,0)"}'),
(916, '{"alt_c":"(0,1)","alt_2":"(1,2)","alt_3":"(-1,1)","alt_4":"(0,-1)"}'),
(917, '{"alt_c":"(0,1)","alt_2":"(0,0)","alt_3":"(1,1)","alt_4":"(2,1)"}'),
(918, '{"alt_c":"(0,1)","alt_2":"(1,2)","alt_3":"(0,0)","alt_4":"(1,1)"}'),
(919, '{"alt_c":"(0,1)","alt_2":"(-1,1)","alt_3":"(1,0)","alt_4":"(2,1)"}'),
(920, '{"alt_c":"(0,1)","alt_2":"(1,1)","alt_3":"(0,0)","alt_4":"(1,2)"}');
select * from Variaveis where id = 920;

-- ==========================================
-- PERGUNTA 3 (PRÁTICA)
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (19, 'Considere a função f(x) = ( v1 )^(x). Ela é crescente ou decrescente?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":2}'),
(@pergunta_id, '{"v1":3}'),
(@pergunta_id, '{"v1":4}'),
(@pergunta_id, '{"v1":0.5}'),
(@pergunta_id, '{"v1":0.25}'),
(@pergunta_id, '{"v1":10}'),
(@pergunta_id, '{"v1":"1/3"}'),
(@pergunta_id, '{"v1":5}'),
(@pergunta_id, '{"v1":"1/4"}'),
(@pergunta_id, '{"v1":7}');
select * from Alternativas;
INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(921, '{"alt_c":"Crescente","alt_2":"Decrescente","alt_3":"Constante","alt_4":"Indefinida"}'),
(922, '{"alt_c":"Crescente","alt_2":"Decrescente","alt_3":"Constante","alt_4":"Indefinida"}'),
(923, '{"alt_c":"Crescente","alt_2":"Decrescente","alt_3":"Constante","alt_4":"Indefinida"}'),
(924, '{"alt_c":"Decrescente","alt_2":"Crescente","alt_3":"Constante","alt_4":"Indefinida"}'),
(925, '{"alt_c":"Decrescente","alt_2":"Crescente","alt_3":"Constante","alt_4":"Indefinida"}'),
(926, '{"alt_c":"Crescente","alt_2":"Decrescente","alt_3":"Constante","alt_4":"Indefinida"}'),
(927, '{"alt_c":"Decrescente","alt_2":"Crescente","alt_3":"Constante","alt_4":"Indefinida"}'),
(928, '{"alt_c":"Crescente","alt_2":"Decrescente","alt_3":"Constante","alt_4":"Indefinida"}'),
(929, '{"alt_c":"Decrescente","alt_2":"Crescente","alt_3":"Constante","alt_4":"Indefinida"}'),
(930, '{"alt_c":"Crescente","alt_2":"Decrescente","alt_3":"Constante","alt_4":"Indefinida"}');

-- ==========================================
-- PERGUNTA 4
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (19, 'Qual é a assíntota horizontal da função exponencial f(x) = a^x?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"y = 0"}'),
(@pergunta_id, '{"v1":"x = 0"}'),
(@pergunta_id, '{"v1":"y = 1"}'),
(@pergunta_id, '{"v1":"x = 1"}'),
(@pergunta_id, '{"v1":"y = -1"}'),
(@pergunta_id, '{"v1":"x = -1"}'),
(@pergunta_id, '{"v1":"y = 2"}'),
(@pergunta_id, '{"v1":"x = 2"}'),
(@pergunta_id, '{"v1":"y = 3"}'),
(@pergunta_id, '{"v1":"x = 3"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(931, '{"alt_c":"y = 0","alt_2":"x = 0","alt_3":"y = 1","alt_4":"x = 1"}'),
(932, '{"alt_c":"y = 0","alt_2":"y = 1","alt_3":"x = 1","alt_4":"y = -1"}'),
(933, '{"alt_c":"y = 0","alt_2":"y = -1","alt_3":"x = 0","alt_4":"x = 1"}'),
(934, '{"alt_c":"y = 0","alt_2":"x = -1","alt_3":"y = 1","alt_4":"x = 1"}'),
(935, '{"alt_c":"y = 0","alt_2":"x = 0","alt_3":"y = 1","alt_4":"x = -1"}'),
(936, '{"alt_c":"y = 0","alt_2":"y = -1","alt_3":"x = 1","alt_4":"x = 0"}'),
(937, '{"alt_c":"y = 0","alt_2":"x = 0","alt_3":"x = 1","alt_4":"y = 1"}'),
(938, '{"alt_c":"y = 0","alt_2":"y = 1","alt_3":"x = 1","alt_4":"x = 2"}'),
(939, '{"alt_c":"y = 0","alt_2":"y = 3","alt_3":"x = 0","alt_4":"x = 1"}'),
(940, '{"alt_c":"y = 0","alt_2":"x = 3","alt_3":"y = 1","alt_4":"x = 0"}');

-- ==========================================
-- PERGUNTA 5
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (19, 'O que acontece com o gráfico da função exponencial f(x) = a^x quando adicionamos uma constante k (f(x) = a^x + k)?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"k > 0"}'),
(@pergunta_id, '{"v1":"k < 0"}'),
(@pergunta_id, '{"v1":"k = 0"}'),
(@pergunta_id, '{"v1":"k = 2"}'),
(@pergunta_id, '{"v1":"k = -3"}'),
(@pergunta_id, '{"v1":"k = 5"}'),
(@pergunta_id, '{"v1":"k = -1"}'),
(@pergunta_id, '{"v1":"k = 10"}'),
(@pergunta_id, '{"v1":"k = -2"}'),
(@pergunta_id, '{"v1":"k = 1"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(941, '{"alt_c":"O gráfico é deslocado verticalmente para cima","alt_2":"O gráfico é deslocado para a direita","alt_3":"O gráfico é deslocado para a esquerda","alt_4":"O gráfico é refletido"}'),
(942, '{"alt_c":"O gráfico é deslocado verticalmente para baixo","alt_2":"O gráfico é deslocado para cima","alt_3":"O gráfico é deslocado para a direita","alt_4":"O gráfico é refletido"}'),
(943, '{"alt_c":"O gráfico permanece no mesmo lugar","alt_2":"O gráfico é deslocado para cima","alt_3":"O gráfico é deslocado para baixo","alt_4":"O gráfico é refletido"}'),
(944, '{"alt_c":"O gráfico é deslocado 2 unidades para cima","alt_2":"O gráfico é deslocado 2 unidades para a direita","alt_3":"O gráfico é deslocado 2 unidades para baixo","alt_4":"O gráfico é refletido"}'),
(945, '{"alt_c":"O gráfico é deslocado 3 unidades para baixo","alt_2":"O gráfico é deslocado 3 unidades para cima","alt_3":"O gráfico é deslocado 3 unidades para a direita","alt_4":"O gráfico é refletido"}'),
(946, '{"alt_c":"O gráfico é deslocado 5 unidades para cima","alt_2":"O gráfico é deslocado 5 unidades para baixo","alt_3":"O gráfico é deslocado 5 unidades para a direita","alt_4":"O gráfico é refletido"}'),
(947, '{"alt_c":"O gráfico é deslocado 1 unidade para baixo","alt_2":"O gráfico é deslocado 1 unidade para cima","alt_3":"O gráfico é deslocado 1 unidade para a direita","alt_4":"O gráfico é refletido"}'),
(948, '{"alt_c":"O gráfico é deslocado 10 unidades para cima","alt_2":"O gráfico é deslocado 10 unidades para baixo","alt_3":"O gráfico é deslocado 10 unidades para a direita","alt_4":"O gráfico é refletido"}'),
(949, '{"alt_c":"O gráfico é deslocado 2 unidades para baixo","alt_2":"O gráfico é deslocado 2 unidades para cima","alt_3":"O gráfico é deslocado 2 unidades para a direita","alt_4":"O gráfico é refletido"}'),
(950, '{"alt_c":"O gráfico é deslocado 1 unidade para cima","alt_2":"O gráfico é deslocado 1 unidade para baixo","alt_3":"O gráfico é deslocado 1 unidade para a direita","alt_4":"O gráfico é refletido"}');

-- ==========================================
-- PERGUNTA 1
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (20, 'Resolva a equação ( v1 )<sup>x</sup> = ( v2 )<sup>v3</sup>.');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"2","v2":"2","v3":"3"}'),
(@pergunta_id, '{"v1":"3","v2":"3","v3":"2"}'),
(@pergunta_id, '{"v1":"5","v2":"5","v3":"1"}'),
(@pergunta_id, '{"v1":"4","v2":"4","v3":"2"}'),
(@pergunta_id, '{"v1":"7","v2":"7","v3":"0"}'),
(@pergunta_id, '{"v1":"8","v2":"8","v3":"1"}'),
(@pergunta_id, '{"v1":"6","v2":"6","v3":"3"}'),
(@pergunta_id, '{"v1":"9","v2":"9","v3":"2"}'),
(@pergunta_id, '{"v1":"10","v2":"10","v3":"1"}'),
(@pergunta_id, '{"v1":"2","v2":"2","v3":"5"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(951, '{"alt_c":"x = 3","alt_2":"x = 2","alt_3":"x = 1","alt_4":"x = 4"}'),
(952, '{"alt_c":"x = 2","alt_2":"x = 3","alt_3":"x = 1","alt_4":"x = 0"}'),
(953, '{"alt_c":"x = 1","alt_2":"x = 0","alt_3":"x = 2","alt_4":"x = 3"}'),
(954, '{"alt_c":"x = 2","alt_2":"x = 4","alt_3":"x = 1","alt_4":"x = 3"}'),
(955, '{"alt_c":"x = 0","alt_2":"x = 1","alt_3":"x = 2","alt_4":"x = 3"}'),
(956, '{"alt_c":"x = 1","alt_2":"x = 2","alt_3":"x = 3","alt_4":"x = 0"}'),
(957, '{"alt_c":"x = 3","alt_2":"x = 2","alt_3":"x = 1","alt_4":"x = 4"}'),
(958, '{"alt_c":"x = 2","alt_2":"x = 3","alt_3":"x = 1","alt_4":"x = 0"}'),
(959, '{"alt_c":"x = 1","alt_2":"x = 2","alt_3":"x = 0","alt_4":"x = 3"}'),
(960, '{"alt_c":"x = 5","alt_2":"x = 4","alt_3":"x = 2","alt_4":"x = 3"}');

-- ==========================================
-- PERGUNTA 2
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (20, 'Determine o valor de x em ( v1 )<sup>x</sup> = ( v2 ).');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"2","v2":"8"}'),
(@pergunta_id, '{"v1":"3","v2":"9"}'),
(@pergunta_id, '{"v1":"5","v2":"25"}'),
(@pergunta_id, '{"v1":"4","v2":"16"}'),
(@pergunta_id, '{"v1":"7","v2":"49"}'),
(@pergunta_id, '{"v1":"10","v2":"100"}'),
(@pergunta_id, '{"v1":"2","v2":"4"}'),
(@pergunta_id, '{"v1":"3","v2":"27"}'),
(@pergunta_id, '{"v1":"5","v2":"125"}'),
(@pergunta_id, '{"v1":"6","v2":"36"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(961, '{"alt_c":"x = 3","alt_2":"x = 2","alt_3":"x = 4","alt_4":"x = 5"}'),
(962, '{"alt_c":"x = 2","alt_2":"x = 3","alt_3":"x = 1","alt_4":"x = 4"}'),
(963, '{"alt_c":"x = 2","alt_2":"x = 1","alt_3":"x = 3","alt_4":"x = 4"}'),
(964, '{"alt_c":"x = 2","alt_2":"x = 3","alt_3":"x = 1","alt_4":"x = 4"}'),
(965, '{"alt_c":"x = 2","alt_2":"x = 3","alt_3":"x = 1","alt_4":"x = 4"}'),
(966, '{"alt_c":"x = 2","alt_2":"x = 1","alt_3":"x = 3","alt_4":"x = 4"}'),
(967, '{"alt_c":"x = 2","alt_2":"x = 1","alt_3":"x = 3","alt_4":"x = 4"}'),
(968, '{"alt_c":"x = 3","alt_2":"x = 2","alt_3":"x = 4","alt_4":"x = 1"}'),
(969, '{"alt_c":"x = 3","alt_2":"x = 2","alt_3":"x = 1","alt_4":"x = 4"}'),
(970, '{"alt_c":"x = 2","alt_2":"x = 3","alt_3":"x = 1","alt_4":"x = 4"}');

-- ==========================================
-- PERGUNTA 3
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (20, 'Resolva a equação exponencial ( v1 )<sup>x</sup> = ( v2 )<sup>y</sup>.');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"2","v2":"2","y":"4"}'),
(@pergunta_id, '{"v1":"3","v2":"3","y":"2"}'),
(@pergunta_id, '{"v1":"5","v2":"5","y":"1"}'),
(@pergunta_id, '{"v1":"4","v2":"4","y":"3"}'),
(@pergunta_id, '{"v1":"7","v2":"7","y":"2"}'),
(@pergunta_id, '{"v1":"8","v2":"8","y":"4"}'),
(@pergunta_id, '{"v1":"6","v2":"6","y":"3"}'),
(@pergunta_id, '{"v1":"9","v2":"9","y":"2"}'),
(@pergunta_id, '{"v1":"10","v2":"10","y":"1"}'),
(@pergunta_id, '{"v1":"2","v2":"2","y":"5"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(971, '{"alt_c":"x = 4","alt_2":"x = 2","alt_3":"x = 3","alt_4":"x = 1"}'),
(972, '{"alt_c":"x = 2","alt_2":"x = 1","alt_3":"x = 3","alt_4":"x = 4"}'),
(973, '{"alt_c":"x = 1","alt_2":"x = 2","alt_3":"x = 3","alt_4":"x = 4"}'),
(974, '{"alt_c":"x = 3","alt_2":"x = 2","alt_3":"x = 4","alt_4":"x = 1"}'),
(975, '{"alt_c":"x = 2","alt_2":"x = 1","alt_3":"x = 3","alt_4":"x = 4"}'),
(976, '{"alt_c":"x = 4","alt_2":"x = 2","alt_3":"x = 3","alt_4":"x = 1"}'),
(977, '{"alt_c":"x = 3","alt_2":"x = 1","alt_3":"x = 2","alt_4":"x = 4"}'),
(978, '{"alt_c":"x = 2","alt_2":"x = 1","alt_3":"x = 3","alt_4":"x = 4"}'),
(979, '{"alt_c":"x = 1","alt_2":"x = 2","alt_3":"x = 3","alt_4":"x = 4"}'),
(980, '{"alt_c":"x = 5","alt_2":"x = 4","alt_3":"x = 3","alt_4":"x = 2"}');

-- ==========================================
-- PERGUNTA 4
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (20, 'Qual é a principal estratégia para resolver uma equação exponencial?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"Igualar as bases"}'),
(@pergunta_id, '{"v1":"Somar os expoentes"}'),
(@pergunta_id, '{"v1":"Multiplicar os expoentes"}'),
(@pergunta_id, '{"v1":"Subtrair as bases"}'),
(@pergunta_id, '{"v1":"Fazer logaritmo dos dois lados"}'),
(@pergunta_id, '{"v1":"Tentar fatorar"}'),
(@pergunta_id, '{"v1":"Isolar o termo exponencial"}'),
(@pergunta_id, '{"v1":"Multiplicar tudo por zero"}'),
(@pergunta_id, '{"v1":"Somar os coeficientes"}'),
(@pergunta_id, '{"v1":"Usar regra de três"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(981, '{"alt_c":"Igualar as bases","alt_2":"Somar os expoentes","alt_3":"Subtrair as bases","alt_4":"Usar logaritmos"}'),
(982, '{"alt_c":"Igualar as bases","alt_2":"Somar os expoentes","alt_3":"Multiplicar as bases","alt_4":"Subtrair os expoentes"}'),
(983, '{"alt_c":"Igualar as bases","alt_2":"Somar os coeficientes","alt_3":"Multiplicar os expoentes","alt_4":"Subtrair as bases"}'),
(984, '{"alt_c":"Igualar as bases","alt_2":"Somar as bases","alt_3":"Multiplicar os expoentes","alt_4":"Dividir os coeficientes"}'),
(985, '{"alt_c":"Fazer logaritmo dos dois lados","alt_2":"Subtrair as bases","alt_3":"Somar os expoentes","alt_4":"Multiplicar os coeficientes"}'),
(986, '{"alt_c":"Igualar as bases","alt_2":"Somar os expoentes","alt_3":"Subtrair as bases","alt_4":"Usar regra de três"}'),
(987, '{"alt_c":"Isolar o termo exponencial","alt_2":"Somar os expoentes","alt_3":"Multiplicar as bases","alt_4":"Subtrair os expoentes"}'),
(988, '{"alt_c":"Igualar as bases","alt_2":"Somar os coeficientes","alt_3":"Multiplicar os expoentes","alt_4":"Dividir os coeficientes"}'),
(989, '{"alt_c":"Igualar as bases","alt_2":"Somar as bases","alt_3":"Multiplicar os expoentes","alt_4":"Usar logaritmos"}'),
(990, '{"alt_c":"Igualar as bases","alt_2":"Somar os expoentes","alt_3":"Subtrair as bases","alt_4":"Multiplicar tudo por zero"}');

-- ==========================================
-- PERGUNTA 5
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (20, 'Em uma equação exponencial, o que acontece se as bases forem iguais e os expoentes diferentes?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"a^x = a^y"}'),
(@pergunta_id, '{"v1":"b^x = b^y"}'),
(@pergunta_id, '{"v1":"2^x = 2^3"}'),
(@pergunta_id, '{"v1":"3^x = 3^5"}'),
(@pergunta_id, '{"v1":"4^x = 4^2"}'),
(@pergunta_id, '{"v1":"5^x = 5^1"}'),
(@pergunta_id, '{"v1":"6^x = 6^2"}'),
(@pergunta_id, '{"v1":"7^x = 7^3"}'),
(@pergunta_id, '{"v1":"8^x = 8^4"}'),
(@pergunta_id, '{"v1":"9^x = 9^2"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(991, '{"alt_c":"Os expoentes devem ser iguais","alt_2":"As bases mudam","alt_3":"Não há solução","alt_4":"O resultado é sempre 1"}'),
(992, '{"alt_c":"Os expoentes devem ser iguais","alt_2":"As bases mudam","alt_3":"Não há solução","alt_4":"O resultado é sempre 1"}'),
(993, '{"alt_c":"Os expoentes devem ser iguais","alt_2":"As bases mudam","alt_3":"Não há solução","alt_4":"O resultado é sempre 1"}'),
(994, '{"alt_c":"Os expoentes devem ser iguais","alt_2":"As bases mudam","alt_3":"Não há solução","alt_4":"O resultado é sempre 1"}'),
(995, '{"alt_c":"Os expoentes devem ser iguais","alt_2":"As bases mudam","alt_3":"Não há solução","alt_4":"O resultado é sempre 1"}'),
(996, '{"alt_c":"Os expoentes devem ser iguais","alt_2":"As bases mudam","alt_3":"Não há solução","alt_4":"O resultado é sempre 1"}'),
(997, '{"alt_c":"Os expoentes devem ser iguais","alt_2":"As bases mudam","alt_3":"Não há solução","alt_4":"O resultado é sempre 1"}'),
(998, '{"alt_c":"Os expoentes devem ser iguais","alt_2":"As bases mudam","alt_3":"Não há solução","alt_4":"O resultado é sempre 1"}'),
(999, '{"alt_c":"Os expoentes devem ser iguais","alt_2":"As bases mudam","alt_3":"Não há solução","alt_4":"O resultado é sempre 1"}'),
(1000, '{"alt_c":"Os expoentes devem ser iguais","alt_2":"As bases mudam","alt_3":"Não há solução","alt_4":"O resultado é sempre 1"}');

-- ==========================================
-- PERGUNTA 1
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (21, 'Resolva a inequação ( v1 )<sup>x</sup> > ( v2 )<sup>v3</sup>.');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"2","v2":"2","v3":"3"}'),
(@pergunta_id, '{"v1":"3","v2":"3","v3":"2"}'),
(@pergunta_id, '{"v1":"4","v2":"4","v3":"1"}'),
(@pergunta_id, '{"v1":"5","v2":"5","v3":"2"}'),
(@pergunta_id, '{"v1":"7","v2":"7","v3":"3"}'),
(@pergunta_id, '{"v1":"8","v2":"8","v3":"1"}'),
(@pergunta_id, '{"v1":"9","v2":"9","v3":"2"}'),
(@pergunta_id, '{"v1":"10","v2":"10","v3":"1"}'),
(@pergunta_id, '{"v1":"6","v2":"6","v3":"4"}'),
(@pergunta_id, '{"v1":"2","v2":"2","v3":"5"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(1001, '{"alt_c":"x > 3","alt_2":"x < 3","alt_3":"x = 3","alt_4":"x ≥ 3"}'),
(1002, '{"alt_c":"x > 2","alt_2":"x < 2","alt_3":"x = 2","alt_4":"x ≥ 2"}'),
(1003, '{"alt_c":"x > 1","alt_2":"x < 1","alt_3":"x = 1","alt_4":"x ≥ 1"}'),
(1004, '{"alt_c":"x > 2","alt_2":"x < 2","alt_3":"x = 2","alt_4":"x ≥ 2"}'),
(1005, '{"alt_c":"x > 3","alt_2":"x < 3","alt_3":"x = 3","alt_4":"x ≥ 3"}'),
(1006, '{"alt_c":"x > 1","alt_2":"x < 1","alt_3":"x = 1","alt_4":"x ≥ 1"}'),
(1007, '{"alt_c":"x > 2","alt_2":"x < 2","alt_3":"x = 2","alt_4":"x ≥ 2"}'),
(1008, '{"alt_c":"x > 1","alt_2":"x < 1","alt_3":"x = 1","alt_4":"x ≥ 1"}'),
(1009, '{"alt_c":"x > 4","alt_2":"x < 4","alt_3":"x = 4","alt_4":"x ≥ 4"}'),
(1010, '{"alt_c":"x > 5","alt_2":"x < 5","alt_3":"x = 5","alt_4":"x ≥ 5"}');

-- ==========================================
-- PERGUNTA 2
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (21, 'Resolva a inequação ( v1 )<sup>x</sup> < ( v2 ).');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"2","v2":"8"}'),
(@pergunta_id, '{"v1":"3","v2":"9"}'),
(@pergunta_id, '{"v1":"4","v2":"16"}'),
(@pergunta_id, '{"v1":"5","v2":"25"}'),
(@pergunta_id, '{"v1":"6","v2":"36"}'),
(@pergunta_id, '{"v1":"7","v2":"49"}'),
(@pergunta_id, '{"v1":"8","v2":"64"}'),
(@pergunta_id, '{"v1":"9","v2":"81"}'),
(@pergunta_id, '{"v1":"10","v2":"100"}'),
(@pergunta_id, '{"v1":"2","v2":"4"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(1011, '{"alt_c":"x < 3","alt_2":"x > 3","alt_3":"x = 3","alt_4":"x ≤ 3"}'),
(1012, '{"alt_c":"x < 2","alt_2":"x > 2","alt_3":"x = 2","alt_4":"x ≤ 2"}'),
(1013, '{"alt_c":"x < 2","alt_2":"x > 2","alt_3":"x = 2","alt_4":"x ≤ 2"}'),
(1014, '{"alt_c":"x < 2","alt_2":"x > 2","alt_3":"x = 2","alt_4":"x ≤ 2"}'),
(1015, '{"alt_c":"x < 2","alt_2":"x > 2","alt_3":"x = 2","alt_4":"x ≤ 2"}'),
(1016, '{"alt_c":"x < 2","alt_2":"x > 2","alt_3":"x = 2","alt_4":"x ≤ 2"}'),
(1017, '{"alt_c":"x < 2","alt_2":"x > 2","alt_3":"x = 2","alt_4":"x ≤ 2"}'),
(1018, '{"alt_c":"x < 2","alt_2":"x > 2","alt_3":"x = 2","alt_4":"x ≤ 2"}'),
(1019, '{"alt_c":"x < 2","alt_2":"x > 2","alt_3":"x = 2","alt_4":"x ≤ 2"}'),
(1020, '{"alt_c":"x < 2","alt_2":"x > 2","alt_3":"x = 2","alt_4":"x ≤ 2"}');

-- ==========================================
-- PERGUNTA 3
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (21, 'Quando uma inequação exponencial muda o sentido da desigualdade?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"Quando a base é menor que 1"}'),
(@pergunta_id, '{"v1":"Quando a base é maior que 1"}'),
(@pergunta_id, '{"v1":"Quando o expoente é par"}'),
(@pergunta_id, '{"v1":"Quando o expoente é ímpar"}'),
(@pergunta_id, '{"v1":"Quando a base é negativa"}'),
(@pergunta_id, '{"v1":"Quando o expoente é zero"}'),
(@pergunta_id, '{"v1":"Quando as bases são iguais"}'),
(@pergunta_id, '{"v1":"Quando os expoentes são iguais"}'),
(@pergunta_id, '{"v1":"Quando a base é fracionária"}'),
(@pergunta_id, '{"v1":"Quando a base é 0"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(1021, '{"alt_c":"Quando a base é menor que 1","alt_2":"Quando a base é maior que 1","alt_3":"Quando o expoente é par","alt_4":"Quando o expoente é ímpar"}'),
(1022, '{"alt_c":"Quando a base é menor que 1","alt_2":"Quando o expoente é par","alt_3":"Quando o expoente é ímpar","alt_4":"Quando a base é 0"}'),
(1023, '{"alt_c":"Quando a base é menor que 1","alt_2":"Quando o expoente é zero","alt_3":"Quando as bases são iguais","alt_4":"Quando os expoentes são iguais"}'),
(1024, '{"alt_c":"Quando a base é menor que 1","alt_2":"Quando a base é maior que 1","alt_3":"Quando a base é 0","alt_4":"Quando o expoente é zero"}'),
(1025, '{"alt_c":"Quando a base é menor que 1","alt_2":"Quando o expoente é ímpar","alt_3":"Quando as bases são iguais","alt_4":"Quando a base é 0"}'),
(1026, '{"alt_c":"Quando a base é menor que 1","alt_2":"Quando o expoente é par","alt_3":"Quando o expoente é ímpar","alt_4":"Quando a base é 0"}'),
(1027, '{"alt_c":"Quando a base é menor que 1","alt_2":"Quando o expoente é zero","alt_3":"Quando a base é negativa","alt_4":"Quando o expoente é ímpar"}'),
(1028, '{"alt_c":"Quando a base é menor que 1","alt_2":"Quando a base é 0","alt_3":"Quando o expoente é par","alt_4":"Quando a base é maior que 1"}'),
(1029, '{"alt_c":"Quando a base é menor que 1","alt_2":"Quando a base é fracionária","alt_3":"Quando o expoente é zero","alt_4":"Quando as bases são iguais"}'),
(1030, '{"alt_c":"Quando a base é menor que 1","alt_2":"Quando o expoente é par","alt_3":"Quando a base é negativa","alt_4":"Quando o expoente é zero"}');

-- ==========================================
-- PERGUNTA 4
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (21, 'Resolva a inequação ( v1 )<sup>x</sup> ≥ ( v2 )<sup>2</sup>.');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"2","v2":"2"}'),
(@pergunta_id, '{"v1":"3","v2":"3"}'),
(@pergunta_id, '{"v1":"4","v2":"4"}'),
(@pergunta_id, '{"v1":"5","v2":"5"}'),
(@pergunta_id, '{"v1":"6","v2":"6"}'),
(@pergunta_id, '{"v1":"7","v2":"7"}'),
(@pergunta_id, '{"v1":"8","v2":"8"}'),
(@pergunta_id, '{"v1":"9","v2":"9"}'),
(@pergunta_id, '{"v1":"10","v2":"10"}'),
(@pergunta_id, '{"v1":"2","v2":"4"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(1031, '{"alt_c":"x ≥ 2","alt_2":"x ≤ 2","alt_3":"x > 2","alt_4":"x < 2"}'),
(1032, '{"alt_c":"x ≥ 2","alt_2":"x ≤ 2","alt_3":"x > 2","alt_4":"x < 2"}'),
(1033, '{"alt_c":"x ≥ 2","alt_2":"x ≤ 2","alt_3":"x > 2","alt_4":"x < 2"}'),
(1034, '{"alt_c":"x ≥ 2","alt_2":"x ≤ 2","alt_3":"x > 2","alt_4":"x < 2"}'),
(1035, '{"alt_c":"x ≥ 2","alt_2":"x ≤ 2","alt_3":"x > 2","alt_4":"x < 2"}'),
(1036, '{"alt_c":"x ≥ 2","alt_2":"x ≤ 2","alt_3":"x > 2","alt_4":"x < 2"}'),
(1037, '{"alt_c":"x ≥ 2","alt_2":"x ≤ 2","alt_3":"x > 2","alt_4":"x < 2"}'),
(1038, '{"alt_c":"x ≥ 2","alt_2":"x ≤ 2","alt_3":"x > 2","alt_4":"x < 2"}'),
(1039, '{"alt_c":"x ≥ 2","alt_2":"x ≤ 2","alt_3":"x > 2","alt_4":"x < 2"}'),
(1040, '{"alt_c":"x ≥ 2","alt_2":"x ≤ 2","alt_3":"x > 2","alt_4":"x < 2"}');

-- ==========================================
-- PERGUNTA 5
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (21, 'Em uma inequação exponencial, qual é a condição para inverter o sentido da desigualdade?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"Base entre 0 e 1"}'),
(@pergunta_id, '{"v1":"Base maior que 1"}'),
(@pergunta_id, '{"v1":"Base negativa"}'),
(@pergunta_id, '{"v1":"Expoente par"}'),
(@pergunta_id, '{"v1":"Expoente ímpar"}'),
(@pergunta_id, '{"v1":"Base igual a 0"}'),
(@pergunta_id, '{"v1":"Base igual a 1"}'),
(@pergunta_id, '{"v1":"Base fracionária"}'),
(@pergunta_id, '{"v1":"Expoente zero"}'),
(@pergunta_id, '{"v1":"Base racional"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(1041, '{"alt_c":"Quando a base está entre 0 e 1","alt_2":"Quando a base é maior que 1","alt_3":"Quando o expoente é par","alt_4":"Quando a base é negativa"}'),
(1042, '{"alt_c":"Quando a base está entre 0 e 1","alt_2":"Quando o expoente é zero","alt_3":"Quando a base é negativa","alt_4":"Quando as bases são iguais"}'),
(1043, '{"alt_c":"Quando a base está entre 0 e 1","alt_2":"Quando a base é maior que 1","alt_3":"Quando o expoente é par","alt_4":"Quando o expoente é ímpar"}'),
(1044, '{"alt_c":"Quando a base está entre 0 e 1","alt_2":"Quando a base é 1","alt_3":"Quando a base é negativa","alt_4":"Quando a base é zero"}'),
(1045, '{"alt_c":"Quando a base está entre 0 e 1","alt_2":"Quando a base é fracionária","alt_3":"Quando a base é negativa","alt_4":"Quando o expoente é zero"}'),
(1046, '{"alt_c":"Quando a base está entre 0 e 1","alt_2":"Quando a base é maior que 1","alt_3":"Quando a base é negativa","alt_4":"Quando o expoente é par"}'),
(1047, '{"alt_c":"Quando a base está entre 0 e 1","alt_2":"Quando a base é racional","alt_3":"Quando o expoente é ímpar","alt_4":"Quando a base é negativa"}'),
(1048, '{"alt_c":"Quando a base está entre 0 e 1","alt_2":"Quando o expoente é par","alt_3":"Quando a base é negativa","alt_4":"Quando a base é 1"}'),
(1049, '{"alt_c":"Quando a base está entre 0 e 1","alt_2":"Quando a base é maior que 1","alt_3":"Quando a base é 0","alt_4":"Quando o expoente é zero"}'),
(1050, '{"alt_c":"Quando a base está entre 0 e 1","alt_2":"Quando a base é racional","alt_3":"Quando a base é 0","alt_4":"Quando o expoente é par"}');

-- ==========================================
-- PERGUNTA 1
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (22, 'Calcule o valor de sen( v1 ).');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"0"}'),
(@pergunta_id, '{"v1":"π/6"}'),
(@pergunta_id, '{"v1":"π/4"}'),
(@pergunta_id, '{"v1":"π/3"}'),
(@pergunta_id, '{"v1":"π/2"}'),
(@pergunta_id, '{"v1":"π"}'),
(@pergunta_id, '{"v1":"3π/2"}'),
(@pergunta_id, '{"v1":"2π"}'),
(@pergunta_id, '{"v1":"5π/6"}'),
(@pergunta_id, '{"v1":"7π/6"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(1051, '{"alt_c":"0","alt_2":"1","alt_3":"-1","alt_4":"√3/2"}'),
(1052, '{"alt_c":"1/2","alt_2":"√3/2","alt_3":"√2/2","alt_4":"0"}'),
(1053, '{"alt_c":"√2/2","alt_2":"1/2","alt_3":"√3/2","alt_4":"0"}'),
(1054, '{"alt_c":"√3/2","alt_2":"1/2","alt_3":"√2/2","alt_4":"0"}'),
(1055, '{"alt_c":"1","alt_2":"0","alt_3":"-1","alt_4":"√3/2"}'),
(1056, '{"alt_c":"0","alt_2":"1","alt_3":"-1","alt_4":"√2/2"}'),
(1057, '{"alt_c":"-1","alt_2":"1","alt_3":"0","alt_4":"√3/2"}'),
(1058, '{"alt_c":"0","alt_2":"1","alt_3":"-1","alt_4":"√2/2"}'),
(1059, '{"alt_c":"1/2","alt_2":"√3/2","alt_3":"-1/2","alt_4":"-√3/2"}'),
(1060, '{"alt_c":"-1/2","alt_2":"√3/2","alt_3":"1/2","alt_4":"-√3/2"}');

-- ==========================================
-- PERGUNTA 2
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (22, 'Calcule o valor de cos( v1 ).');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"0"}'),
(@pergunta_id, '{"v1":"π/6"}'),
(@pergunta_id, '{"v1":"π/4"}'),
(@pergunta_id, '{"v1":"π/3"}'),
(@pergunta_id, '{"v1":"π/2"}'),
(@pergunta_id, '{"v1":"π"}'),
(@pergunta_id, '{"v1":"3π/2"}'),
(@pergunta_id, '{"v1":"2π"}'),
(@pergunta_id, '{"v1":"5π/6"}'),
(@pergunta_id, '{"v1":"7π/6"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(1061, '{"alt_c":"1","alt_2":"0","alt_3":"-1","alt_4":"√3/2"}'),
(1062, '{"alt_c":"√3/2","alt_2":"1/2","alt_3":"0","alt_4":"√2/2"}'),
(1063, '{"alt_c":"√2/2","alt_2":"√3/2","alt_3":"1/2","alt_4":"0"}'),
(1064, '{"alt_c":"1/2","alt_2":"√3/2","alt_3":"√2/2","alt_4":"0"}'),
(1065, '{"alt_c":"0","alt_2":"1","alt_3":"-1","alt_4":"√2/2"}'),
(1066, '{"alt_c":"-1","alt_2":"1","alt_3":"0","alt_4":"√2/2"}'),
(1067, '{"alt_c":"0","alt_2":"1","alt_3":"-1","alt_4":"√3/2"}'),
(1068, '{"alt_c":"1","alt_2":"0","alt_3":"-1","alt_4":"√2/2"}'),
(1069, '{"alt_c":"-√3/2","alt_2":"-1/2","alt_3":"√3/2","alt_4":"1/2"}'),
(1070, '{"alt_c":"-√3/2","alt_2":"√3/2","alt_3":"1/2","alt_4":"-1/2"}');

-- ==========================================
-- PERGUNTA 3
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (22, 'Calcule o valor de tg( v1 ).');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"0"}'),
(@pergunta_id, '{"v1":"π/6"}'),
(@pergunta_id, '{"v1":"π/4"}'),
(@pergunta_id, '{"v1":"π/3"}'),
(@pergunta_id, '{"v1":"π/2"}'),
(@pergunta_id, '{"v1":"π"}'),
(@pergunta_id, '{"v1":"3π/2"}'),
(@pergunta_id, '{"v1":"2π"}'),
(@pergunta_id, '{"v1":"5π/6"}'),
(@pergunta_id, '{"v1":"7π/6"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(1071, '{"alt_c":"0","alt_2":"1","alt_3":"√3","alt_4":"-√3"}'),
(1072, '{"alt_c":"√3/3","alt_2":"√3","alt_3":"1","alt_4":"0"}'),
(1073, '{"alt_c":"1","alt_2":"√3/3","alt_3":"√3","alt_4":"0"}'),
(1074, '{"alt_c":"√3","alt_2":"1","alt_3":"√3/3","alt_4":"0"}'),
(1075, '{"alt_c":"indefinido","alt_2":"0","alt_3":"1","alt_4":"√3"}'),
(1076, '{"alt_c":"0","alt_2":"1","alt_3":"-√3","alt_4":"√3"}'),
(1077, '{"alt_c":"indefinido","alt_2":"0","alt_3":"√3","alt_4":"-√3"}'),
(1078, '{"alt_c":"0","alt_2":"√3","alt_3":"1","alt_4":"-√3"}'),
(1079, '{"alt_c":"-√3/3","alt_2":"√3/3","alt_3":"√3","alt_4":"1"}'),
(1080, '{"alt_c":"√3/3","alt_2":"-√3/3","alt_3":"√3","alt_4":"-√3"}');

-- ==========================================
-- PERGUNTA 4
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (22, 'Sabendo que sen( v1 ) = v2, determine cos( v1 ).');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"π/6","v2":"1/2"}'),
(@pergunta_id, '{"v1":"π/4","v2":"√2/2"}'),
(@pergunta_id, '{"v1":"π/3","v2":"√3/2"}'),
(@pergunta_id, '{"v1":"π/2","v2":"1"}'),
(@pergunta_id, '{"v1":"π","v2":"0"}'),
(@pergunta_id, '{"v1":"3π/2","v2":"-1"}'),
(@pergunta_id, '{"v1":"2π","v2":"0"}'),
(@pergunta_id, '{"v1":"5π/6","v2":"1/2"}'),
(@pergunta_id, '{"v1":"7π/6","v2":"-1/2"}'),
(@pergunta_id, '{"v1":"4π/3","v2":"-√3/2"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(1081, '{"alt_c":"√3/2","alt_2":"1/2","alt_3":"0","alt_4":"-√3/2"}'),
(1082, '{"alt_c":"√2/2","alt_2":"1/2","alt_3":"√3/2","alt_4":"0"}'),
(1083, '{"alt_c":"1/2","alt_2":"√3/2","alt_3":"0","alt_4":"-1/2"}'),
(1084, '{"alt_c":"0","alt_2":"1","alt_3":"-1","alt_4":"√2/2"}'),
(1085, '{"alt_c":"-1","alt_2":"0","alt_3":"1","alt_4":"√2/2"}'),
(1086, '{"alt_c":"0","alt_2":"1","alt_3":"√3/2","alt_4":"-1"}'),
(1087, '{"alt_c":"1","alt_2":"0","alt_3":"-1","alt_4":"√3/2"}'),
(1088, '{"alt_c":"-√3/2","alt_2":"√3/2","alt_3":"-1/2","alt_4":"1/2"}'),
(1089, '{"alt_c":"-√3/2","alt_2":"√3/2","alt_3":"1/2","alt_4":"-1/2"}'),
(1090, '{"alt_c":"-1/2","alt_2":"1/2","alt_3":"0","alt_4":"√3/2"}');

-- ==========================================
-- PERGUNTA 5
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (22, 'Determine o valor de sen²( v1 ) + cos²( v1 ).');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"0"}'),
(@pergunta_id, '{"v1":"π/6"}'),
(@pergunta_id, '{"v1":"π/4"}'),
(@pergunta_id, '{"v1":"π/3"}'),
(@pergunta_id, '{"v1":"π/2"}'),
(@pergunta_id, '{"v1":"π"}'),
(@pergunta_id, '{"v1":"3π/2"}'),
(@pergunta_id, '{"v1":"2π"}'),
(@pergunta_id, '{"v1":"5π/4"}'),
(@pergunta_id, '{"v1":"7π/6"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(1091, '{"alt_c":"1","alt_2":"0","alt_3":"2","alt_4":"-1"}'),
(1092, '{"alt_c":"1","alt_2":"0","alt_3":"2","alt_4":"-1"}'),
(1093, '{"alt_c":"1","alt_2":"0","alt_3":"2","alt_4":"-1"}'),
(1094, '{"alt_c":"1","alt_2":"0","alt_3":"2","alt_4":"-1"}'),
(1095, '{"alt_c":"1","alt_2":"0","alt_3":"2","alt_4":"-1"}'),
(1096, '{"alt_c":"1","alt_2":"0","alt_3":"2","alt_4":"-1"}'),
(1097, '{"alt_c":"1","alt_2":"0","alt_3":"2","alt_4":"-1"}'),
(1098, '{"alt_c":"1","alt_2":"0","alt_3":"2","alt_4":"-1"}'),
(1099, '{"alt_c":"1","alt_2":"0","alt_3":"2","alt_4":"-1"}'),
(1100, '{"alt_c":"1","alt_2":"0","alt_3":"2","alt_4":"-1"}');

-- ==========================================
-- PERGUNTA 1
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (23, 'Em um triângulo retângulo, com catetos de medidas v1 e v2, qual é o valor da hipotenusa?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"3","v2":"4"}'),
(@pergunta_id, '{"v1":"5","v2":"12"}'),
(@pergunta_id, '{"v1":"6","v2":"8"}'),
(@pergunta_id, '{"v1":"7","v2":"24"}'),
(@pergunta_id, '{"v1":"8","v2":"15"}'),
(@pergunta_id, '{"v1":"9","v2":"12"}'),
(@pergunta_id, '{"v1":"10","v2":"24"}'),
(@pergunta_id, '{"v1":"9","v2":"40"}'),
(@pergunta_id, '{"v1":"12","v2":"16"}'),
(@pergunta_id, '{"v1":"15","v2":"20"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(1101, '{"alt_c":"5","alt_2":"6","alt_3":"4","alt_4":"7"}'),
(1102, '{"alt_c":"13","alt_2":"12","alt_3":"10","alt_4":"11"}'),
(1103, '{"alt_c":"10","alt_2":"8","alt_3":"9","alt_4":"12"}'),
(1104, '{"alt_c":"25","alt_2":"24","alt_3":"26","alt_4":"27"}'),
(1105, '{"alt_c":"17","alt_2":"18","alt_3":"16","alt_4":"15"}'),
(1106, '{"alt_c":"15","alt_2":"13","alt_3":"14","alt_4":"12"}'),
(1107, '{"alt_c":"26","alt_2":"24","alt_3":"28","alt_4":"25"}'),
(1108, '{"alt_c":"41","alt_2":"39","alt_3":"40","alt_4":"42"}'),
(1109, '{"alt_c":"20","alt_2":"18","alt_3":"22","alt_4":"24"}'),
(1110, '{"alt_c":"25","alt_2":"24","alt_3":"20","alt_4":"26"}');

-- ==========================================
-- PERGUNTA 2
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (23, 'Um triângulo retângulo possui hipotenusa de v1 e um cateto de v2. Determine o outro cateto.');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"13","v2":"12"}'),
(@pergunta_id, '{"v1":"10","v2":"6"}'),
(@pergunta_id, '{"v1":"25","v2":"24"}'),
(@pergunta_id, '{"v1":"17","v2":"8"}'),
(@pergunta_id, '{"v1":"29","v2":"20"}'),
(@pergunta_id, '{"v1":"15","v2":"9"}'),
(@pergunta_id, '{"v1":"26","v2":"10"}'),
(@pergunta_id, '{"v1":"50","v2":"30"}'),
(@pergunta_id, '{"v1":"41","v2":"9"}'),
(@pergunta_id, '{"v1":"37","v2":"35"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(1111, '{"alt_c":"5","alt_2":"7","alt_3":"10","alt_4":"9"}'),
(1112, '{"alt_c":"8","alt_2":"7","alt_3":"9","alt_4":"6"}'),
(1113, '{"alt_c":"7","alt_2":"9","alt_3":"6","alt_4":"8"}'),
(1114, '{"alt_c":"15","alt_2":"12","alt_3":"9","alt_4":"14"}'),
(1115, '{"alt_c":"21","alt_2":"22","alt_3":"19","alt_4":"20"}'),
(1116, '{"alt_c":"12","alt_2":"9","alt_3":"14","alt_4":"15"}'),
(1117, '{"alt_c":"24","alt_2":"20","alt_3":"23","alt_4":"25"}'),
(1118, '{"alt_c":"40","alt_2":"30","alt_3":"35","alt_4":"45"}'),
(1119, '{"alt_c":"40","alt_2":"38","alt_3":"35","alt_4":"42"}'),
(1120, '{"alt_c":"12","alt_2":"10","alt_3":"11","alt_4":"13"}');

-- ==========================================
-- PERGUNTA 3
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (23, 'Verifique se o triângulo com lados de medidas v1, v2 e v3 é retângulo.');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"3","v2":"4","v3":"5"}'),
(@pergunta_id, '{"v1":"5","v2":"12","v3":"13"}'),
(@pergunta_id, '{"v1":"8","v2":"15","v3":"17"}'),
(@pergunta_id, '{"v1":"6","v2":"8","v3":"10"}'),
(@pergunta_id, '{"v1":"9","v2":"40","v3":"41"}'),
(@pergunta_id, '{"v1":"7","v2":"24","v3":"25"}'),
(@pergunta_id, '{"v1":"10","v2":"20","v3":"25"}'),
(@pergunta_id, '{"v1":"12","v2":"16","v3":"20"}'),
(@pergunta_id, '{"v1":"9","v2":"12","v3":"15"}'),
(@pergunta_id, '{"v1":"5","v2":"6","v3":"8"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(1121, '{"alt_c":"Sim","alt_2":"Não"}'),
(1122, '{"alt_c":"Sim","alt_2":"Não"}'),
(1123, '{"alt_c":"Sim","alt_2":"Não"}'),
(1124, '{"alt_c":"Sim","alt_2":"Não"}'),
(1125, '{"alt_c":"Sim","alt_2":"Não"}'),
(1126, '{"alt_c":"Sim","alt_2":"Não"}'),
(1127, '{"alt_c":"Não","alt_2":"Sim"}'),
(1128, '{"alt_c":"Sim","alt_2":"Não"}'),
(1129, '{"alt_c":"Sim","alt_2":"Não"}'),
(1130, '{"alt_c":"Não","alt_2":"Sim"}');

-- ==========================================
-- PERGUNTA 4
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (23, 'Em um triângulo retângulo, a hipotenusa mede v1 e um cateto mede v2. Qual é o comprimento do outro cateto?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"10","v2":"6"}'),
(@pergunta_id, '{"v1":"13","v2":"5"}'),
(@pergunta_id, '{"v1":"25","v2":"7"}'),
(@pergunta_id, '{"v1":"15","v2":"9"}'),
(@pergunta_id, '{"v1":"26","v2":"10"}'),
(@pergunta_id, '{"v1":"50","v2":"30"}'),
(@pergunta_id, '{"v1":"41","v2":"9"}'),
(@pergunta_id, '{"v1":"37","v2":"35"}'),
(@pergunta_id, '{"v1":"29","v2":"21"}'),
(@pergunta_id, '{"v1":"17","v2":"8"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(1131, '{"alt_c":"8","alt_2":"6","alt_3":"7","alt_4":"9"}'),
(1132, '{"alt_c":"12","alt_2":"10","alt_3":"9","alt_4":"11"}'),
(1133, '{"alt_c":"24","alt_2":"20","alt_3":"23","alt_4":"25"}'),
(1134, '{"alt_c":"12","alt_2":"10","alt_3":"11","alt_4":"9"}'),
(1135, '{"alt_c":"24","alt_2":"20","alt_3":"22","alt_4":"25"}'),
(1136, '{"alt_c":"40","alt_2":"35","alt_3":"45","alt_4":"30"}'),
(1137, '{"alt_c":"40","alt_2":"35","alt_3":"39","alt_4":"38"}'),
(1138, '{"alt_c":"12","alt_2":"10","alt_3":"14","alt_4":"11"}'),
(1139, '{"alt_c":"20","alt_2":"19","alt_3":"21","alt_4":"18"}'),
(1140, '{"alt_c":"15","alt_2":"13","alt_3":"14","alt_4":"12"}');

-- ==========================================
-- PERGUNTA 5
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (23, 'Um triângulo retângulo tem cateto v1 e hipotenusa v2. Determine o outro cateto e diga se é maior ou menor que v1.');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"3","v2":"5"}'),
(@pergunta_id, '{"v1":"5","v2":"13"}'),
(@pergunta_id, '{"v1":"7","v2":"25"}'),
(@pergunta_id, '{"v1":"9","v2":"15"}'),
(@pergunta_id, '{"v1":"8","v2":"10"}'),
(@pergunta_id, '{"v1":"6","v2":"10"}'),
(@pergunta_id, '{"v1":"12","v2":"13"}'),
(@pergunta_id, '{"v1":"7","v2":"10"}'),
(@pergunta_id, '{"v1":"9","v2":"41"}'),
(@pergunta_id, '{"v1":"15","v2":"17"}'),
(@pergunta_id, '{"v1":"3","v2":"5"}'),
(@pergunta_id, '{"v1":"5","v2":"13"}'),
(@pergunta_id, '{"v1":"7","v2":"25"}'),
(@pergunta_id, '{"v1":"9","v2":"15"}'),
(@pergunta_id, '{"v1":"8","v2":"10"}'),
(@pergunta_id, '{"v1":"6","v2":"10"}'),
(@pergunta_id, '{"v1":"12","v2":"13"}'),
(@pergunta_id, '{"v1":"7","v2":"10"}'),
(@pergunta_id, '{"v1":"9","v2":"41"}'),
(@pergunta_id, '{"v1":"15","v2":"17"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(1141, '{"alt_c":"4, maior","alt_2":"4, menor","alt_3":"5, igual","alt_4":"6, maior"}'),
(1142, '{"alt_c":"12, maior","alt_2":"12, menor","alt_3":"10, maior","alt_4":"11, menor"}'),
(1143, '{"alt_c":"24, maior","alt_2":"23, menor","alt_3":"25, igual","alt_4":"20, menor"}'),
(1144, '{"alt_c":"12, maior","alt_2":"10, menor","alt_3":"13, maior","alt_4":"8, menor"}'),
(1145, '{"alt_c":"6, menor","alt_2":"8, igual","alt_3":"7, menor","alt_4":"9, maior"}'),
(1146, '{"alt_c":"8, maior","alt_2":"7, menor","alt_3":"9, maior","alt_4":"10, igual"}'),
(1147, '{"alt_c":"5, menor","alt_2":"10, maior","alt_3":"6, menor","alt_4":"7, menor"}'),
(1148, '{"alt_c":"7, igual","alt_2":"8, menor","alt_3":"9, maior","alt_4":"6, menor"}'),
(1149, '{"alt_c":"40, maior","alt_2":"39, menor","alt_3":"38, menor","alt_4":"41, igual"}'),
(1150, '{"alt_c":"8, menor","alt_2":"9, igual","alt_3":"10, maior","alt_4":"7, menor"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(1151, '{"alt_c":"4, maior","alt_2":"4, menor","alt_3":"5, igual","alt_4":"6, maior"}'),
(1152, '{"alt_c":"12, maior","alt_2":"12, menor","alt_3":"10, maior","alt_4":"11, menor"}'),
(1153, '{"alt_c":"24, maior","alt_2":"23, menor","alt_3":"25, igual","alt_4":"20, menor"}'),
(1154, '{"alt_c":"12, maior","alt_2":"10, menor","alt_3":"13, maior","alt_4":"8, menor"}'),
(1155, '{"alt_c":"6, menor","alt_2":"8, igual","alt_3":"7, menor","alt_4":"9, maior"}'),
(1156, '{"alt_c":"8, maior","alt_2":"7, menor","alt_3":"9, maior","alt_4":"10, igual"}'),
(1157, '{"alt_c":"5, menor","alt_2":"10, maior","alt_3":"6, menor","alt_4":"7, menor"}'),
(1158, '{"alt_c":"7, igual","alt_2":"8, menor","alt_3":"9, maior","alt_4":"6, menor"}'),
(1159, '{"alt_c":"40, maior","alt_2":"39, menor","alt_3":"38, menor","alt_4":"41, igual"}'),
(1160, '{"alt_c":"8, menor","alt_2":"9, igual","alt_3":"10, maior","alt_4":"7, menor"}');

-- ===================== Bloco de variáveis e Alternativas =====================

-- Variáveis 1151–1160
INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"0"}'),
(@pergunta_id, '{"v1":"π/6"}'),
(@pergunta_id, '{"v1":"π/4"}'),
(@pergunta_id, '{"v1":"π/3"}'),
(@pergunta_id, '{"v1":"π/2"}'),
(@pergunta_id, '{"v1":"π"}'),
(@pergunta_id, '{"v1":"3π/2"}'),
(@pergunta_id, '{"v1":"2π"}'),
(@pergunta_id, '{"v1":"5π/6"}'),
(@pergunta_id, '{"v1":"7π/6"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(1151, '{"alt_c":"4, maior","alt_2":"4, menor","alt_3":"5, igual","alt_4":"6, maior"}'),
(1152, '{"alt_c":"12, maior","alt_2":"12, menor","alt_3":"10, maior","alt_4":"11, menor"}'),
(1153, '{"alt_c":"24, maior","alt_2":"23, menor","alt_3":"25, igual","alt_4":"20, menor"}'),
(1154, '{"alt_c":"12, maior","alt_2":"10, menor","alt_3":"13, maior","alt_4":"8, menor"}'),
(1155, '{"alt_c":"6, menor","alt_2":"8, igual","alt_3":"7, menor","alt_4":"9, maior"}'),
(1156, '{"alt_c":"8, maior","alt_2":"7, menor","alt_3":"9, maior","alt_4":"10, igual"}'),
(1157, '{"alt_c":"5, menor","alt_2":"10, maior","alt_3":"6, menor","alt_4":"7, menor"}'),
(1158, '{"alt_c":"7, igual","alt_2":"8, menor","alt_3":"9, maior","alt_4":"6, menor"}'),
(1159, '{"alt_c":"40, maior","alt_2":"39, menor","alt_3":"38, menor","alt_4":"41, igual"}'),
(1160, '{"alt_c":"8, menor","alt_2":"9, igual","alt_3":"10, maior","alt_4":"7, menor"}');

-- Variáveis 1161–1170
INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"0"}'),
(@pergunta_id, '{"v1":"π/6"}'),
(@pergunta_id, '{"v1":"π/4"}'),
(@pergunta_id, '{"v1":"π/3"}'),
(@pergunta_id, '{"v1":"π/2"}'),
(@pergunta_id, '{"v1":"π"}'),
(@pergunta_id, '{"v1":"3π/2"}'),
(@pergunta_id, '{"v1":"2π"}'),
(@pergunta_id, '{"v1":"5π/6"}'),
(@pergunta_id, '{"v1":"7π/6"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(1161, '{"alt_c":"4, maior","alt_2":"4, menor","alt_3":"5, igual","alt_4":"6, maior"}'),
(1162, '{"alt_c":"12, maior","alt_2":"12, menor","alt_3":"10, maior","alt_4":"11, menor"}'),
(1163, '{"alt_c":"24, maior","alt_2":"23, menor","alt_3":"25, igual","alt_4":"20, menor"}'),
(1164, '{"alt_c":"12, maior","alt_2":"10, menor","alt_3":"13, maior","alt_4":"8, menor"}'),
(1165, '{"alt_c":"6, menor","alt_2":"8, igual","alt_3":"7, menor","alt_4":"9, maior"}'),
(1166, '{"alt_c":"8, maior","alt_2":"7, menor","alt_3":"9, maior","alt_4":"10, igual"}'),
(1167, '{"alt_c":"5, menor","alt_2":"10, maior","alt_3":"6, menor","alt_4":"7, menor"}'),
(1168, '{"alt_c":"7, igual","alt_2":"8, menor","alt_3":"9, maior","alt_4":"6, menor"}'),
(1169, '{"alt_c":"40, maior","alt_2":"39, menor","alt_3":"38, menor","alt_4":"41, igual"}'),
(1170, '{"alt_c":"8, menor","alt_2":"9, igual","alt_3":"10, maior","alt_4":"7, menor"}');

-- Variáveis 1171–1180
INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"0"}'),
(@pergunta_id, '{"v1":"π/6"}'),
(@pergunta_id, '{"v1":"π/4"}'),
(@pergunta_id, '{"v1":"π/3"}'),
(@pergunta_id, '{"v1":"π/2"}'),
(@pergunta_id, '{"v1":"π"}'),
(@pergunta_id, '{"v1":"3π/2"}'),
(@pergunta_id, '{"v1":"2π"}'),
(@pergunta_id, '{"v1":"5π/6"}'),
(@pergunta_id, '{"v1":"7π/6"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(1171, '{"alt_c":"4, maior","alt_2":"4, menor","alt_3":"5, igual","alt_4":"6, maior"}'),
(1172, '{"alt_c":"12, maior","alt_2":"12, menor","alt_3":"10, maior","alt_4":"11, menor"}'),
(1173, '{"alt_c":"24, maior","alt_2":"23, menor","alt_3":"25, igual","alt_4":"20, menor"}'),
(1174, '{"alt_c":"12, maior","alt_2":"10, menor","alt_3":"13, maior","alt_4":"8, menor"}'),
(1175, '{"alt_c":"6, menor","alt_2":"8, igual","alt_3":"7, menor","alt_4":"9, maior"}'),
(1176, '{"alt_c":"8, maior","alt_2":"7, menor","alt_3":"9, maior","alt_4":"10, igual"}'),
(1177, '{"alt_c":"5, menor","alt_2":"10, maior","alt_3":"6, menor","alt_4":"7, menor"}'),
(1178, '{"alt_c":"7, igual","alt_2":"8, menor","alt_3":"9, maior","alt_4":"6, menor"}'),
(1179, '{"alt_c":"40, maior","alt_2":"39, menor","alt_3":"38, menor","alt_4":"41, igual"}'),
(1180, '{"alt_c":"8, menor","alt_2":"9, igual","alt_3":"10, maior","alt_4":"7, menor"}');

-- Variáveis 1181–1190
INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"0"}'),
(@pergunta_id, '{"v1":"π/6"}'),
(@pergunta_id, '{"v1":"π/4"}'),
(@pergunta_id, '{"v1":"π/3"}'),
(@pergunta_id, '{"v1":"π/2"}'),
(@pergunta_id, '{"v1":"π"}'),
(@pergunta_id, '{"v1":"3π/2"}'),
(@pergunta_id, '{"v1":"2π"}'),
(@pergunta_id, '{"v1":"5π/6"}'),
(@pergunta_id, '{"v1":"7π/6"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(1181, '{"alt_c":"4, maior","alt_2":"4, menor","alt_3":"5, igual","alt_4":"6, maior"}'),
(1182, '{"alt_c":"12, maior","alt_2":"12, menor","alt_3":"10, maior","alt_4":"11, menor"}'),
(1183, '{"alt_c":"24, maior","alt_2":"23, menor","alt_3":"25, igual","alt_4":"20, menor"}'),
(1184, '{"alt_c":"12, maior","alt_2":"10, menor","alt_3":"13, maior","alt_4":"8, menor"}'),
(1185, '{"alt_c":"6, menor","alt_2":"8, igual","alt_3":"7, menor","alt_4":"9, maior"}'),
(1186, '{"alt_c":"8, maior","alt_2":"7, menor","alt_3":"9, maior","alt_4":"10, igual"}'),
(1187, '{"alt_c":"5, menor","alt_2":"10, maior","alt_3":"6, menor","alt_4":"7, menor"}'),
(1188, '{"alt_c":"7, igual","alt_2":"8, menor","alt_3":"9, maior","alt_4":"6, menor"}'),
(1189, '{"alt_c":"40, maior","alt_2":"39, menor","alt_3":"38, menor","alt_4":"41, igual"}'),
(1190, '{"alt_c":"8, menor","alt_2":"9, igual","alt_3":"10, maior","alt_4":"7, menor"}');

-- Variáveis 1191–1200
INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"0"}'),
(@pergunta_id, '{"v1":"π/6"}'),
(@pergunta_id, '{"v1":"π/4"}'),
(@pergunta_id, '{"v1":"π/3"}'),
(@pergunta_id, '{"v1":"π/2"}'),
(@pergunta_id, '{"v1":"π"}'),
(@pergunta_id, '{"v1":"3π/2"}'),
(@pergunta_id, '{"v1":"2π"}'),
(@pergunta_id, '{"v1":"5π/6"}'),
(@pergunta_id, '{"v1":"7π/6"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(1191, '{"alt_c":"4, maior","alt_2":"4, menor","alt_3":"5, igual","alt_4":"6, maior"}'),
(1192, '{"alt_c":"12, maior","alt_2":"12, menor","alt_3":"10, maior","alt_4":"11, menor"}'),
(1193, '{"alt_c":"24, maior","alt_2":"23, menor","alt_3":"25, igual","alt_4":"20, menor"}'),
(1194, '{"alt_c":"12, maior","alt_2":"10, menor","alt_3":"13, maior","alt_4":"8, menor"}'),
(1195, '{"alt_c":"6, menor","alt_2":"8, igual","alt_3":"7, menor","alt_4":"9, maior"}'),
(1196, '{"alt_c":"8, maior","alt_2":"7, menor","alt_3":"9, maior","alt_4":"10, igual"}'),
(1197, '{"alt_c":"5, menor","alt_2":"10, maior","alt_3":"6, menor","alt_4":"7, menor"}'),
(1198, '{"alt_c":"7, igual","alt_2":"8, menor","alt_3":"9, maior","alt_4":"6, menor"}'),
(1199, '{"alt_c":"40, maior","alt_2":"39, menor","alt_3":"38, menor","alt_4":"41, igual"}'),
(1200, '{"alt_c":"8, menor","alt_2":"9, igual","alt_3":"10, maior","alt_4":"7, menor"}');



-- ==========================================
-- PERGUNTA 1
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (24, 'Qual é o valor de sen( v1 )?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"0"}'),
(@pergunta_id, '{"v1":"π/6"}'),
(@pergunta_id, '{"v1":"π/4"}'),
(@pergunta_id, '{"v1":"π/3"}'),
(@pergunta_id, '{"v1":"π/2"}'),
(@pergunta_id, '{"v1":"π"}'),
(@pergunta_id, '{"v1":"3π/2"}'),
(@pergunta_id, '{"v1":"2π"}'),
(@pergunta_id, '{"v1":"5π/6"}'),	
(@pergunta_id, '{"v1":"7π/6"}');
SELECT id, texto FROM Perguntas WHERE materia_id = 1;
INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(1201, '{"alt_c":"0","alt_2":"1","alt_3":"-1","alt_4":"√3/2"}'),
(1202, '{"alt_c":"1/2","alt_2":"√3/2","alt_3":"0","alt_4":"-1/2"}'),
(1203, '{"alt_c":"√2/2","alt_2":"1/2","alt_3":"√3/2","alt_4":"0"}'),
(1204, '{"alt_c":"√3/2","alt_2":"1/2","alt_3":"√2/2","alt_4":"-√3/2"}'),
(1205, '{"alt_c":"1","alt_2":"0","alt_3":"-1","alt_4":"√3/2"}'),
(1206, '{"alt_c":"0","alt_2":"1","alt_3":"-1","alt_4":"√3/2"}'),
(1207, '{"alt_c":"-1","alt_2":"0","alt_3":"1","alt_4":"√2/2"}'),
(1208, '{"alt_c":"0","alt_2":"1","alt_3":"-1","alt_4":"√3/2"}'),
(1209, '{"alt_c":"1/2","alt_2":"√3/2","alt_3":"0","alt_4":"-1/2"}'),
(1210, '{"alt_c":"-1/2","alt_2":"1/2","alt_3":"√3/2","alt_4":"-√3/2"}');

-- ==========================================
-- PERGUNTA 2
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (24, 'Qual é o valor de cos( v1 )?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"0"}'),
(@pergunta_id, '{"v1":"π/6"}'),
(@pergunta_id, '{"v1":"π/4"}'),
(@pergunta_id, '{"v1":"π/3"}'),
(@pergunta_id, '{"v1":"π/2"}'),
(@pergunta_id, '{"v1":"π"}'),
(@pergunta_id, '{"v1":"3π/2"}'),
(@pergunta_id, '{"v1":"2π"}'),
(@pergunta_id, '{"v1":"5π/6"}'),
(@pergunta_id, '{"v1":"7π/6"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(1211, '{"alt_c":"1","alt_2":"0","alt_3":"-1","alt_4":"√3/2"}'),
(1212, '{"alt_c":"√3/2","alt_2":"1/2","alt_3":"0","alt_4":"-√3/2"}'),
(1213, '{"alt_c":"√2/2","alt_2":"1/2","alt_3":"√3/2","alt_4":"0"}'),
(1214, '{"alt_c":"1/2","alt_2":"√3/2","alt_3":"-1/2","alt_4":"0"}'),
(1215, '{"alt_c":"0","alt_2":"1","alt_3":"-1","alt_4":"√3/2"}'),
(1216, '{"alt_c":"-1","alt_2":"1","alt_3":"0","alt_4":"-√2/2"}'),
(1217, '{"alt_c":"0","alt_2":"1","alt_3":"-1","alt_4":"√3/2"}'),
(1218, '{"alt_c":"1","alt_2":"0","alt_3":"-1","alt_4":"√3/2"}'),
(1219, '{"alt_c":"-√3/2","alt_2":"√3/2","alt_3":"-1/2","alt_4":"1/2"}'),
(1220, '{"alt_c":"-√3/2","alt_2":"√3/2","alt_3":"1/2","alt_4":"-1/2"}');

-- ==========================================
-- PERGUNTA 3
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (24, 'Em qual quadrante está o ângulo v1 radianos?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"π/4"}'),
(@pergunta_id, '{"v1":"2π/3"}'),
(@pergunta_id, '{"v1":"5π/4"}'),
(@pergunta_id, '{"v1":"7π/4"}'),
(@pergunta_id, '{"v1":"π/2"}'),
(@pergunta_id, '{"v1":"3π/2"}'),
(@pergunta_id, '{"v1":"π"}'),
(@pergunta_id, '{"v1":"11π/6"}'),
(@pergunta_id, '{"v1":"5π/3"}'),
(@pergunta_id, '{"v1":"4π/3"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(1221, '{"alt_c":"1º Quadrante","alt_2":"2º Quadrante","alt_3":"3º Quadrante","alt_4":"4º Quadrante"}'),
(1222, '{"alt_c":"2º Quadrante","alt_2":"1º Quadrante","alt_3":"3º Quadrante","alt_4":"4º Quadrante"}'),
(1223, '{"alt_c":"3º Quadrante","alt_2":"2º Quadrante","alt_3":"1º Quadrante","alt_4":"4º Quadrante"}'),
(1224, '{"alt_c":"4º Quadrante","alt_2":"3º Quadrante","alt_3":"1º Quadrante","alt_4":"2º Quadrante"}'),
(1225, '{"alt_c":"Eixo Y positivo","alt_2":"Eixo X positivo","alt_3":"Eixo Y negativo","alt_4":"Eixo X negativo"}'),
(1226, '{"alt_c":"Eixo Y negativo","alt_2":"Eixo X positivo","alt_3":"Eixo Y positivo","alt_4":"Eixo X negativo"}'),
(1227, '{"alt_c":"Eixo X negativo","alt_2":"Eixo X positivo","alt_3":"Eixo Y positivo","alt_4":"Eixo Y negativo"}'),
(1228, '{"alt_c":"4º Quadrante","alt_2":"3º Quadrante","alt_3":"2º Quadrante","alt_4":"1º Quadrante"}'),
(1229, '{"alt_c":"4º Quadrante","alt_2":"3º Quadrante","alt_3":"2º Quadrante","alt_4":"1º Quadrante"}'),
(1230, '{"alt_c":"3º Quadrante","alt_2":"2º Quadrante","alt_3":"1º Quadrante","alt_4":"4º Quadrante"}');

-- ==========================================
-- PERGUNTA 4
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (24, 'Determine o sinal do seno e do cosseno no ângulo v1 radianos.');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"π/6"}'),
(@pergunta_id, '{"v1":"2π/3"}'),
(@pergunta_id, '{"v1":"5π/4"}'),
(@pergunta_id, '{"v1":"7π/4"}'),
(@pergunta_id, '{"v1":"π/2"}'),
(@pergunta_id, '{"v1":"3π/2"}'),
(@pergunta_id, '{"v1":"π"}'),
(@pergunta_id, '{"v1":"11π/6"}'),
(@pergunta_id, '{"v1":"5π/3"}'),
(@pergunta_id, '{"v1":"4π/3"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(1231, '{"alt_c":"sen>0, cos>0","alt_2":"sen>0, cos<0","alt_3":"sen<0, cos>0","alt_4":"sen<0, cos<0"}'),
(1232, '{"alt_c":"sen>0, cos<0","alt_2":"sen>0, cos>0","alt_3":"sen<0, cos>0","alt_4":"sen<0, cos<0"}'),
(1233, '{"alt_c":"sen<0, cos<0","alt_2":"sen>0, cos>0","alt_3":"sen>0, cos<0","alt_4":"sen<0, cos>0"}'),
(1234, '{"alt_c":"sen<0, cos>0","alt_2":"sen>0, cos>0","alt_3":"sen<0, cos<0","alt_4":"sen>0, cos<0"}'),
(1235, '{"alt_c":"sen>0, cos=0","alt_2":"sen=0, cos>0","alt_3":"sen<0, cos=0","alt_4":"sen=0, cos<0"}'),
(1236, '{"alt_c":"sen<0, cos=0","alt_2":"sen>0, cos=0","alt_3":"sen=0, cos>0","alt_4":"sen=0, cos<0"}'),
(1237, '{"alt_c":"sen=0, cos<0","alt_2":"sen>0, cos>0","alt_3":"sen>0, cos<0","alt_4":"sen<0, cos>0"}'),
(1238, '{"alt_c":"sen<0, cos>0","alt_2":"sen>0, cos>0","alt_3":"sen<0, cos<0","alt_4":"sen>0, cos<0"}'),
(1239, '{"alt_c":"sen<0, cos>0","alt_2":"sen>0, cos>0","alt_3":"sen<0, cos<0","alt_4":"sen>0, cos<0"}'),
(1240, '{"alt_c":"sen<0, cos<0","alt_2":"sen>0, cos>0","alt_3":"sen<0, cos>0","alt_4":"sen>0, cos<0"}');

-- ==========================================
-- PERGUNTA 5
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (24, 'Qual é o valor de tan( v1 )?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"0"}'),
(@pergunta_id, '{"v1":"π/6"}'),
(@pergunta_id, '{"v1":"π/4"}'),
(@pergunta_id, '{"v1":"π/3"}'),
(@pergunta_id, '{"v1":"π/2"}'),
(@pergunta_id, '{"v1":"π"}'),
(@pergunta_id, '{"v1":"3π/2"}'),
(@pergunta_id, '{"v1":"2π"}'),
(@pergunta_id, '{"v1":"5π/4"}'),
(@pergunta_id, '{"v1":"7π/4"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(1241, '{"alt_c":"0","alt_2":"1","alt_3":"√3","alt_4":"1/√3"}'),
(1242, '{"alt_c":"1/√3","alt_2":"√3","alt_3":"0","alt_4":"1"}'),
(1243, '{"alt_c":"1","alt_2":"√3","alt_3":"0","alt_4":"1/√3"}'),
(1244, '{"alt_c":"√3","alt_2":"1","alt_3":"0","alt_4":"1/√3"}'),
(1245, '{"alt_c":"Indefinida","alt_2":"0","alt_3":"1","alt_4":"√3"}'),
(1246, '{"alt_c":"0","alt_2":"1","alt_3":"√3","alt_4":"1/√3"}'),
(1247, '{"alt_c":"Indefinida","alt_2":"0","alt_3":"1","alt_4":"√3"}'),
(1248, '{"alt_c":"0","alt_2":"1","alt_3":"√3","alt_4":"1/√3"}'),
(1249, '{"alt_c":"1","alt_2":"-1","alt_3":"√3","alt_4":"1/√3"}'),
(1250, '{"alt_c":"-1","alt_2":"1","alt_3":"√3","alt_4":"1/√3"}');

-- ==========================================
-- PERGUNTA 1
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (25, 'Sabendo que sen²(v1) + cos²(v1) = k, qual é o valor de k?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"π/6"}'),
(@pergunta_id, '{"v1":"π/4"}'),
(@pergunta_id, '{"v1":"π/3"}'),
(@pergunta_id, '{"v1":"π/2"}'),
(@pergunta_id, '{"v1":"0"}'),
(@pergunta_id, '{"v1":"π"}'),
(@pergunta_id, '{"v1":"2π"}'),
(@pergunta_id, '{"v1":"5π/6"}'),
(@pergunta_id, '{"v1":"7π/4"}'),
(@pergunta_id, '{"v1":"11π/6"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(1251, '{"alt_c":"1","alt_2":"0","alt_3":"2","alt_4":"1/2"}'),
(1252, '{"alt_c":"1","alt_2":"0","alt_3":"2","alt_4":"1/2"}'),
(1253, '{"alt_c":"1","alt_2":"0","alt_3":"2","alt_4":"1/2"}'),
(1254, '{"alt_c":"1","alt_2":"0","alt_3":"2","alt_4":"1/2"}'),
(1255, '{"alt_c":"1","alt_2":"0","alt_3":"2","alt_4":"1/2"}'),
(1256, '{"alt_c":"1","alt_2":"0","alt_3":"2","alt_4":"1/2"}'),
(1257, '{"alt_c":"1","alt_2":"0","alt_3":"2","alt_4":"1/2"}'),
(1258, '{"alt_c":"1","alt_2":"0","alt_3":"2","alt_4":"1/2"}'),
(1259, '{"alt_c":"1","alt_2":"0","alt_3":"2","alt_4":"1/2"}'),
(1260, '{"alt_c":"1","alt_2":"0","alt_3":"2","alt_4":"1/2"}');

-- ==========================================
-- PERGUNTA 2
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (25, 'Sabendo que tan(v1) = sen(v1)/cos(v1), qual é o valor de tan(v1)?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"π/6"}'),
(@pergunta_id, '{"v1":"π/4"}'),
(@pergunta_id, '{"v1":"π/3"}'),
(@pergunta_id, '{"v1":"π/2"}'),
(@pergunta_id, '{"v1":"π"}'),
(@pergunta_id, '{"v1":"3π/2"}'),
(@pergunta_id, '{"v1":"5π/6"}'),
(@pergunta_id, '{"v1":"7π/4"}'),
(@pergunta_id, '{"v1":"11π/6"}'),
(@pergunta_id, '{"v1":"2π"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(1261, '{"alt_c":"1/√3","alt_2":"√3","alt_3":"1","alt_4":"0"}'),
(1262, '{"alt_c":"1","alt_2":"0","alt_3":"√3","alt_4":"1/√3"}'),
(1263, '{"alt_c":"√3","alt_2":"1","alt_3":"0","alt_4":"1/√3"}'),
(1264, '{"alt_c":"Indefinida","alt_2":"0","alt_3":"1","alt_4":"√3"}'),
(1265, '{"alt_c":"0","alt_2":"1","alt_3":"√3","alt_4":"1/√3"}'),
(1266, '{"alt_c":"Indefinida","alt_2":"0","alt_3":"1","alt_4":"√3"}'),
(1267, '{"alt_c":"-1/√3","alt_2":"1/√3","alt_3":"√3","alt_4":"-√3"}'),
(1268, '{"alt_c":"-1","alt_2":"1","alt_3":"√3","alt_4":"0"}'),
(1269, '{"alt_c":"-1/√3","alt_2":"√3","alt_3":"1","alt_4":"0"}'),
(1270, '{"alt_c":"0","alt_2":"1","alt_3":"√3","alt_4":"1/√3"}');

-- ==========================================
-- PERGUNTA 3
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (25, 'Se sen(v1) = a, qual é o valor de cos(π/2 - v1)?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"π/6"}'),
(@pergunta_id, '{"v1":"π/4"}'),
(@pergunta_id, '{"v1":"π/3"}'),
(@pergunta_id, '{"v1":"π/2"}'),
(@pergunta_id, '{"v1":"π"}'),
(@pergunta_id, '{"v1":"2π/3"}'),
(@pergunta_id, '{"v1":"3π/4"}'),
(@pergunta_id, '{"v1":"5π/6"}'),
(@pergunta_id, '{"v1":"7π/4"}'),
(@pergunta_id, '{"v1":"11π/6"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(1271, '{"alt_c":"a","alt_2":"-a","alt_3":"0","alt_4":"1"}'),
(1272, '{"alt_c":"a","alt_2":"-a","alt_3":"0","alt_4":"1"}'),
(1273, '{"alt_c":"a","alt_2":"-a","alt_3":"0","alt_4":"1"}'),
(1274, '{"alt_c":"a","alt_2":"-a","alt_3":"0","alt_4":"1"}'),
(1275, '{"alt_c":"a","alt_2":"-a","alt_3":"0","alt_4":"1"}'),
(1276, '{"alt_c":"a","alt_2":"-a","alt_3":"0","alt_4":"1"}'),
(1277, '{"alt_c":"a","alt_2":"-a","alt_3":"0","alt_4":"1"}'),
(1278, '{"alt_c":"a","alt_2":"-a","alt_3":"0","alt_4":"1"}'),
(1279, '{"alt_c":"a","alt_2":"-a","alt_3":"0","alt_4":"1"}'),
(1280, '{"alt_c":"a","alt_2":"-a","alt_3":"0","alt_4":"1"}');

-- ==========================================
-- PERGUNTA 4 (corrigida)
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (25, 'Sabendo que sen(x) = v1, determine o valor de cos(x).');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"3/5"}'),
(@pergunta_id, '{"v1":"4/5"}'),
(@pergunta_id, '{"v1":"5/13"}'),
(@pergunta_id, '{"v1":"7/25"}'),
(@pergunta_id, '{"v1":"8/17"}'),
(@pergunta_id, '{"v1":"12/13"}'),
(@pergunta_id, '{"v1":"15/17"}'),
(@pergunta_id, '{"v1":"24/25"}'),
(@pergunta_id, '{"v1":"7/25"}'),
(@pergunta_id, '{"v1":"8/17"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(1281, '{"alt_c":"4/5","alt_2":"3/5","alt_3":"5/3","alt_4":"1"}'),
(1282, '{"alt_c":"3/5","alt_2":"4/5","alt_3":"5/3","alt_4":"1"}'),
(1283, '{"alt_c":"12/13","alt_2":"5/13","alt_3":"13/5","alt_4":"1"}'),
(1284, '{"alt_c":"24/25","alt_2":"7/25","alt_3":"25/7","alt_4":"1"}'),
(1285, '{"alt_c":"15/17","alt_2":"8/17","alt_3":"17/8","alt_4":"1"}'),
(1286, '{"alt_c":"5/13","alt_2":"12/13","alt_3":"13/12","alt_4":"1"}'),
(1287, '{"alt_c":"8/17","alt_2":"15/17","alt_3":"17/15","alt_4":"1"}'),
(1288, '{"alt_c":"7/25","alt_2":"24/25","alt_3":"25/24","alt_4":"1"}'),
(1289, '{"alt_c":"24/25","alt_2":"7/25","alt_3":"25/7","alt_4":"1"}'),
(1290, '{"alt_c":"15/17","alt_2":"8/17","alt_3":"17/8","alt_4":"1"}');

-- ==========================================
-- PERGUNTA 5 (corrigida)
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (25, 'Qual dos ângulos a seguir é equivalente a π/4 em radianos (isto é, possui o mesmo valor de tangente)?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"π/4"}'),
(@pergunta_id, '{"v1":"5π/4"}'),
(@pergunta_id, '{"v1":"9π/4"}'),
(@pergunta_id, '{"v1":"13π/4"}'),
(@pergunta_id, '{"v1":"17π/4"}'),
(@pergunta_id, '{"v1":"21π/4"}'),
(@pergunta_id, '{"v1":"25π/4"}'),
(@pergunta_id, '{"v1":"29π/4"}'),
(@pergunta_id, '{"v1":"33π/4"}'),
(@pergunta_id, '{"v1":"37π/4"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(1291, '{"alt_c":"π/4","alt_2":"π/2","alt_3":"π","alt_4":"3π/2"}'),
(1292, '{"alt_c":"5π/4","alt_2":"π/2","alt_3":"π","alt_4":"3π/2"}'),
(1293, '{"alt_c":"9π/4","alt_2":"π/2","alt_3":"π","alt_4":"3π/2"}'),
(1294, '{"alt_c":"13π/4","alt_2":"π/2","alt_3":"π","alt_4":"3π/2"}'),
(1295, '{"alt_c":"17π/4","alt_2":"π/2","alt_3":"π","alt_4":"3π/2"}'),
(1296, '{"alt_c":"21π/4","alt_2":"π/2","alt_3":"π","alt_4":"3π/2"}'),
(1297, '{"alt_c":"25π/4","alt_2":"π/2","alt_3":"π","alt_4":"3π/2"}'),
(1298, '{"alt_c":"29π/4","alt_2":"π/2","alt_3":"π","alt_4":"3π/2"}'),
(1299, '{"alt_c":"33π/4","alt_2":"π/2","alt_3":"π","alt_4":"3π/2"}'),
(1300, '{"alt_c":"37π/4","alt_2":"π/2","alt_3":"π","alt_4":"3π/2"}');

-- ==========================================
-- PERGUNTA 1
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (26, 'Qual é o valor exato de sen( v1 )?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"π/6"}'),
(@pergunta_id, '{"v1":"π/4"}'),
(@pergunta_id, '{"v1":"π/3"}'),
(@pergunta_id, '{"v1":"π/2"}'),
(@pergunta_id, '{"v1":"0"}'),
(@pergunta_id, '{"v1":"5π/6"}'),
(@pergunta_id, '{"v1":"7π/6"}'),
(@pergunta_id, '{"v1":"4π/3"}'),
(@pergunta_id, '{"v1":"3π/2"}'),
(@pergunta_id, '{"v1":"2π"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(1301, '{"alt_c":"1/2","alt_2":"√3/2","alt_3":"√2/2","alt_4":"0"}'),
(1302, '{"alt_c":"√2/2","alt_2":"1/2","alt_3":"√3/2","alt_4":"0"}'),
(1303, '{"alt_c":"√3/2","alt_2":"1/2","alt_3":"√2/2","alt_4":"0"}'),
(1304, '{"alt_c":"1","alt_2":"√3/2","alt_3":"√2/2","alt_4":"1/2"}'),
(1305, '{"alt_c":"0","alt_2":"1","alt_3":"√2/2","alt_4":"√3/2"}'),
(1306, '{"alt_c":"1/2","alt_2":"√3/2","alt_3":"-1/2","alt_4":"-√3/2"}'),
(1307, '{"alt_c":"-1/2","alt_2":"√3/2","alt_3":"1/2","alt_4":"-√3/2"}'),
(1308, '{"alt_c":"-√3/2","alt_2":"√3/2","alt_3":"-1/2","alt_4":"1/2"}'),
(1309, '{"alt_c":"-1","alt_2":"0","alt_3":"1","alt_4":"√3/2"}'),
(1310, '{"alt_c":"0","alt_2":"1","alt_3":"-1","alt_4":"√3/2"}');

-- ==========================================
-- PERGUNTA 2
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (26, 'Qual é o valor exato de cos( v1 )?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"π/6"}'),
(@pergunta_id, '{"v1":"π/4"}'),
(@pergunta_id, '{"v1":"π/3"}'),
(@pergunta_id, '{"v1":"π/2"}'),
(@pergunta_id, '{"v1":"0"}'),
(@pergunta_id, '{"v1":"5π/6"}'),
(@pergunta_id, '{"v1":"7π/6"}'),
(@pergunta_id, '{"v1":"4π/3"}'),
(@pergunta_id, '{"v1":"3π/2"}'),
(@pergunta_id, '{"v1":"2π"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(1311, '{"alt_c":"√3/2","alt_2":"1/2","alt_3":"√2/2","alt_4":"0"}'),
(1312, '{"alt_c":"√2/2","alt_2":"√3/2","alt_3":"1/2","alt_4":"0"}'),
(1313, '{"alt_c":"1/2","alt_2":"√3/2","alt_3":"√2/2","alt_4":"0"}'),
(1314, '{"alt_c":"0","alt_2":"1","alt_3":"√3/2","alt_4":"1/2"}'),
(1315, '{"alt_c":"1","alt_2":"0","alt_3":"√2/2","alt_4":"√3/2"}'),
(1316, '{"alt_c":"-√3/2","alt_2":"√3/2","alt_3":"1/2","alt_4":"-1/2"}'),
(1317, '{"alt_c":"-√3/2","alt_2":"√3/2","alt_3":"-1/2","alt_4":"1/2"}'),
(1318, '{"alt_c":"-1/2","alt_2":"√3/2","alt_3":"1/2","alt_4":"-√3/2"}'),
(1319, '{"alt_c":"0","alt_2":"1","alt_3":"-1","alt_4":"√3/2"}'),
(1320, '{"alt_c":"1","alt_2":"0","alt_3":"-1","alt_4":"√3/2"}');

-- ==========================================
-- PERGUNTA 3
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (26, 'Qual é o valor exato de tan( v1 )?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"π/6"}'),
(@pergunta_id, '{"v1":"π/4"}'),
(@pergunta_id, '{"v1":"π/3"}'),
(@pergunta_id, '{"v1":"π/2"}'),
(@pergunta_id, '{"v1":"0"}'),
(@pergunta_id, '{"v1":"5π/6"}'),
(@pergunta_id, '{"v1":"7π/6"}'),
(@pergunta_id, '{"v1":"4π/3"}'),
(@pergunta_id, '{"v1":"3π/2"}'),
(@pergunta_id, '{"v1":"2π"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(1321, '{"alt_c":"1/√3","alt_2":"√3","alt_3":"1","alt_4":"0"}'),
(1322, '{"alt_c":"1","alt_2":"√3","alt_3":"1/√3","alt_4":"0"}'),
(1323, '{"alt_c":"√3","alt_2":"1/√3","alt_3":"1","alt_4":"0"}'),
(1324, '{"alt_c":"Indefinida","alt_2":"1","alt_3":"√3","alt_4":"1/√3"}'),
(1325, '{"alt_c":"0","alt_2":"1","alt_3":"√3","alt_4":"1/√3"}'),
(1326, '{"alt_c":"-1/√3","alt_2":"1/√3","alt_3":"√3","alt_4":"-√3"}'),
(1327, '{"alt_c":"1/√3","alt_2":"√3","alt_3":"-1/√3","alt_4":"-√3"}'),
(1328, '{"alt_c":"√3","alt_2":"-√3","alt_3":"1/√3","alt_4":"-1/√3"}'),
(1329, '{"alt_c":"Indefinida","alt_2":"0","alt_3":"1","alt_4":"√3"}'),
(1330, '{"alt_c":"0","alt_2":"1","alt_3":"√3","alt_4":"1/√3"}');

-- ==========================================
-- PERGUNTA 4
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (26, 'Em um triângulo retângulo de 30°–60°–90°, se o cateto oposto a 30° mede v1, quanto mede a hipotenusa?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"3"}'),
(@pergunta_id, '{"v1":"5"}'),
(@pergunta_id, '{"v1":"7"}'),
(@pergunta_id, '{"v1":"9"}'),
(@pergunta_id, '{"v1":"12"}'),
(@pergunta_id, '{"v1":"15"}'),
(@pergunta_id, '{"v1":"18"}'),
(@pergunta_id, '{"v1":"20"}'),
(@pergunta_id, '{"v1":"24"}'),
(@pergunta_id, '{"v1":"30"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(1331, '{"alt_c":"6","alt_2":"3√3","alt_3":"3√2","alt_4":"9"}'),
(1332, '{"alt_c":"10","alt_2":"5√3","alt_3":"5√2","alt_4":"8"}'),
(1333, '{"alt_c":"14","alt_2":"7√3","alt_3":"7√2","alt_4":"9"}'),
(1334, '{"alt_c":"18","alt_2":"9√3","alt_3":"9√2","alt_4":"12"}'),
(1335, '{"alt_c":"24","alt_2":"12√3","alt_3":"12√2","alt_4":"18"}'),
(1336, '{"alt_c":"30","alt_2":"15√3","alt_3":"15√2","alt_4":"20"}'),
(1337, '{"alt_c":"36","alt_2":"18√3","alt_3":"18√2","alt_4":"27"}'),
(1338, '{"alt_c":"40","alt_2":"20√3","alt_3":"20√2","alt_4":"30"}'),
(1339, '{"alt_c":"48","alt_2":"24√3","alt_3":"24√2","alt_4":"36"}'),
(1340, '{"alt_c":"60","alt_2":"30√3","alt_3":"30√2","alt_4":"45"}');

-- ==========================================
-- PERGUNTA 5
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (26, 'Em um triângulo retângulo de 45°–45°–90°, se o cateto mede v1, quanto mede a hipotenusa?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"2"}'),
(@pergunta_id, '{"v1":"3"}'),
(@pergunta_id, '{"v1":"4"}'),
(@pergunta_id, '{"v1":"5"}'),
(@pergunta_id, '{"v1":"6"}'),
(@pergunta_id, '{"v1":"8"}'),
(@pergunta_id, '{"v1":"9"}'),
(@pergunta_id, '{"v1":"10"}'),
(@pergunta_id, '{"v1":"12"}'),
(@pergunta_id, '{"v1":"15"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(1341, '{"alt_c":"2√2","alt_2":"4","alt_3":"2√3","alt_4":"3"}'),
(1342, '{"alt_c":"3√2","alt_2":"6","alt_3":"3√3","alt_4":"5"}'),
(1343, '{"alt_c":"4√2","alt_2":"8","alt_3":"4√3","alt_4":"6"}'),
(1344, '{"alt_c":"5√2","alt_2":"10","alt_3":"5√3","alt_4":"7"}'),
(1345, '{"alt_c":"6√2","alt_2":"12","alt_3":"6√3","alt_4":"8"}'),
(1346, '{"alt_c":"8√2","alt_2":"16","alt_3":"8√3","alt_4":"10"}'),
(1347, '{"alt_c":"9√2","alt_2":"18","alt_3":"9√3","alt_4":"12"}'),
(1348, '{"alt_c":"10√2","alt_2":"20","alt_3":"10√3","alt_4":"15"}'),
(1349, '{"alt_c":"12√2","alt_2":"24","alt_3":"12√3","alt_4":"18"}'),
(1350, '{"alt_c":"15√2","alt_2":"30","alt_3":"15√3","alt_4":"20"}');

-- ==========================================
-- PERGUNTA 1
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (27, 'O que é uma matriz em Matemática?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"Tabela"}'),
(@pergunta_id, '{"v1":"Retângulo"}'),
(@pergunta_id, '{"v1":"Conjunto de números dispostos em linhas e colunas"}'),
(@pergunta_id, '{"v1":"Sequência numérica"}'),
(@pergunta_id, '{"v1":"Lista de números"}'),
(@pergunta_id, '{"v1":"Arranjo de dados"}'),
(@pergunta_id, '{"v1":"Quadro de valores"}'),
(@pergunta_id, '{"v1":"Representação numérica bidimensional"}'),
(@pergunta_id, '{"v1":"Grade de números"}'),
(@pergunta_id, '{"v1":"Sistema organizado de elementos"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(1351, '{"alt_c":"Conjunto de números dispostos em linhas e colunas","alt_2":"Sequência de números","alt_3":"Um número isolado","alt_4":"Um gráfico"}'),
(1352, '{"alt_c":"Conjunto de números dispostos em linhas e colunas","alt_2":"Sequência de números","alt_3":"Um número isolado","alt_4":"Um gráfico"}'),
(1353, '{"alt_c":"Conjunto de números dispostos em linhas e colunas","alt_2":"Sequência de números","alt_3":"Um número isolado","alt_4":"Um gráfico"}'),
(1354, '{"alt_c":"Conjunto de números dispostos em linhas e colunas","alt_2":"Sequência de números","alt_3":"Um número isolado","alt_4":"Um gráfico"}'),
(1355, '{"alt_c":"Conjunto de números dispostos em linhas e colunas","alt_2":"Sequência de números","alt_3":"Um número isolado","alt_4":"Um gráfico"}'),
(1356, '{"alt_c":"Conjunto de números dispostos em linhas e colunas","alt_2":"Sequência de números","alt_3":"Um número isolado","alt_4":"Um gráfico"}'),
(1357, '{"alt_c":"Conjunto de números dispostos em linhas e colunas","alt_2":"Sequência de números","alt_3":"Um número isolado","alt_4":"Um gráfico"}'),
(1358, '{"alt_c":"Conjunto de números dispostos em linhas e colunas","alt_2":"Sequência de números","alt_3":"Um número isolado","alt_4":"Um gráfico"}'),
(1359, '{"alt_c":"Conjunto de números dispostos em linhas e colunas","alt_2":"Sequência de números","alt_3":"Um número isolado","alt_4":"Um gráfico"}'),
(1360, '{"alt_c":"Conjunto de números dispostos em linhas e colunas","alt_2":"Sequência de números","alt_3":"Um número isolado","alt_4":"Um gráfico"}');

-- ==========================================
-- PERGUNTA 2
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (27, 'Qual das Alternativas representa corretamente a **ordem** de uma matriz?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"linhas"}'),
(@pergunta_id, '{"v1":"colunas"}'),
(@pergunta_id, '{"v1":"linhas e colunas"}'),
(@pergunta_id, '{"v1":"elementos"}'),
(@pergunta_id, '{"v1":"valores"}'),
(@pergunta_id, '{"v1":"tamanho"}'),
(@pergunta_id, '{"v1":"dimensão"}'),
(@pergunta_id, '{"v1":"formato"}'),
(@pergunta_id, '{"v1":"estrutura"}'),
(@pergunta_id, '{"v1":"representação"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(1361, '{"alt_c":"Número de linhas e colunas (m × n)","alt_2":"Número total de elementos","alt_3":"Número de linhas apenas","alt_4":"Número de colunas apenas"}'),
(1362, '{"alt_c":"Número de linhas e colunas (m × n)","alt_2":"Número total de elementos","alt_3":"Número de linhas apenas","alt_4":"Número de colunas apenas"}'),
(1363, '{"alt_c":"Número de linhas e colunas (m × n)","alt_2":"Número total de elementos","alt_3":"Número de linhas apenas","alt_4":"Número de colunas apenas"}'),
(1364, '{"alt_c":"Número de linhas e colunas (m × n)","alt_2":"Número total de elementos","alt_3":"Número de linhas apenas","alt_4":"Número de colunas apenas"}'),
(1365, '{"alt_c":"Número de linhas e colunas (m × n)","alt_2":"Número total de elementos","alt_3":"Número de linhas apenas","alt_4":"Número de colunas apenas"}'),
(1366, '{"alt_c":"Número de linhas e colunas (m × n)","alt_2":"Número total de elementos","alt_3":"Número de linhas apenas","alt_4":"Número de colunas apenas"}'),
(1367, '{"alt_c":"Número de linhas e colunas (m × n)","alt_2":"Número total de elementos","alt_3":"Número de linhas apenas","alt_4":"Número de colunas apenas"}'),
(1368, '{"alt_c":"Número de linhas e colunas (m × n)","alt_2":"Número total de elementos","alt_3":"Número de linhas apenas","alt_4":"Número de colunas apenas"}'),
(1369, '{"alt_c":"Número de linhas e colunas (m × n)","alt_2":"Número total de elementos","alt_3":"Número de linhas apenas","alt_4":"Número de colunas apenas"}'),
(1370, '{"alt_c":"Número de linhas e colunas (m × n)","alt_2":"Número total de elementos","alt_3":"Número de linhas apenas","alt_4":"Número de colunas apenas"}');

-- ==========================================
-- PERGUNTA 3
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (27, 'Uma matriz com 3 linhas e 4 colunas tem ordem:');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"3x4"}'),
(@pergunta_id, '{"v1":"2x4"}'),
(@pergunta_id, '{"v1":"4x3"}'),
(@pergunta_id, '{"v1":"3x3"}'),
(@pergunta_id, '{"v1":"2x3"}'),
(@pergunta_id, '{"v1":"4x4"}'),
(@pergunta_id, '{"v1":"5x2"}'),
(@pergunta_id, '{"v1":"3x2"}'),
(@pergunta_id, '{"v1":"2x2"}'),
(@pergunta_id, '{"v1":"1x3"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(1371, '{"alt_c":"3x4","alt_2":"4x3","alt_3":"3x3","alt_4":"2x4"}'),
(1372, '{"alt_c":"3x4","alt_2":"4x3","alt_3":"3x3","alt_4":"2x4"}'),
(1373, '{"alt_c":"3x4","alt_2":"4x3","alt_3":"3x3","alt_4":"2x4"}'),
(1374, '{"alt_c":"3x4","alt_2":"4x3","alt_3":"3x3","alt_4":"2x4"}'),
(1375, '{"alt_c":"3x4","alt_2":"4x3","alt_3":"3x3","alt_4":"2x4"}'),
(1376, '{"alt_c":"3x4","alt_2":"4x3","alt_3":"3x3","alt_4":"2x4"}'),
(1377, '{"alt_c":"3x4","alt_2":"4x3","alt_3":"3x3","alt_4":"2x4"}'),
(1378, '{"alt_c":"3x4","alt_2":"4x3","alt_3":"3x3","alt_4":"2x4"}'),
(1379, '{"alt_c":"3x4","alt_2":"4x3","alt_3":"3x3","alt_4":"2x4"}'),
(1380, '{"alt_c":"3x4","alt_2":"4x3","alt_3":"3x3","alt_4":"2x4"}');

-- ==========================================
-- PERGUNTA 4
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (27, 'O elemento a<sub>ij</sub> de uma matriz representa:');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
(@pergunta_id, '{"v1":"posição"}'),
(@pergunta_id, '{"v1":"linha e coluna"}'),
(@pergunta_id, '{"v1":"valor da célula"}'),
(@pergunta_id, '{"v1":"endereço do elemento"}'),
(@pergunta_id, '{"v1":"coordenada"}'),
(@pergunta_id, '{"v1":"índice"}'),
(@pergunta_id, '{"v1":"posição i,j"}'),
(@pergunta_id, '{"v1":"elemento identificado"}'),
(@pergunta_id, '{"v1":"par ordenado"}'),
(@pergunta_id, '{"v1":"posição específica"}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(1381, '{"alt_c":"O elemento localizado na linha i e coluna j","alt_2":"O valor máximo da matriz","alt_3":"A soma dos elementos","alt_4":"O número de colunas"}'),
(1382, '{"alt_c":"O elemento localizado na linha i e coluna j","alt_2":"O valor máximo da matriz","alt_3":"A soma dos elementos","alt_4":"O número de colunas"}'),
(1383, '{"alt_c":"O elemento localizado na linha i e coluna j","alt_2":"O valor máximo da matriz","alt_3":"A soma dos elementos","alt_4":"O número de colunas"}'),
(1384, '{"alt_c":"O elemento localizado na linha i e coluna j","alt_2":"O valor máximo da matriz","alt_3":"A soma dos elementos","alt_4":"O número de colunas"}'),
(1385, '{"alt_c":"O elemento localizado na linha i e coluna j","alt_2":"O valor máximo da matriz","alt_3":"A soma dos elementos","alt_4":"O número de colunas"}'),
(1386, '{"alt_c":"O elemento localizado na linha i e coluna j","alt_2":"O valor máximo da matriz","alt_3":"A soma dos elementos","alt_4":"O número de colunas"}'),
(1387, '{"alt_c":"O elemento localizado na linha i e coluna j","alt_2":"O valor máximo da matriz","alt_3":"A soma dos elementos","alt_4":"O número de colunas"}'),
(1388, '{"alt_c":"O elemento localizado na linha i e coluna j","alt_2":"O valor máximo da matriz","alt_3":"A soma dos elementos","alt_4":"O número de colunas"}'),
(1389, '{"alt_c":"O elemento localizado na linha i e coluna j","alt_2":"O valor máximo da matriz","alt_3":"A soma dos elementos","alt_4":"O número de colunas"}'),
(1390, '{"alt_c":"O elemento localizado na linha i e coluna j","alt_2":"O valor máximo da matriz","alt_3":"A soma dos elementos","alt_4":"O número de colunas"}');

-- ==========================================
-- PERGUNTA 5 (corrigida)
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (27, 'Considere a matriz A = [[ v1, v2 ], [ v3, v4 ]]. Qual é a soma de seus elementos?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores)
VALUES
-- Cada variação tem números diferentes
(@pergunta_id, '{"v1":1,"v2":2,"v3":3,"v4":4}'),
(@pergunta_id, '{"v1":2,"v2":3,"v3":4,"v4":5}'),
(@pergunta_id, '{"v1":0,"v2":1,"v3":2,"v4":3}'),
(@pergunta_id, '{"v1":1,"v2":3,"v3":5,"v4":7}'),
(@pergunta_id, '{"v1":2,"v2":4,"v3":6,"v4":8}'),
(@pergunta_id, '{"v1":3,"v2":5,"v3":7,"v4":9}'),
(@pergunta_id, '{"v1":4,"v2":6,"v3":8,"v4":10}'),
(@pergunta_id, '{"v1":5,"v2":7,"v3":9,"v4":11}'),
(@pergunta_id, '{"v1":6,"v2":8,"v3":10,"v4":12}'),
(@pergunta_id, '{"v1":7,"v2":9,"v3":11,"v4":13}');

INSERT INTO Alternativas (Variaveis_id, opcoes)
VALUES
(1391, '{"op_c":"10","op_1":"9","op_2":"8","op_3":"12"}'),
(1392, '{"op_c":"14","op_1":"13","op_2":"15","op_3":"16"}'),
(1393, '{"op_c":"6","op_1":"5","op_2":"4","op_3":"7"}'),
(1394, '{"op_c":"16","op_1":"18","op_2":"20","op_3":"14"}'),
(1395, '{"op_c":"20","op_1":"18","op_2":"22","op_3":"24"}'),
(1396, '{"op_c":"24","op_1":"26","op_2":"22","op_3":"28"}'),
(1397, '{"op_c":"28","op_1":"26","op_2":"24","op_3":"32"}'),
(1398, '{"op_c":"32","op_1":"30","op_2":"34","op_3":"28"}'),
(1399, '{"op_c":"36","op_1":"34","op_2":"32","op_3":"40"}'),
(1400, '{"op_c":"40","op_1":"38","op_2":"36","op_3":"42"}');

-- ==========================================
-- PRODUTO DE MATRIZES (materia_id = 28)
-- ==========================================

-- PERGUNTA 1
INSERT INTO Perguntas (materia_id, texto)
VALUES (28, 'Em qual condição duas matrizes A e B podem ser multiplicadas (A × B)?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"número de colunas de A igual ao número de linhas de B"}'),
(@pergunta_id, '{"v1":"número de linhas de A igual ao número de colunas de B"}'),
(@pergunta_id, '{"v1":"mesmo número de linhas"}'),
(@pergunta_id, '{"v1":"mesmo número de colunas"}'),
(@pergunta_id, '{"v1":"A deve ser quadrada"}'),
(@pergunta_id, '{"v1":"B deve ser quadrada"}'),
(@pergunta_id, '{"v1":"A e B devem ser inversíveis"}'),
(@pergunta_id, '{"v1":"A deve ser identidade"}'),
(@pergunta_id, '{"v1":"B deve ser nula"}'),
(@pergunta_id, '{"v1":"A deve ser nula"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(1401, '{"op_c":"número de colunas de A igual ao número de linhas de B","op_1":"número de linhas de A igual ao número de colunas de B","op_2":"mesmo número de linhas","op_3":"A deve ser quadrada"}'),
(1402, '{"op_c":"número de colunas de A igual ao número de linhas de B","op_1":"mesmo número de colunas","op_2":"A e B devem ser inversíveis","op_3":"B deve ser quadrada"}'),
(1403, '{"op_c":"número de colunas de A igual ao número de linhas de B","op_1":"A deve ser identidade","op_2":"B deve ser nula","op_3":"A deve ser nula"}'),
(1404, '{"op_c":"número de colunas de A igual ao número de linhas de B","op_1":"mesmo número de linhas","op_2":"A deve ser quadrada","op_3":"A deve ser identidade"}'),
(1405, '{"op_c":"número de colunas de A igual ao número de linhas de B","op_1":"mesmo número de colunas","op_2":"A deve ser nula","op_3":"B deve ser quadrada"}'),
(1406, '{"op_c":"número de colunas de A igual ao número de linhas de B","op_1":"B deve ser identidade","op_2":"A deve ser quadrada","op_3":"A deve ser identidade"}'),
(1407, '{"op_c":"número de colunas de A igual ao número de linhas de B","op_1":"mesmo número de linhas","op_2":"B deve ser nula","op_3":"A deve ser nula"}'),
(1408, '{"op_c":"número de colunas de A igual ao número de linhas de B","op_1":"mesmo número de colunas","op_2":"B deve ser quadrada","op_3":"A deve ser quadrada"}'),
(1409, '{"op_c":"número de colunas de A igual ao número de linhas de B","op_1":"B deve ser nula","op_2":"A e B devem ser inversíveis","op_3":"A deve ser quadrada"}'),
(1410, '{"op_c":"número de colunas de A igual ao número de linhas de B","op_1":"A deve ser quadrada","op_2":"A deve ser identidade","op_3":"mesmo número de linhas"}');

-- PERGUNTA 2
INSERT INTO Perguntas (materia_id, texto)
VALUES (28, 'O resultado do produto A × B de uma matriz A (m×n) por uma matriz B (n×p) terá qual dimensão?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"m×p"}'),(@pergunta_id, '{"v1":"n×m"}'),
(@pergunta_id, '{"v1":"p×n"}'),(@pergunta_id, '{"v1":"m×n"}'),
(@pergunta_id, '{"v1":"p×m"}'),(@pergunta_id, '{"v1":"n×p"}'),
(@pergunta_id, '{"v1":"m×m"}'),(@pergunta_id, '{"v1":"p×p"}'),
(@pergunta_id, '{"v1":"1×p"}'),(@pergunta_id, '{"v1":"n×1"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(1411, '{"op_c":"m×p","op_1":"n×m","op_2":"p×n","op_3":"m×n"}'),
(1412, '{"op_c":"m×p","op_1":"p×m","op_2":"n×p","op_3":"m×m"}'),
(1413, '{"op_c":"m×p","op_1":"p×p","op_2":"1×p","op_3":"n×1"}'),
(1414, '{"op_c":"m×p","op_1":"m×n","op_2":"n×m","op_3":"p×n"}'),
(1415, '{"op_c":"m×p","op_1":"p×m","op_2":"n×p","op_3":"p×p"}'),
(1416, '{"op_c":"m×p","op_1":"m×m","op_2":"n×1","op_3":"1×p"}'),
(1417, '{"op_c":"m×p","op_1":"n×p","op_2":"p×m","op_3":"n×m"}'),
(1418, '{"op_c":"m×p","op_1":"p×p","op_2":"m×n","op_3":"n×p"}'),
(1419, '{"op_c":"m×p","op_1":"p×m","op_2":"p×n","op_3":"m×n"}'),
(1420, '{"op_c":"m×p","op_1":"n×p","op_2":"p×n","op_3":"m×n"}');

-- PERGUNTA 3
INSERT INTO Perguntas (materia_id, texto)
VALUES (28, 'Qual das Alternativas representa corretamente a multiplicação entre uma matriz A por uma matriz identidade de mesma ordem?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"A"}'),(@pergunta_id, '{"v1":"A"}'),
(@pergunta_id, '{"v1":"A"}'),(@pergunta_id, '{"v1":"A"}'),
(@pergunta_id, '{"v1":"A"}'),(@pergunta_id, '{"v1":"A"}'),
(@pergunta_id, '{"v1":"A"}'),(@pergunta_id, '{"v1":"A"}'),
(@pergunta_id, '{"v1":"A"}'),(@pergunta_id, '{"v1":"A"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(1421, '{"op_c":"A","op_1":"A²","op_2":"2A","op_3":"0"}'),
(1422, '{"op_c":"A","op_1":"A²","op_2":"0","op_3":"2A"}'),
(1423, '{"op_c":"A","op_1":"2A","op_2":"A²","op_3":"0"}'),
(1424, '{"op_c":"A","op_1":"0","op_2":"A²","op_3":"2A"}'),
(1425, '{"op_c":"A","op_1":"A²","op_2":"2A","op_3":"A⁻¹"}'),
(1426, '{"op_c":"A","op_1":"A⁻¹","op_2":"2A","op_3":"0"}'),
(1427, '{"op_c":"A","op_1":"A²","op_2":"A⁻¹","op_3":"2A"}'),
(1428, '{"op_c":"A","op_1":"2A","op_2":"0","op_3":"A⁻¹"}'),
(1429, '{"op_c":"A","op_1":"0","op_2":"A²","op_3":"A⁻¹"}'),
(1430, '{"op_c":"A","op_1":"A⁻¹","op_2":"0","op_3":"A²"}');

-- PERGUNTA 4
INSERT INTO Perguntas (materia_id, texto)
VALUES (28, 'O produto de matrizes é comutativo? Ou seja, A × B = B × A?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"Não, na maioria dos casos"}'),
(@pergunta_id, '{"v1":"Sim, sempre"}'),
(@pergunta_id, '{"v1":"Apenas se forem quadradas"}'),
(@pergunta_id, '{"v1":"Apenas se forem inversíveis"}'),
(@pergunta_id, '{"v1":"Apenas se forem identidade"}'),
(@pergunta_id, '{"v1":"Nunca"}'),
(@pergunta_id, '{"v1":"Somente se A = B"}'),
(@pergunta_id, '{"v1":"Apenas se forem diagonais"}'),
(@pergunta_id, '{"v1":"Apenas se forem simétricas"}'),
(@pergunta_id, '{"v1":"Somente em matrizes nulas"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(1431, '{"op_c":"Não, na maioria dos casos","op_1":"Sim, sempre","op_2":"Nunca","op_3":"Somente se A=B"}'),
(1432, '{"op_c":"Não, na maioria dos casos","op_1":"Apenas se forem diagonais","op_2":"Apenas se forem identidade","op_3":"Somente em matrizes nulas"}'),
(1433, '{"op_c":"Não, na maioria dos casos","op_1":"Apenas se forem quadradas","op_2":"Apenas se forem inversíveis","op_3":"Apenas se forem simétricas"}'),
(1434, '{"op_c":"Não, na maioria dos casos","op_1":"Nunca","op_2":"Somente se A=B","op_3":"Sim, sempre"}'),
(1435, '{"op_c":"Não, na maioria dos casos","op_1":"Apenas se forem diagonais","op_2":"Apenas se forem simétricas","op_3":"Nunca"}'),
(1436, '{"op_c":"Não, na maioria dos casos","op_1":"Somente em matrizes nulas","op_2":"Apenas se forem identidade","op_3":"Apenas se forem quadradas"}'),
(1437, '{"op_c":"Não, na maioria dos casos","op_1":"Apenas se forem inversíveis","op_2":"Sim, sempre","op_3":"Apenas se forem diagonais"}'),
(1438, '{"op_c":"Não, na maioria dos casos","op_1":"Apenas se forem quadradas","op_2":"Nunca","op_3":"Somente em matrizes nulas"}'),
(1439, '{"op_c":"Não, na maioria dos casos","op_1":"Apenas se forem simétricas","op_2":"Apenas se forem diagonais","op_3":"Apenas se forem identidade"}'),
(1440, '{"op_c":"Não, na maioria dos casos","op_1":"Somente se A=B","op_2":"Apenas se forem diagonais","op_3":"Nunca"}');

-- PERGUNTA 5 (PRÁTICA)
INSERT INTO Perguntas (materia_id, texto)
VALUES (28, 'Considere as matrizes A = [[ v1, v2 ], [ v3, v4 ]] e B = [[ v5, v6 ], [ v7, v8 ]]. Calcule o produto A × B.');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":1,"v2":2,"v3":3,"v4":4,"v5":1,"v6":0,"v7":0,"v8":1}'),
(@pergunta_id, '{"v1":2,"v2":1,"v3":0,"v4":3,"v5":1,"v6":2,"v7":0,"v8":1}'),
(@pergunta_id, '{"v1":1,"v2":0,"v3":2,"v4":1,"v5":2,"v6":1,"v7":0,"v8":2}'),
(@pergunta_id, '{"v1":1,"v2":1,"v3":1,"v4":1,"v5":1,"v6":1,"v7":1,"v8":1}'),
(@pergunta_id, '{"v1":3,"v2":2,"v3":1,"v4":0,"v5":1,"v6":0,"v7":2,"v8":1}'),
(@pergunta_id, '{"v1":2,"v2":2,"v3":2,"v4":2,"v5":1,"v6":1,"v7":1,"v8":1}'),
(@pergunta_id, '{"v1":0,"v2":1,"v3":1,"v4":0,"v5":1,"v6":1,"v7":1,"v8":1}'),
(@pergunta_id, '{"v1":2,"v2":3,"v3":1,"v4":4,"v5":1,"v6":0,"v7":0,"v8":1}'),
(@pergunta_id, '{"v1":1,"v2":2,"v3":3,"v4":4,"v5":2,"v6":0,"v7":0,"v8":2}'),
(@pergunta_id, '{"v1":3,"v2":1,"v3":0,"v4":2,"v5":1,"v6":1,"v7":1,"v8":0}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(1441, '{"op_c":"[[1,2],[3,4]]","op_1":"[[2,0],[0,2]]","op_2":"[[1,0],[0,1]]","op_3":"[[4,4],[4,4]]"}'),
(1442, '{"op_c":"[[2,5],[3,3]]","op_1":"[[3,3],[2,5]]","op_2":"[[2,3],[5,3]]","op_3":"[[3,2],[3,5]]"}'),
(1443, '{"op_c":"[[2,1],[4,4]]","op_1":"[[1,2],[4,2]]","op_2":"[[2,4],[1,4]]","op_3":"[[4,2],[2,1]]"}'),
(1444, '{"op_c":"[[2,2],[2,2]]","op_1":"[[1,1],[1,1]]","op_2":"[[4,4],[4,4]]","op_3":"[[0,0],[0,0]]"}'),
(1445, '{"op_c":"[[7,2],[1,0]]","op_1":"[[1,7],[0,2]]","op_2":"[[2,0],[1,7]]","op_3":"[[0,1],[2,7]]"}'),
(1446, '{"op_c":"[[4,4],[4,4]]","op_1":"[[2,2],[2,2]]","op_2":"[[8,8],[8,8]]","op_3":"[[0,0],[0,0]]"}'),
(1447, '{"op_c":"[[1,1],[1,1]]","op_1":"[[0,0],[0,0]]","op_2":"[[2,2],[2,2]]","op_3":"[[3,3],[3,3]]"}'),
(1448, '{"op_c":"[[2,3],[1,4]]","op_1":"[[3,2],[4,1]]","op_2":"[[4,4],[4,4]]","op_3":"[[1,1],[1,1]]"}'),
(1449, '{"op_c":"[[2,4],[6,8]]","op_1":"[[1,2],[3,4]]","op_2":"[[4,4],[4,4]]","op_3":"[[0,0],[0,0]]"}'),
(1450, '{"op_c":"[[4,3],[2,2]]","op_1":"[[3,2],[4,3]]","op_2":"[[2,4],[3,2]]","op_3":"[[1,1],[1,1]]"}');

-- ==========================================
-- MATRIZ INVERSÍVEL (materia_id = 29)
-- ==========================================

-- PERGUNTA 1
INSERT INTO Perguntas (materia_id, texto)
VALUES (29, 'O que é uma matriz inversível (ou invertível)?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"A matriz que possui uma matriz inversa"}'),
(@pergunta_id, '{"v1":"A matriz simétrica"}'),
(@pergunta_id, '{"v1":"A matriz diagonal"}'),
(@pergunta_id, '{"v1":"A matriz transposta"}'),
(@pergunta_id, '{"v1":"A matriz identidade"}'),
(@pergunta_id, '{"v1":"A matriz nula"}'),
(@pergunta_id, '{"v1":"A matriz que não tem determinante"}'),
(@pergunta_id, '{"v1":"A matriz ortogonal"}'),
(@pergunta_id, '{"v1":"A matriz quadrada"}'),
(@pergunta_id, '{"v1":"A matriz com elementos negativos"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(1451, '{"op_c":"A matriz que possui uma matriz inversa","op_1":"A matriz identidade","op_2":"A matriz diagonal","op_3":"A matriz transposta"}'),
(1452, '{"op_c":"A matriz que possui uma matriz inversa","op_1":"A matriz nula","op_2":"A matriz quadrada","op_3":"A matriz simétrica"}'),
(1453, '{"op_c":"A matriz que possui uma matriz inversa","op_1":"A matriz ortogonal","op_2":"A matriz transposta","op_3":"A matriz diagonal"}'),
(1454, '{"op_c":"A matriz que possui uma matriz inversa","op_1":"A matriz nula","op_2":"A matriz simétrica","op_3":"A matriz identidade"}'),
(1455, '{"op_c":"A matriz que possui uma matriz inversa","op_1":"A matriz com elementos negativos","op_2":"A matriz ortogonal","op_3":"A matriz quadrada"}'),
(1456, '{"op_c":"A matriz que possui uma matriz inversa","op_1":"A matriz simétrica","op_2":"A matriz nula","op_3":"A matriz identidade"}'),
(1457, '{"op_c":"A matriz que possui uma matriz inversa","op_1":"A matriz diagonal","op_2":"A matriz ortogonal","op_3":"A matriz quadrada"}'),
(1458, '{"op_c":"A matriz que possui uma matriz inversa","op_1":"A matriz identidade","op_2":"A matriz nula","op_3":"A matriz simétrica"}'),
(1459, '{"op_c":"A matriz que possui uma matriz inversa","op_1":"A matriz transposta","op_2":"A matriz diagonal","op_3":"A matriz ortogonal"}'),
(1460, '{"op_c":"A matriz que possui uma matriz inversa","op_1":"A matriz nula","op_2":"A matriz quadrada","op_3":"A matriz identidade"}');

-- PERGUNTA 2
INSERT INTO Perguntas (materia_id, texto)
VALUES (29, 'Qual é a condição para que uma matriz A seja inversível?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"det(A) ≠ 0"}'),
(@pergunta_id, '{"v1":"det(A) = 0"}'),
(@pergunta_id, '{"v1":"A deve ser simétrica"}'),
(@pergunta_id, '{"v1":"A deve ser transposta"}'),
(@pergunta_id, '{"v1":"A deve ser diagonal"}'),
(@pergunta_id, '{"v1":"A deve ser nula"}'),
(@pergunta_id, '{"v1":"A deve ser identidade"}'),
(@pergunta_id, '{"v1":"A deve ter todos os elementos iguais"}'),
(@pergunta_id, '{"v1":"A deve ter determinante negativo"}'),
(@pergunta_id, '{"v1":"A deve ter determinante igual a 1"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(1461, '{"op_c":"det(A) ≠ 0","op_1":"det(A) = 0","op_2":"A deve ser simétrica","op_3":"A deve ser nula"}'),
(1462, '{"op_c":"det(A) ≠ 0","op_1":"A deve ser identidade","op_2":"A deve ter determinante negativo","op_3":"A deve ser diagonal"}'),
(1463, '{"op_c":"det(A) ≠ 0","op_1":"A deve ser nula","op_2":"A deve ser transposta","op_3":"A deve ser simétrica"}'),
(1464, '{"op_c":"det(A) ≠ 0","op_1":"A deve ter determinante igual a 1","op_2":"A deve ser identidade","op_3":"A deve ter todos os elementos iguais"}'),
(1465, '{"op_c":"det(A) ≠ 0","op_1":"A deve ser diagonal","op_2":"A deve ter determinante negativo","op_3":"A deve ser nula"}'),
(1466, '{"op_c":"det(A) ≠ 0","op_1":"A deve ser transposta","op_2":"A deve ser identidade","op_3":"A deve ser nula"}'),
(1467, '{"op_c":"det(A) ≠ 0","op_1":"A deve ser diagonal","op_2":"A deve ter todos os elementos iguais","op_3":"A deve ser simétrica"}'),
(1468, '{"op_c":"det(A) ≠ 0","op_1":"A deve ser identidade","op_2":"A deve ser nula","op_3":"A deve ser simétrica"}'),
(1469, '{"op_c":"det(A) ≠ 0","op_1":"A deve ter determinante negativo","op_2":"A deve ser transposta","op_3":"A deve ser identidade"}'),
(1470, '{"op_c":"det(A) ≠ 0","op_1":"A deve ter determinante igual a 1","op_2":"A deve ser simétrica","op_3":"A deve ser nula"}');

-- PERGUNTA 3
INSERT INTO Perguntas (materia_id, texto)
VALUES (29, 'Se A é uma matriz inversível, o produto A × A⁻¹ é igual a:');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"I"}'),(@pergunta_id, '{"v1":"I"}'),
(@pergunta_id, '{"v1":"I"}'),(@pergunta_id, '{"v1":"I"}'),
(@pergunta_id, '{"v1":"I"}'),(@pergunta_id, '{"v1":"I"}'),
(@pergunta_id, '{"v1":"I"}'),(@pergunta_id, '{"v1":"I"}'),
(@pergunta_id, '{"v1":"I"}'),(@pergunta_id, '{"v1":"I"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(1471, '{"op_c":"I","op_1":"A","op_2":"A²","op_3":"0"}'),
(1472, '{"op_c":"I","op_1":"0","op_2":"A²","op_3":"A"}'),
(1473, '{"op_c":"I","op_1":"A²","op_2":"A","op_3":"0"}'),
(1474, '{"op_c":"I","op_1":"0","op_2":"A","op_3":"A²"}'),
(1475, '{"op_c":"I","op_1":"A","op_2":"A²","op_3":"A⁻¹"}'),
(1476, '{"op_c":"I","op_1":"A⁻¹","op_2":"0","op_3":"A"}'),
(1477, '{"op_c":"I","op_1":"A²","op_2":"A","op_3":"A⁻¹"}'),
(1478, '{"op_c":"I","op_1":"A⁻¹","op_2":"A²","op_3":"0"}'),
(1479, '{"op_c":"I","op_1":"0","op_2":"A⁻¹","op_3":"A"}'),
(1480, '{"op_c":"I","op_1":"A","op_2":"0","op_3":"A⁻¹"}');

-- PERGUNTA 4
INSERT INTO Perguntas (materia_id, texto)
VALUES (29, 'Qual das Alternativas é verdadeira sobre a matriz inversa A⁻¹?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"(A⁻¹)⁻¹ = A"}'),
(@pergunta_id, '{"v1":"A × A⁻¹ = A²"}'),
(@pergunta_id, '{"v1":"(A⁻¹)² = I"}'),
(@pergunta_id, '{"v1":"A⁻¹ × A⁻¹ = 2A"}'),
(@pergunta_id, '{"v1":"A⁻¹ = 0"}'),
(@pergunta_id, '{"v1":"A⁻¹ = A"}'),
(@pergunta_id, '{"v1":"A⁻¹ × A = 0"}'),
(@pergunta_id, '{"v1":"A⁻¹ × A = A"}'),
(@pergunta_id, '{"v1":"(A⁻¹)² = A"}'),
(@pergunta_id, '{"v1":"A⁻¹ = I"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(1481, '{"op_c":"(A⁻¹)⁻¹ = A","op_1":"A × A⁻¹ = A²","op_2":"A⁻¹ = 0","op_3":"A⁻¹ = A"}'),
(1482, '{"op_c":"(A⁻¹)⁻¹ = A","op_1":"A⁻¹ × A = 0","op_2":"A⁻¹ = I","op_3":"A⁻¹ × A = A"}'),
(1483, '{"op_c":"(A⁻¹)⁻¹ = A","op_1":"A⁻¹ × A⁻¹ = 2A","op_2":"(A⁻¹)² = I","op_3":"A⁻¹ = 0"}'),
(1484, '{"op_c":"(A⁻¹)⁻¹ = A","op_1":"A × A⁻¹ = A²","op_2":"A⁻¹ = A","op_3":"A⁻¹ = I"}'),
(1485, '{"op_c":"(A⁻¹)⁻¹ = A","op_1":"A⁻¹ × A = 0","op_2":"(A⁻¹)² = A","op_3":"A⁻¹ × A = A"}'),
(1486, '{"op_c":"(A⁻¹)⁻¹ = A","op_1":"A⁻¹ × A⁻¹ = 2A","op_2":"A⁻¹ = 0","op_3":"A⁻¹ = I"}'),
(1487, '{"op_c":"(A⁻¹)⁻¹ = A","op_1":"A⁻¹ × A = A","op_2":"A × A⁻¹ = A²","op_3":"A⁻¹ = 0"}'),
(1488, '{"op_c":"(A⁻¹)⁻¹ = A","op_1":"A⁻¹ × A⁻¹ = 2A","op_2":"A⁻¹ = A","op_3":"A⁻¹ × A = 0"}'),
(1489, '{"op_c":"(A⁻¹)⁻¹ = A","op_1":"A⁻¹ = 0","op_2":"A⁻¹ × A = A","op_3":"A⁻¹ = I"}'),
(1490, '{"op_c":"(A⁻¹)⁻¹ = A","op_1":"A × A⁻¹ = A²","op_2":"A⁻¹ × A = 0","op_3":"A⁻¹ × A⁻¹ = 2A"}');

-- PERGUNTA 5 (PRÁTICA)
INSERT INTO Perguntas (materia_id, texto)
VALUES (29, 'Considere a matriz A = [[v1, v2], [v3, v4]]. Determine se A é inversível e, se for, calcule o seu determinante.');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":1,"v2":2,"v3":3,"v4":4}'),
(@pergunta_id, '{"v1":2,"v2":3,"v3":1,"v4":2}'),
(@pergunta_id, '{"v1":1,"v2":0,"v3":0,"v4":1}'),
(@pergunta_id, '{"v1":1,"v2":1,"v3":1,"v4":1}'),
(@pergunta_id, '{"v1":2,"v2":1,"v3":1,"v4":2}'),
(@pergunta_id, '{"v1":3,"v2":1,"v3":2,"v4":2}'),
(@pergunta_id, '{"v1":4,"v2":2,"v3":1,"v4":0}'),
(@pergunta_id, '{"v1":5,"v2":3,"v3":2,"v4":1}'),
(@pergunta_id, '{"v1":2,"v2":0,"v3":0,"v4":2}'),
(@pergunta_id, '{"v1":0,"v2":1,"v3":1,"v4":0}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(1491, '{"op_c":"Não inversível (det= -2)","op_1":"Inversível (det= 0)","op_2":"Inversível (det= 2)","op_3":"Não inversível (det= 0)"}'),
(1492, '{"op_c":"Não inversível (det= 1)","op_1":"Inversível (det= 0)","op_2":"Inversível (det= -1)","op_3":"Não inversível (det= 0)"}'),
(1493, '{"op_c":"Inversível (det= 1)","op_1":"Não inversível (det= 0)","op_2":"Inversível (det= 0)","op_3":"Não inversível (det= -1)"}'),
(1494, '{"op_c":"Não inversível (det= 0)","op_1":"Inversível (det= 1)","op_2":"Inversível (det= -1)","op_3":"Não inversível (det= -2)"}'),
(1495, '{"op_c":"Inversível (det= 3)","op_1":"Não inversível (det= 0)","op_2":"Inversível (det= 0)","op_3":"Não inversível (det= -3)"}'),
(1496, '{"op_c":"Inversível (det= 4)","op_1":"Não inversível (det= 0)","op_2":"Inversível (det= 0)","op_3":"Não inversível (det= -2)"}'),
(1497, '{"op_c":"Inversível (det= -2)","op_1":"Não inversível (det= 0)","op_2":"Inversível (det= 0)","op_3":"Não inversível (det= 2)"}'),
(1498, '{"op_c":"Inversível (det= -1)","op_1":"Não inversível (det= 0)","op_2":"Inversível (det= 0)","op_3":"Não inversível (det= 1)"}'),
(1499, '{"op_c":"Inversível (det= 4)","op_1":"Não inversível (det= 0)","op_2":"Inversível (det= 0)","op_3":"Não inversível (det= -2)"}'),
(1500, '{"op_c":"Não inversível (det= -1)","op_1":"Inversível (det= 1)","op_2":"Inversível (det= 0)","op_3":"Não inversível (det= 0)"}');

-- ==========================================
-- MATRIZ TRANSPOSTA (materia_id = 30)
-- ==========================================

-- PERGUNTA 1
INSERT INTO Perguntas (materia_id, texto)
VALUES (30, 'O que é a transposta de uma matriz A?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"Matriz obtida trocando as linhas pelas colunas"}'),
(@pergunta_id, '{"v1":"Matriz obtida trocando as colunas pelas linhas"}'),
(@pergunta_id, '{"v1":"Matriz inversa de A"}'),
(@pergunta_id, '{"v1":"Matriz simétrica de A"}'),
(@pergunta_id, '{"v1":"Matriz oposta de A"}'),
(@pergunta_id, '{"v1":"Matriz diagonal de A"}'),
(@pergunta_id, '{"v1":"Matriz identidade"}'),
(@pergunta_id, '{"v1":"Matriz nula"}'),
(@pergunta_id, '{"v1":"Matriz triangular"}'),
(@pergunta_id, '{"v1":"Matriz aumentada"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(1501, '{"op_c":"Matriz obtida trocando as linhas pelas colunas","op_1":"Matriz inversa de A","op_2":"Matriz simétrica de A","op_3":"Matriz oposta de A"}'),
(1502, '{"op_c":"Matriz obtida trocando as linhas pelas colunas","op_1":"Matriz diagonal de A","op_2":"Matriz nula","op_3":"Matriz aumentada"}'),
(1503, '{"op_c":"Matriz obtida trocando as linhas pelas colunas","op_1":"Matriz identidade","op_2":"Matriz triangular","op_3":"Matriz inversa de A"}'),
(1504, '{"op_c":"Matriz obtida trocando as linhas pelas colunas","op_1":"Matriz oposta de A","op_2":"Matriz diagonal de A","op_3":"Matriz nula"}'),
(1505, '{"op_c":"Matriz obtida trocando as linhas pelas colunas","op_1":"Matriz aumentada","op_2":"Matriz triangular","op_3":"Matriz simétrica de A"}'),
(1506, '{"op_c":"Matriz obtida trocando as linhas pelas colunas","op_1":"Matriz inversa de A","op_2":"Matriz identidade","op_3":"Matriz diagonal de A"}'),
(1507, '{"op_c":"Matriz obtida trocando as linhas pelas colunas","op_1":"Matriz simétrica de A","op_2":"Matriz oposta de A","op_3":"Matriz triangular"}'),
(1508, '{"op_c":"Matriz obtida trocando as linhas pelas colunas","op_1":"Matriz aumentada","op_2":"Matriz nula","op_3":"Matriz inversa de A"}'),
(1509, '{"op_c":"Matriz obtida trocando as linhas pelas colunas","op_1":"Matriz diagonal de A","op_2":"Matriz identidade","op_3":"Matriz oposta de A"}'),
(1510, '{"op_c":"Matriz obtida trocando as linhas pelas colunas","op_1":"Matriz aumentada","op_2":"Matriz triangular","op_3":"Matriz nula"}');

-- PERGUNTA 2
INSERT INTO Perguntas (materia_id, texto)
VALUES (30, 'Qual das propriedades a seguir é verdadeira para a matriz transposta?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"(Aᵀ)ᵀ = A"}'),
(@pergunta_id, '{"v1":"(Aᵀ)ᵀ = A⁻¹"}'),
(@pergunta_id, '{"v1":"(Aᵀ)ᵀ = 0"}'),
(@pergunta_id, '{"v1":"(Aᵀ)ᵀ = A²"}'),
(@pergunta_id, '{"v1":"(Aᵀ)ᵀ = -A"}'),
(@pergunta_id, '{"v1":"(Aᵀ)ᵀ = I"}'),
(@pergunta_id, '{"v1":"(Aᵀ)ᵀ = A⁻²"}'),
(@pergunta_id, '{"v1":"(Aᵀ)ᵀ = 2A"}'),
(@pergunta_id, '{"v1":"(Aᵀ)ᵀ = A³"}'),
(@pergunta_id, '{"v1":"(Aᵀ)ᵀ = A⁰"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(1511, '{"op_c":"(Aᵀ)ᵀ = A","op_1":"(Aᵀ)ᵀ = A⁻¹","op_2":"(Aᵀ)ᵀ = 0","op_3":"(Aᵀ)ᵀ = I"}'),
(1512, '{"op_c":"(Aᵀ)ᵀ = A","op_1":"(Aᵀ)ᵀ = A²","op_2":"(Aᵀ)ᵀ = -A","op_3":"(Aᵀ)ᵀ = A⁰"}'),
(1513, '{"op_c":"(Aᵀ)ᵀ = A","op_1":"(Aᵀ)ᵀ = A⁻²","op_2":"(Aᵀ)ᵀ = 2A","op_3":"(Aᵀ)ᵀ = A³"}'),
(1514, '{"op_c":"(Aᵀ)ᵀ = A","op_1":"(Aᵀ)ᵀ = I","op_2":"(Aᵀ)ᵀ = -A","op_3":"(Aᵀ)ᵀ = 0"}'),
(1515, '{"op_c":"(Aᵀ)ᵀ = A","op_1":"(Aᵀ)ᵀ = A²","op_2":"(Aᵀ)ᵀ = 2A","op_3":"(Aᵀ)ᵀ = A⁻¹"}'),
(1516, '{"op_c":"(Aᵀ)ᵀ = A","op_1":"(Aᵀ)ᵀ = A⁰","op_2":"(Aᵀ)ᵀ = -A","op_3":"(Aᵀ)ᵀ = A³"}'),
(1517, '{"op_c":"(Aᵀ)ᵀ = A","op_1":"(Aᵀ)ᵀ = I","op_2":"(Aᵀ)ᵀ = A⁻²","op_3":"(Aᵀ)ᵀ = A²"}'),
(1518, '{"op_c":"(Aᵀ)ᵀ = A","op_1":"(Aᵀ)ᵀ = -A","op_2":"(Aᵀ)ᵀ = A⁻¹","op_3":"(Aᵀ)ᵀ = A³"}'),
(1519, '{"op_c":"(Aᵀ)ᵀ = A","op_1":"(Aᵀ)ᵀ = 0","op_2":"(Aᵀ)ᵀ = A²","op_3":"(Aᵀ)ᵀ = A⁻¹"}'),
(1520, '{"op_c":"(Aᵀ)ᵀ = A","op_1":"(Aᵀ)ᵀ = -A","op_2":"(Aᵀ)ᵀ = A⁰","op_3":"(Aᵀ)ᵀ = A³"}');

-- PERGUNTA 3
INSERT INTO Perguntas (materia_id, texto)
VALUES (30, 'Se A e B são matrizes compatíveis para multiplicação, qual é a relação correta entre (A × B)ᵀ, Aᵀ e Bᵀ?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"(A × B)ᵀ = Bᵀ × Aᵀ"}'),
(@pergunta_id, '{"v1":"(A × B)ᵀ = Aᵀ × Bᵀ"}'),
(@pergunta_id, '{"v1":"(A × B)ᵀ = A × B"}'),
(@pergunta_id, '{"v1":"(A × B)ᵀ = A × Bᵀ"}'),
(@pergunta_id, '{"v1":"(A × B)ᵀ = B × A"}'),
(@pergunta_id, '{"v1":"(A × B)ᵀ = (Aᵀ × B)"}'),
(@pergunta_id, '{"v1":"(A × B)ᵀ = (B × Aᵀ)"}'),
(@pergunta_id, '{"v1":"(A × B)ᵀ = A⁻¹ × B⁻¹"}'),
(@pergunta_id, '{"v1":"(A × B)ᵀ = (B × A)ᵀ"}'),
(@pergunta_id, '{"v1":"(A × B)ᵀ = Aᵀ × B"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(1521, '{"op_c":"(A × B)ᵀ = Bᵀ × Aᵀ","op_1":"(A × B)ᵀ = Aᵀ × Bᵀ","op_2":"(A × B)ᵀ = A × B","op_3":"(A × B)ᵀ = A × Bᵀ"}'),
(1522, '{"op_c":"(A × B)ᵀ = Bᵀ × Aᵀ","op_1":"(A × B)ᵀ = A × B","op_2":"(A × B)ᵀ = A × Bᵀ","op_3":"(A × B)ᵀ = (B × Aᵀ)"}'),
(1523, '{"op_c":"(A × B)ᵀ = Bᵀ × Aᵀ","op_1":"(A × B)ᵀ = (Aᵀ × B)","op_2":"(A × B)ᵀ = (B × A)ᵀ","op_3":"(A × B)ᵀ = Aᵀ × B"}'),
(1524, '{"op_c":"(A × B)ᵀ = Bᵀ × Aᵀ","op_1":"(A × B)ᵀ = B × A","op_2":"(A × B)ᵀ = Aᵀ × B","op_3":"(A × B)ᵀ = A × B"}'),
(1525, '{"op_c":"(A × B)ᵀ = Bᵀ × Aᵀ","op_1":"(A × B)ᵀ = A × Bᵀ","op_2":"(A × B)ᵀ = Aᵀ × Bᵀ","op_3":"(A × B)ᵀ = A × B"}'),
(1526, '{"op_c":"(A × B)ᵀ = Bᵀ × Aᵀ","op_1":"(A × B)ᵀ = (B × Aᵀ)","op_2":"(A × B)ᵀ = A × B","op_3":"(A × B)ᵀ = Aᵀ × B"}'),
(1527, '{"op_c":"(A × B)ᵀ = Bᵀ × Aᵀ","op_1":"(A × B)ᵀ = Aᵀ × Bᵀ","op_2":"(A × B)ᵀ = (B × A)ᵀ","op_3":"(A × B)ᵀ = (Aᵀ × B)"}'),
(1528, '{"op_c":"(A × B)ᵀ = Bᵀ × Aᵀ","op_1":"(A × B)ᵀ = (B × Aᵀ)","op_2":"(A × B)ᵀ = (Aᵀ × B)","op_3":"(A × B)ᵀ = (B × A)ᵀ"}'),
(1529, '{"op_c":"(A × B)ᵀ = Bᵀ × Aᵀ","op_1":"(A × B)ᵀ = A × B","op_2":"(A × B)ᵀ = A × Bᵀ","op_3":"(A × B)ᵀ = (Aᵀ × B)"}'),
(1530, '{"op_c":"(A × B)ᵀ = Bᵀ × Aᵀ","op_1":"(A × B)ᵀ = (Aᵀ × B)","op_2":"(A × B)ᵀ = (B × Aᵀ)","op_3":"(A × B)ᵀ = (B × A)ᵀ"}');

-- PERGUNTA 4
INSERT INTO Perguntas (materia_id, texto)
VALUES (30, 'Se A é uma matriz simétrica, o que se pode afirmar sobre A e Aᵀ?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"A = Aᵀ"}'),
(@pergunta_id, '{"v1":"A ≠ Aᵀ"}'),
(@pergunta_id, '{"v1":"A = -Aᵀ"}'),
(@pergunta_id, '{"v1":"Aᵀ é inversa de A"}'),
(@pergunta_id, '{"v1":"Aᵀ é nula"}'),
(@pergunta_id, '{"v1":"Aᵀ é identidade"}'),
(@pergunta_id, '{"v1":"Aᵀ é triangular"}'),
(@pergunta_id, '{"v1":"Aᵀ é diagonal"}'),
(@pergunta_id, '{"v1":"Aᵀ é oposta de A"}'),
(@pergunta_id, '{"v1":"Aᵀ é transposta de A"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(1531, '{"op_c":"A = Aᵀ","op_1":"A ≠ Aᵀ","op_2":"A = -Aᵀ","op_3":"Aᵀ é inversa de A"}'),
(1532, '{"op_c":"A = Aᵀ","op_1":"Aᵀ é nula","op_2":"Aᵀ é identidade","op_3":"Aᵀ é oposta de A"}'),
(1533, '{"op_c":"A = Aᵀ","op_1":"Aᵀ é triangular","op_2":"Aᵀ é diagonal","op_3":"Aᵀ é transposta de A"}'),
(1534, '{"op_c":"A = Aᵀ","op_1":"A ≠ Aᵀ","op_2":"A = -Aᵀ","op_3":"Aᵀ é oposta de A"}'),
(1535, '{"op_c":"A = Aᵀ","op_1":"Aᵀ é identidade","op_2":"Aᵀ é inversa de A","op_3":"Aᵀ é triangular"}'),
(1536, '{"op_c":"A = Aᵀ","op_1":"Aᵀ é nula","op_2":"Aᵀ é transposta de A","op_3":"Aᵀ é diagonal"}'),
(1537, '{"op_c":"A = Aᵀ","op_1":"Aᵀ é inversa de A","op_2":"Aᵀ é oposta de A","op_3":"Aᵀ é triangular"}'),
(1538, '{"op_c":"A = Aᵀ","op_1":"Aᵀ é diagonal","op_2":"Aᵀ é nula","op_3":"Aᵀ é transposta de A"}'),
(1539, '{"op_c":"A = Aᵀ","op_1":"Aᵀ é identidade","op_2":"Aᵀ é oposta de A","op_3":"Aᵀ é inversa de A"}'),
(1540, '{"op_c":"A = Aᵀ","op_1":"Aᵀ é nula","op_2":"Aᵀ é oposta de A","op_3":"Aᵀ é diagonal"}');

-- PERGUNTA 5 (PRÁTICA)
INSERT INTO Perguntas (materia_id, texto)
VALUES (30, 'Considere a matriz A = [[v1, v2], [v3, v4]]. Determine Aᵀ (a transposta de A).');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":1,"v2":2,"v3":3,"v4":4}'),
(@pergunta_id, '{"v1":2,"v2":3,"v3":1,"v4":2}'),
(@pergunta_id, '{"v1":0,"v2":1,"v3":1,"v4":0}'),
(@pergunta_id, '{"v1":3,"v2":1,"v3":2,"v4":2}'),
(@pergunta_id, '{"v1":1,"v2":0,"v3":0,"v4":1}'),
(@pergunta_id, '{"v1":4,"v2":2,"v3":0,"v4":1}'),
(@pergunta_id, '{"v1":2,"v2":1,"v3":3,"v4":0}'),
(@pergunta_id, '{"v1":5,"v2":4,"v3":2,"v4":1}'),
(@pergunta_id, '{"v1":3,"v2":0,"v3":1,"v4":2}'),
(@pergunta_id, '{"v1":0,"v2":1,"v3":0,"v4":0}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(1541, '{"op_c":"[[1,3],[2,4]]","op_1":"[[1,2],[3,4]]","op_2":"[[4,3],[2,1]]","op_3":"[[3,1],[4,2]]"}'),
(1542, '{"op_c":"[[2,1],[3,2]]","op_1":"[[2,3],[1,2]]","op_2":"[[3,2],[1,2]]","op_3":"[[1,2],[3,2]]"}'),
(1543, '{"op_c":"[[0,1],[1,0]]","op_1":"[[1,0],[1,0]]","op_2":"[[0,1],[0,1]]","op_3":"[[1,1],[0,0]]"}'),
(1544, '{"op_c":"[[3,2],[1,2]]","op_1":"[[3,1],[2,2]]","op_2":"[[2,3],[2,1]]","op_3":"[[1,3],[2,2]]"}'),
(1545, '{"op_c":"[[1,0],[0,1]]","op_1":"[[1,1],[0,0]]","op_2":"[[0,1],[1,0]]","op_3":"[[1,0],[1,0]]"}'),
(1546, '{"op_c":"[[4,0],[2,1]]","op_1":"[[4,2],[0,1]]","op_2":"[[0,4],[1,2]]","op_3":"[[2,4],[1,0]]"}'),
(1547, '{"op_c":"[[2,3],[1,0]]","op_1":"[[2,1],[3,0]]","op_2":"[[3,2],[0,1]]","op_3":"[[1,3],[0,2]]"}'),
(1548, '{"op_c":"[[5,2],[4,1]]","op_1":"[[5,4],[2,1]]","op_2":"[[2,5],[1,4]]","op_3":"[[1,2],[4,5]]"}'),
(1549, '{"op_c":"[[3,1],[0,2]]","op_1":"[[3,0],[1,2]]","op_2":"[[1,3],[2,0]]","op_3":"[[2,3],[0,1]]"}'),
(1550, '{"op_c":"[[0,0],[1,0]]","op_1":"[[0,1],[0,0]]","op_2":"[[1,0],[0,0]]","op_3":"[[0,0],[0,1]]"}');

-- ==========================================
-- TEOREMA DE CRAMER (materia_id = 31)
-- ==========================================

-- PERGUNTA 1
INSERT INTO Perguntas (materia_id, texto)
VALUES (31, 'O que estabelece o Teorema de Cramer?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"Método para resolver sistemas lineares utilizando determinantes"}'),
(@pergunta_id, '{"v1":"Método para calcular o traço de uma matriz"}'),
(@pergunta_id, '{"v1":"Método para inverter matrizes quadradas"}'),
(@pergunta_id, '{"v1":"Método para calcular autovalores"}'),
(@pergunta_id, '{"v1":"Método para multiplicar matrizes"}'),
(@pergunta_id, '{"v1":"Método para calcular o determinante de uma matriz simétrica"}'),
(@pergunta_id, '{"v1":"Método para encontrar o posto de uma matriz"}'),
(@pergunta_id, '{"v1":"Método para resolver inequações matriciais"}'),
(@pergunta_id, '{"v1":"Método para somar matrizes"}'),
(@pergunta_id, '{"v1":"Método para calcular matriz identidade"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(1551, '{"op_c":"Método para resolver sistemas lineares utilizando determinantes","op_1":"Método para calcular o traço de uma matriz","op_2":"Método para inverter matrizes quadradas","op_3":"Método para calcular autovalores"}'),
(1552, '{"op_c":"Método para resolver sistemas lineares utilizando determinantes","op_1":"Método para multiplicar matrizes","op_2":"Método para somar matrizes","op_3":"Método para calcular o determinante de uma matriz simétrica"}'),
(1553, '{"op_c":"Método para resolver sistemas lineares utilizando determinantes","op_1":"Método para calcular matriz identidade","op_2":"Método para encontrar o posto de uma matriz","op_3":"Método para calcular o traço de uma matriz"}'),
(1554, '{"op_c":"Método para resolver sistemas lineares utilizando determinantes","op_1":"Método para resolver inequações matriciais","op_2":"Método para calcular autovalores","op_3":"Método para multiplicar matrizes"}'),
(1555, '{"op_c":"Método para resolver sistemas lineares utilizando determinantes","op_1":"Método para inverter matrizes quadradas","op_2":"Método para calcular matriz identidade","op_3":"Método para encontrar o posto de uma matriz"}'),
(1556, '{"op_c":"Método para resolver sistemas lineares utilizando determinantes","op_1":"Método para somar matrizes","op_2":"Método para calcular o traço de uma matriz","op_3":"Método para calcular matriz identidade"}'),
(1557, '{"op_c":"Método para resolver sistemas lineares utilizando determinantes","op_1":"Método para multiplicar matrizes","op_2":"Método para calcular autovalores","op_3":"Método para inverter matrizes quadradas"}'),
(1558, '{"op_c":"Método para resolver sistemas lineares utilizando determinantes","op_1":"Método para calcular o traço de uma matriz","op_2":"Método para resolver inequações matriciais","op_3":"Método para somar matrizes"}'),
(1559, '{"op_c":"Método para resolver sistemas lineares utilizando determinantes","op_1":"Método para inverter matrizes quadradas","op_2":"Método para multiplicar matrizes","op_3":"Método para encontrar o posto de uma matriz"}'),
(1560, '{"op_c":"Método para resolver sistemas lineares utilizando determinantes","op_1":"Método para calcular matriz identidade","op_2":"Método para somar matrizes","op_3":"Método para calcular o determinante de uma matriz simétrica"}');

-- PERGUNTA 2
INSERT INTO Perguntas (materia_id, texto)
VALUES (31, 'Em que tipo de sistema o Teorema de Cramer pode ser aplicado?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"Sistemas lineares com número de equações igual ao número de incógnitas e determinante não nulo"}'),
(@pergunta_id, '{"v1":"Sistemas homogêneos"}'),
(@pergunta_id, '{"v1":"Sistemas com número de equações diferente do número de incógnitas"}'),
(@pergunta_id, '{"v1":"Sistemas com determinante igual a zero"}'),
(@pergunta_id, '{"v1":"Sistemas com infinitas soluções"}'),
(@pergunta_id, '{"v1":"Sistemas quadráticos"}'),
(@pergunta_id, '{"v1":"Sistemas impossíveis"}'),
(@pergunta_id, '{"v1":"Sistemas proporcionais"}'),
(@pergunta_id, '{"v1":"Sistemas com matriz identidade"}'),
(@pergunta_id, '{"v1":"Sistemas de ordem 3x2"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(1561, '{"op_c":"Sistemas lineares com número de equações igual ao número de incógnitas e determinante não nulo","op_1":"Sistemas homogêneos","op_2":"Sistemas com determinante igual a zero","op_3":"Sistemas quadráticos"}'),
(1562, '{"op_c":"Sistemas lineares com número de equações igual ao número de incógnitas e determinante não nulo","op_1":"Sistemas impossíveis","op_2":"Sistemas de ordem 3x2","op_3":"Sistemas com matriz identidade"}'),
(1563, '{"op_c":"Sistemas lineares com número de equações igual ao número de incógnitas e determinante não nulo","op_1":"Sistemas com infinitas soluções","op_2":"Sistemas proporcionais","op_3":"Sistemas homogêneos"}'),
(1564, '{"op_c":"Sistemas lineares com número de equações igual ao número de incógnitas e determinante não nulo","op_1":"Sistemas quadráticos","op_2":"Sistemas com determinante igual a zero","op_3":"Sistemas de ordem 3x2"}'),
(1565, '{"op_c":"Sistemas lineares com número de equações igual ao número de incógnitas e determinante não nulo","op_1":"Sistemas impossíveis","op_2":"Sistemas proporcionais","op_3":"Sistemas com matriz identidade"}'),
(1566, '{"op_c":"Sistemas lineares com número de equações igual ao número de incógnitas e determinante não nulo","op_1":"Sistemas com infinitas soluções","op_2":"Sistemas com determinante igual a zero","op_3":"Sistemas de ordem 3x2"}'),
(1567, '{"op_c":"Sistemas lineares com número de equações igual ao número de incógnitas e determinante não nulo","op_1":"Sistemas proporcionais","op_2":"Sistemas quadráticos","op_3":"Sistemas homogêneos"}'),
(1568, '{"op_c":"Sistemas lineares com número de equações igual ao número de incógnitas e determinante não nulo","op_1":"Sistemas impossíveis","op_2":"Sistemas com determinante igual a zero","op_3":"Sistemas quadráticos"}'),
(1569, '{"op_c":"Sistemas lineares com número de equações igual ao número de incógnitas e determinante não nulo","op_1":"Sistemas com infinitas soluções","op_2":"Sistemas de ordem 3x2","op_3":"Sistemas proporcionais"}'),
(1570, '{"op_c":"Sistemas lineares com número de equações igual ao número de incógnitas e determinante não nulo","op_1":"Sistemas com matriz identidade","op_2":"Sistemas impossíveis","op_3":"Sistemas quadráticos"}');

-- PERGUNTA 3
INSERT INTO Perguntas (materia_id, texto)
VALUES (31, 'Qual é a condição para que um sistema linear tenha solução única segundo o Teorema de Cramer?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"Determinante da matriz dos coeficientes diferente de zero"}'),
(@pergunta_id, '{"v1":"Determinante da matriz dos coeficientes igual a zero"}'),
(@pergunta_id, '{"v1":"Matriz dos coeficientes é simétrica"}'),
(@pergunta_id, '{"v1":"Soma dos determinantes igual a 1"}'),
(@pergunta_id, '{"v1":"Produto dos determinantes igual a zero"}'),
(@pergunta_id, '{"v1":"Traço da matriz igual a zero"}'),
(@pergunta_id, '{"v1":"Matriz é inversível"}'),
(@pergunta_id, '{"v1":"Matriz é nula"}'),
(@pergunta_id, '{"v1":"Matriz é triangular"}'),
(@pergunta_id, '{"v1":"Matriz é diagonal"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(1571, '{"op_c":"Determinante da matriz dos coeficientes diferente de zero","op_1":"Determinante da matriz dos coeficientes igual a zero","op_2":"Matriz dos coeficientes é simétrica","op_3":"Traço da matriz igual a zero"}'),
(1572, '{"op_c":"Determinante da matriz dos coeficientes diferente de zero","op_1":"Produto dos determinantes igual a zero","op_2":"Soma dos determinantes igual a 1","op_3":"Matriz é nula"}'),
(1573, '{"op_c":"Determinante da matriz dos coeficientes diferente de zero","op_1":"Matriz é triangular","op_2":"Matriz é diagonal","op_3":"Matriz é inversível"}'),
(1574, '{"op_c":"Determinante da matriz dos coeficientes diferente de zero","op_1":"Matriz é simétrica","op_2":"Matriz é nula","op_3":"Traço da matriz igual a zero"}'),
(1575, '{"op_c":"Determinante da matriz dos coeficientes diferente de zero","op_1":"Produto dos determinantes igual a zero","op_2":"Matriz é triangular","op_3":"Matriz é diagonal"}'),
(1576, '{"op_c":"Determinante da matriz dos coeficientes diferente de zero","op_1":"Soma dos determinantes igual a 1","op_2":"Matriz é nula","op_3":"Matriz é simétrica"}'),
(1577, '{"op_c":"Determinante da matriz dos coeficientes diferente de zero","op_1":"Matriz é inversível","op_2":"Matriz é triangular","op_3":"Traço da matriz igual a zero"}'),
(1578, '{"op_c":"Determinante da matriz dos coeficientes diferente de zero","op_1":"Matriz é nula","op_2":"Matriz é diagonal","op_3":"Produto dos determinantes igual a zero"}'),
(1579, '{"op_c":"Determinante da matriz dos coeficientes diferente de zero","op_1":"Matriz é simétrica","op_2":"Traço da matriz igual a zero","op_3":"Matriz é inversível"}'),
(1580, '{"op_c":"Determinante da matriz dos coeficientes diferente de zero","op_1":"Matriz é nula","op_2":"Soma dos determinantes igual a 1","op_3":"Matriz é triangular"}');

-- PERGUNTA 4
INSERT INTO Perguntas (materia_id, texto)
VALUES (31, 'Segundo o Teorema de Cramer, como se calcula o valor de uma incógnita xi em um sistema linear?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"xi = (determinante da matriz substituindo a coluna i pelos termos independentes) / (determinante da matriz dos coeficientes)"}'),
(@pergunta_id, '{"v1":"xi = determinante da matriz dos coeficientes × determinante substituído"}'),
(@pergunta_id, '{"v1":"xi = determinante da matriz dos coeficientes / determinante substituído"}'),
(@pergunta_id, '{"v1":"xi = determinante substituído + determinante da matriz"}'),
(@pergunta_id, '{"v1":"xi = determinante da matriz aumentada / determinante da matriz identidade"}'),
(@pergunta_id, '{"v1":"xi = determinante substituído - determinante original"}'),
(@pergunta_id, '{"v1":"xi = determinante da matriz oposta / determinante da matriz dos coeficientes"}'),
(@pergunta_id, '{"v1":"xi = determinante da matriz dos coeficientes / determinante da matriz aumentada"}'),
(@pergunta_id, '{"v1":"xi = determinante da matriz simétrica / determinante original"}'),
(@pergunta_id, '{"v1":"xi = determinante substituído × determinante original"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(1581, '{"op_c":"xi = (determinante da matriz substituindo a coluna i pelos termos independentes) / (determinante da matriz dos coeficientes)","op_1":"xi = determinante substituído - determinante original","op_2":"xi = determinante da matriz aumentada / determinante da matriz identidade","op_3":"xi = determinante substituído × determinante original"}'),
(1582, '{"op_c":"xi = (determinante da matriz substituindo a coluna i pelos termos independentes) / (determinante da matriz dos coeficientes)","op_1":"xi = determinante da matriz dos coeficientes × determinante substituído","op_2":"xi = determinante substituído + determinante da matriz","op_3":"xi = determinante substituído × determinante original"}'),
(1583, '{"op_c":"xi = (determinante da matriz substituindo a coluna i pelos termos independentes) / (determinante da matriz dos coeficientes)","op_1":"xi = determinante substituído - determinante original","op_2":"xi = determinante da matriz dos coeficientes / determinante substituído","op_3":"xi = determinante substituído + determinante da matriz"}'),
(1584, '{"op_c":"xi = (determinante da matriz substituindo a coluna i pelos termos independentes) / (determinante da matriz dos coeficientes)","op_1":"xi = determinante substituído × determinante original","op_2":"xi = determinante da matriz oposta / determinante da matriz dos coeficientes","op_3":"xi = determinante da matriz simétrica / determinante original"}'),
(1585, '{"op_c":"xi = (determinante da matriz substituindo a coluna i pelos termos independentes) / (determinante da matriz dos coeficientes)","op_1":"xi = determinante substituído + determinante da matriz","op_2":"xi = determinante da matriz aumentada / determinante da matriz identidade","op_3":"xi = determinante substituído - determinante original"}'),
(1586, '{"op_c":"xi = (determinante da matriz substituindo a coluna i pelos termos independentes) / (determinante da matriz dos coeficientes)","op_1":"xi = determinante da matriz dos coeficientes × determinante substituído","op_2":"xi = determinante substituído - determinante original","op_3":"xi = determinante da matriz simétrica / determinante original"}'),
(1587, '{"op_c":"xi = (determinante da matriz substituindo a coluna i pelos termos independentes) / (determinante da matriz dos coeficientes)","op_1":"xi = determinante substituído + determinante da matriz","op_2":"xi = determinante substituído × determinante original","op_3":"xi = determinante substituído - determinante original"}'),
(1588, '{"op_c":"xi = (determinante da matriz substituindo a coluna i pelos termos independentes) / (determinante da matriz dos coeficientes)","op_1":"xi = determinante da matriz dos coeficientes × determinante substituído","op_2":"xi = determinante substituído - determinante original","op_3":"xi = determinante da matriz aumentada / determinante da matriz identidade"}'),
(1589, '{"op_c":"xi = (determinante da matriz substituindo a coluna i pelos termos independentes) / (determinante da matriz dos coeficientes)","op_1":"xi = determinante da matriz simétrica / determinante original","op_2":"xi = determinante da matriz aumentada / determinante da matriz identidade","op_3":"xi = determinante substituído + determinante da matriz"}'),
(1590, '{"op_c":"xi = (determinante da matriz substituindo a coluna i pelos termos independentes) / (determinante da matriz dos coeficientes)","op_1":"xi = determinante substituído - determinante original","op_2":"xi = determinante substituído × determinante original","op_3":"xi = determinante da matriz oposta / determinante da matriz dos coeficientes"}');

-- PERGUNTA 5 (PRÁTICA)
INSERT INTO Perguntas (materia_id, texto)
VALUES (31, 'Resolva o sistema usando o Teorema de Cramer: v1 x + v2 y = v3 e v4 x + v5 y = v6.');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":1,"v2":2,"v3":8,"v4":3,"v5":4,"v6":18}'),
(@pergunta_id, '{"v1":2,"v2":1,"v3":5,"v4":1,"v5":3,"v6":7}'),
(@pergunta_id, '{"v1":1,"v2":1,"v3":4,"v4":2,"v5":3,"v6":9}'),
(@pergunta_id, '{"v1":3,"v2":2,"v3":11,"v4":1,"v5":4,"v6":9}'),
(@pergunta_id, '{"v1":2,"v2":3,"v3":13,"v4":1,"v5":1,"v6":5}'),
(@pergunta_id, '{"v1":1,"v2":4,"v3":10,"v4":2,"v5":3,"v6":11}'),
(@pergunta_id, '{"v1":4,"v2":3,"v3":18,"v4":2,"v5":1,"v6":8}'),
(@pergunta_id, '{"v1":3,"v2":1,"v3":7,"v4":2,"v5":4,"v6":14}'),
(@pergunta_id, '{"v1":2,"v2":2,"v3":10,"v4":1,"v5":3,"v6":9}'),
(@pergunta_id, '{"v1":1,"v2":3,"v3":9,"v4":2,"v5":2,"v6":8}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(1591, '{"op_c":"x=2, y=3","op_1":"x=3, y=2","op_2":"x=1, y=4","op_3":"x=4, y=1"}'),
(1592, '{"op_c":"x=1, y=3","op_1":"x=3, y=1","op_2":"x=2, y=2","op_3":"x=4, y=0"}'),
(1593, '{"op_c":"x=3, y=1","op_1":"x=2, y=2","op_2":"x=1, y=3","op_3":"x=0, y=4"}'),
(1594, '{"op_c":"x=2, y=2","op_1":"x=3, y=1","op_2":"x=1, y=3","op_3":"x=4, y=0"}'),
(1595, '{"op_c":"x=2, y=3","op_1":"x=1, y=4","op_2":"x=3, y=2","op_3":"x=0, y=5"}'),
(1596, '{"op_c":"x=2, y=2","op_1":"x=3, y=1","op_2":"x=1, y=3","op_3":"x=4, y=0"}'),
(1597, '{"op_c":"x=3, y=2","op_1":"x=2, y=3","op_2":"x=1, y=4","op_3":"x=4, y=1"}'),
(1598, '{"op_c":"x=2, y=2","op_1":"x=3, y=1","op_2":"x=1, y=3","op_3":"x=4, y=0"}'),
(1599, '{"op_c":"x=2, y=2","op_1":"x=1, y=3","op_2":"x=3, y=1","op_3":"x=4, y=0"}'),
(1600, '{"op_c":"x=2, y=1","op_1":"x=1, y=2","op_2":"x=3, y=0","op_3":"x=0, y=3"}');

-- ==========================================
-- ESCALONAMENTO (materia_id = 32)
-- ==========================================

-- PERGUNTA 1
INSERT INTO Perguntas (materia_id, texto)
VALUES (32, 'O que é o processo de escalonamento em um sistema linear?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"Transformar o sistema em uma forma equivalente triangular para facilitar a resolução"}'),
(@pergunta_id, '{"v1":"Multiplicar todas as equações por um número qualquer"}'),
(@pergunta_id, '{"v1":"Somar os determinantes de todas as matrizes"}'),
(@pergunta_id, '{"v1":"Subtrair o traço da matriz dos coeficientes"}'),
(@pergunta_id, '{"v1":"Inverter a matriz identidade"}'),
(@pergunta_id, '{"v1":"Transformar a matriz em diagonal unitária"}'),
(@pergunta_id, '{"v1":"Multiplicar colunas por constantes diferentes"}'),
(@pergunta_id, '{"v1":"Eliminar colunas de zeros"}'),
(@pergunta_id, '{"v1":"Substituir as linhas por colunas"}'),
(@pergunta_id, '{"v1":"Resolver o sistema sem alterar sua forma original"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(1601, '{"op_c":"Transformar o sistema em uma forma equivalente triangular para facilitar a resolução","op_1":"Multiplicar todas as equações por um número qualquer","op_2":"Somar os determinantes de todas as matrizes","op_3":"Inverter a matriz identidade"}'),
(1602, '{"op_c":"Transformar o sistema em uma forma equivalente triangular para facilitar a resolução","op_1":"Substituir as linhas por colunas","op_2":"Multiplicar colunas por constantes diferentes","op_3":"Subtrair o traço da matriz dos coeficientes"}'),
(1603, '{"op_c":"Transformar o sistema em uma forma equivalente triangular para facilitar a resolução","op_1":"Transformar a matriz em diagonal unitária","op_2":"Eliminar colunas de zeros","op_3":"Somar os determinantes de todas as matrizes"}'),
(1604, '{"op_c":"Transformar o sistema em uma forma equivalente triangular para facilitar a resolução","op_1":"Multiplicar todas as equações por um número qualquer","op_2":"Resolver o sistema sem alterar sua forma original","op_3":"Substituir as linhas por colunas"}'),
(1605, '{"op_c":"Transformar o sistema em uma forma equivalente triangular para facilitar a resolução","op_1":"Multiplicar colunas por constantes diferentes","op_2":"Inverter a matriz identidade","op_3":"Eliminar colunas de zeros"}'),
(1606, '{"op_c":"Transformar o sistema em uma forma equivalente triangular para facilitar a resolução","op_1":"Substituir as linhas por colunas","op_2":"Resolver o sistema sem alterar sua forma original","op_3":"Subtrair o traço da matriz dos coeficientes"}'),
(1607, '{"op_c":"Transformar o sistema em uma forma equivalente triangular para facilitar a resolução","op_1":"Somar os determinantes de todas as matrizes","op_2":"Inverter a matriz identidade","op_3":"Transformar a matriz em diagonal unitária"}'),
(1608, '{"op_c":"Transformar o sistema em uma forma equivalente triangular para facilitar a resolução","op_1":"Multiplicar colunas por constantes diferentes","op_2":"Substituir as linhas por colunas","op_3":"Resolver o sistema sem alterar sua forma original"}'),
(1609, '{"op_c":"Transformar o sistema em uma forma equivalente triangular para facilitar a resolução","op_1":"Somar os determinantes de todas as matrizes","op_2":"Eliminar colunas de zeros","op_3":"Multiplicar todas as equações por um número qualquer"}'),
(1610, '{"op_c":"Transformar o sistema em uma forma equivalente triangular para facilitar a resolução","op_1":"Resolver o sistema sem alterar sua forma original","op_2":"Transformar a matriz em diagonal unitária","op_3":"Substituir as linhas por colunas"}');

-- PERGUNTA 2
INSERT INTO Perguntas (materia_id, texto)
VALUES (32, 'Qual é o principal objetivo do escalonamento de um sistema linear?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"Facilitar a obtenção das soluções por meio de substituições sucessivas"}'),
(@pergunta_id, '{"v1":"Aumentar o número de equações"}'),
(@pergunta_id, '{"v1":"Diminuir o número de incógnitas"}'),
(@pergunta_id, '{"v1":"Obter o determinante da matriz"}'),
(@pergunta_id, '{"v1":"Eliminar as soluções"}'),
(@pergunta_id, '{"v1":"Calcular o traço da matriz"}'),
(@pergunta_id, '{"v1":"Gerar uma matriz simétrica"}'),
(@pergunta_id, '{"v1":"Zerar o determinante"}'),
(@pergunta_id, '{"v1":"Transformar a matriz em identidade"}'),
(@pergunta_id, '{"v1":"Obter as autossoluções"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(1611, '{"op_c":"Facilitar a obtenção das soluções por meio de substituições sucessivas","op_1":"Diminuir o número de incógnitas","op_2":"Aumentar o número de equações","op_3":"Calcular o traço da matriz"}'),
(1612, '{"op_c":"Facilitar a obtenção das soluções por meio de substituições sucessivas","op_1":"Obter o determinante da matriz","op_2":"Eliminar as soluções","op_3":"Gerar uma matriz simétrica"}'),
(1613, '{"op_c":"Facilitar a obtenção das soluções por meio de substituições sucessivas","op_1":"Zerar o determinante","op_2":"Transformar a matriz em identidade","op_3":"Obter as autossoluções"}'),
(1614, '{"op_c":"Facilitar a obtenção das soluções por meio de substituições sucessivas","op_1":"Gerar uma matriz simétrica","op_2":"Diminuir o número de incógnitas","op_3":"Calcular o traço da matriz"}'),
(1615, '{"op_c":"Facilitar a obtenção das soluções por meio de substituições sucessivas","op_1":"Zerar o determinante","op_2":"Eliminar as soluções","op_3":"Obter o determinante da matriz"}'),
(1616, '{"op_c":"Facilitar a obtenção das soluções por meio de substituições sucessivas","op_1":"Aumentar o número de equações","op_2":"Gerar uma matriz simétrica","op_3":"Calcular o traço da matriz"}'),
(1617, '{"op_c":"Facilitar a obtenção das soluções por meio de substituições sucessivas","op_1":"Zerar o determinante","op_2":"Eliminar as soluções","op_3":"Transformar a matriz em identidade"}'),
(1618, '{"op_c":"Facilitar a obtenção das soluções por meio de substituições sucessivas","op_1":"Diminuir o número de incógnitas","op_2":"Gerar uma matriz simétrica","op_3":"Obter as autossoluções"}'),
(1619, '{"op_c":"Facilitar a obtenção das soluções por meio de substituições sucessivas","op_1":"Zerar o determinante","op_2":"Aumentar o número de equações","op_3":"Calcular o traço da matriz"}'),
(1620, '{"op_c":"Facilitar a obtenção das soluções por meio de substituições sucessivas","op_1":"Gerar uma matriz simétrica","op_2":"Eliminar as soluções","op_3":"Transformar a matriz em identidade"}');

-- PERGUNTA 3
INSERT INTO Perguntas (materia_id, texto)
VALUES (32, 'Quais são as operações elementares utilizadas no processo de escalonamento?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"Trocar linhas, multiplicar uma linha por um número diferente de zero e somar linhas proporcionais"}'),
(@pergunta_id, '{"v1":"Trocar colunas e eliminar determinantes"}'),
(@pergunta_id, '{"v1":"Substituir linhas por colunas"}'),
(@pergunta_id, '{"v1":"Multiplicar colunas por zero"}'),
(@pergunta_id, '{"v1":"Somar todas as colunas"}'),
(@pergunta_id, '{"v1":"Eliminar os elementos da diagonal"}'),
(@pergunta_id, '{"v1":"Adicionar linhas sem alterar o sistema"}'),
(@pergunta_id, '{"v1":"Trocar o traço por determinante"}'),
(@pergunta_id, '{"v1":"Multiplicar toda a matriz por zero"}'),
(@pergunta_id, '{"v1":"Subtrair colunas de linhas"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(1621, '{"op_c":"Trocar linhas, multiplicar uma linha por um número diferente de zero e somar linhas proporcionais","op_1":"Substituir linhas por colunas","op_2":"Somar todas as colunas","op_3":"Multiplicar colunas por zero"}'),
(1622, '{"op_c":"Trocar linhas, multiplicar uma linha por um número diferente de zero e somar linhas proporcionais","op_1":"Trocar colunas e eliminar determinantes","op_2":"Multiplicar toda a matriz por zero","op_3":"Eliminar os elementos da diagonal"}'),
(1623, '{"op_c":"Trocar linhas, multiplicar uma linha por um número diferente de zero e somar linhas proporcionais","op_1":"Substituir linhas por colunas","op_2":"Adicionar linhas sem alterar o sistema","op_3":"Trocar o traço por determinante"}'),
(1624, '{"op_c":"Trocar linhas, multiplicar uma linha por um número diferente de zero e somar linhas proporcionais","op_1":"Trocar o traço por determinante","op_2":"Multiplicar colunas por zero","op_3":"Subtrair colunas de linhas"}'),
(1625, '{"op_c":"Trocar linhas, multiplicar uma linha por um número diferente de zero e somar linhas proporcionais","op_1":"Somar todas as colunas","op_2":"Eliminar os elementos da diagonal","op_3":"Trocar colunas e eliminar determinantes"}'),
(1626, '{"op_c":"Trocar linhas, multiplicar uma linha por um número diferente de zero e somar linhas proporcionais","op_1":"Adicionar linhas sem alterar o sistema","op_2":"Trocar o traço por determinante","op_3":"Multiplicar toda a matriz por zero"}'),
(1627, '{"op_c":"Trocar linhas, multiplicar uma linha por um número diferente de zero e somar linhas proporcionais","op_1":"Substituir linhas por colunas","op_2":"Subtrair colunas de linhas","op_3":"Multiplicar colunas por zero"}'),
(1628, '{"op_c":"Trocar linhas, multiplicar uma linha por um número diferente de zero e somar linhas proporcionais","op_1":"Somar todas as colunas","op_2":"Eliminar os elementos da diagonal","op_3":"Trocar colunas e eliminar determinantes"}'),
(1629, '{"op_c":"Trocar linhas, multiplicar uma linha por um número diferente de zero e somar linhas proporcionais","op_1":"Multiplicar toda a matriz por zero","op_2":"Adicionar linhas sem alterar o sistema","op_3":"Substituir linhas por colunas"}'),
(1630, '{"op_c":"Trocar linhas, multiplicar uma linha por um número diferente de zero e somar linhas proporcionais","op_1":"Trocar colunas e eliminar determinantes","op_2":"Trocar o traço por determinante","op_3":"Somar todas as colunas"}');

-- PERGUNTA 4
INSERT INTO Perguntas (materia_id, texto)
VALUES (32, 'Em qual forma o sistema linear deve estar ao final do escalonamento para encontrar as soluções facilmente?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"Forma triangular superior"}'),
(@pergunta_id, '{"v1":"Forma quadrática"}'),
(@pergunta_id, '{"v1":"Forma simétrica"}'),
(@pergunta_id, '{"v1":"Forma diagonal inferior"}'),
(@pergunta_id, '{"v1":"Forma retangular"}'),
(@pergunta_id, '{"v1":"Forma de determinante nulo"}'),
(@pergunta_id, '{"v1":"Forma de matriz identidade"}'),
(@pergunta_id, '{"v1":"Forma aumentada nula"}'),
(@pergunta_id, '{"v1":"Forma com traço zero"}'),
(@pergunta_id, '{"v1":"Forma inversa"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(1631, '{"op_c":"Forma triangular superior","op_1":"Forma quadrática","op_2":"Forma simétrica","op_3":"Forma diagonal inferior"}'),
(1632, '{"op_c":"Forma triangular superior","op_1":"Forma retangular","op_2":"Forma inversa","op_3":"Forma com traço zero"}'),
(1633, '{"op_c":"Forma triangular superior","op_1":"Forma de matriz identidade","op_2":"Forma aumentada nula","op_3":"Forma simétrica"}'),
(1634, '{"op_c":"Forma triangular superior","op_1":"Forma quadrática","op_2":"Forma de determinante nulo","op_3":"Forma inversa"}'),
(1635, '{"op_c":"Forma triangular superior","op_1":"Forma diagonal inferior","op_2":"Forma aumentada nula","op_3":"Forma de matriz identidade"}'),
(1636, '{"op_c":"Forma triangular superior","op_1":"Forma quadrática","op_2":"Forma de determinante nulo","op_3":"Forma simétrica"}'),
(1637, '{"op_c":"Forma triangular superior","op_1":"Forma aumentada nula","op_2":"Forma com traço zero","op_3":"Forma inversa"}'),
(1638, '{"op_c":"Forma triangular superior","op_1":"Forma diagonal inferior","op_2":"Forma retangular","op_3":"Forma de matriz identidade"}'),
(1639, '{"op_c":"Forma triangular superior","op_1":"Forma aumentada nula","op_2":"Forma simétrica","op_3":"Forma de determinante nulo"}'),
(1640, '{"op_c":"Forma triangular superior","op_1":"Forma quadrática","op_2":"Forma inversa","op_3":"Forma com traço zero"}');

-- ==========================================
-- PERGUNTA 5 — ESCALONAMENTO (PRÁTICA)
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (32, 'Resolva o seguinte sistema linear por escalonamento: v1 x + v2 y = v3 e v4 x + v5 y = v6 .');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":1,"v2":2,"v3":8,"v4":2,"v5":1,"v6":7}'),
(@pergunta_id, '{"v1":1,"v2":3,"v3":9,"v4":2,"v5":4,"v6":14}'),
(@pergunta_id, '{"v1":2,"v2":1,"v3":5,"v4":3,"v5":2,"v6":9}'),
(@pergunta_id, '{"v1":1,"v2":1,"v3":4,"v4":2,"v5":3,"v6":10}'),
(@pergunta_id, '{"v1":2,"v2":3,"v3":13,"v4":1,"v5":2,"v6":7}'),
(@pergunta_id, '{"v1":3,"v2":2,"v3":11,"v4":1,"v5":1,"v6":4}'),
(@pergunta_id, '{"v1":2,"v2":1,"v3":6,"v4":1,"v5":3,"v6":9}'),
(@pergunta_id, '{"v1":1,"v2":4,"v3":10,"v4":2,"v5":3,"v6":11}'),
(@pergunta_id, '{"v1":3,"v2":1,"v3":7,"v4":2,"v5":2,"v6":8}'),
(@pergunta_id, '{"v1":4,"v2":3,"v3":17,"v4":2,"v5":1,"v6":7}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(1641, '{"op_c":"x=3, y=2","op_1":"x=2, y=3","op_2":"x=1, y=4","op_3":"x=4, y=1"}'),
(1642, '{"op_c":"x=1, y=3","op_1":"x=3, y=1","op_2":"x=2, y=2","op_3":"x=4, y=0"}'),
(1643, '{"op_c":"x=1, y=3","op_1":"x=3, y=1","op_2":"x=2, y=2","op_3":"x=4, y=0"}'),
(1644, '{"op_c":"x=2, y=2","op_1":"x=3, y=1","op_2":"x=1, y=3","op_3":"x=4, y=0"}'),
(1645, '{"op_c":"x=2, y=3","op_1":"x=1, y=4","op_2":"x=3, y=2","op_3":"x=0, y=5"}'),
(1646, '{"op_c":"x=3, y=1","op_1":"x=2, y=2","op_2":"x=1, y=3","op_3":"x=4, y=0"}'),
(1647, '{"op_c":"x=1, y=3","op_1":"x=3, y=1","op_2":"x=2, y=2","op_3":"x=0, y=4"}'),
(1648, '{"op_c":"x=2, y=2","op_1":"x=3, y=1","op_2":"x=1, y=3","op_3":"x=4, y=0"}'),
(1649, '{"op_c":"x=2, y=1","op_1":"x=1, y=2","op_2":"x=3, y=0","op_3":"x=0, y=3"}'),
(1650, '{"op_c":"x=3, y=2","op_1":"x=2, y=3","op_2":"x=1, y=4","op_3":"x=4, y=1"}');

-- ==========================================
-- ESCALONAMENTO (materia_id = 32)
-- ==========================================

-- PERGUNTA 1
INSERT INTO Perguntas (materia_id, texto)
VALUES (32, 'O que é o processo de escalonamento em um sistema linear?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"Transformar o sistema em uma forma equivalente triangular para facilitar a resolução"}'),
(@pergunta_id, '{"v1":"Multiplicar todas as equações por um número qualquer"}'),
(@pergunta_id, '{"v1":"Somar os determinantes de todas as matrizes"}'),
(@pergunta_id, '{"v1":"Subtrair o traço da matriz dos coeficientes"}'),
(@pergunta_id, '{"v1":"Inverter a matriz identidade"}'),
(@pergunta_id, '{"v1":"Transformar a matriz em diagonal unitária"}'),
(@pergunta_id, '{"v1":"Multiplicar colunas por constantes diferentes"}'),
(@pergunta_id, '{"v1":"Eliminar colunas de zeros"}'),
(@pergunta_id, '{"v1":"Substituir as linhas por colunas"}'),
(@pergunta_id, '{"v1":"Resolver o sistema sem alterar sua forma original"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(1601, '{"op_c":"Transformar o sistema em uma forma equivalente triangular para facilitar a resolução","op_1":"Multiplicar todas as equações por um número qualquer","op_2":"Somar os determinantes de todas as matrizes","op_3":"Inverter a matriz identidade"}'),
(1602, '{"op_c":"Transformar o sistema em uma forma equivalente triangular para facilitar a resolução","op_1":"Substituir as linhas por colunas","op_2":"Multiplicar colunas por constantes diferentes","op_3":"Subtrair o traço da matriz dos coeficientes"}'),
(1603, '{"op_c":"Transformar o sistema em uma forma equivalente triangular para facilitar a resolução","op_1":"Transformar a matriz em diagonal unitária","op_2":"Eliminar colunas de zeros","op_3":"Somar os determinantes de todas as matrizes"}'),
(1604, '{"op_c":"Transformar o sistema em uma forma equivalente triangular para facilitar a resolução","op_1":"Multiplicar todas as equações por um número qualquer","op_2":"Resolver o sistema sem alterar sua forma original","op_3":"Substituir as linhas por colunas"}'),
(1605, '{"op_c":"Transformar o sistema em uma forma equivalente triangular para facilitar a resolução","op_1":"Multiplicar colunas por constantes diferentes","op_2":"Inverter a matriz identidade","op_3":"Eliminar colunas de zeros"}'),
(1606, '{"op_c":"Transformar o sistema em uma forma equivalente triangular para facilitar a resolução","op_1":"Substituir as linhas por colunas","op_2":"Resolver o sistema sem alterar sua forma original","op_3":"Subtrair o traço da matriz dos coeficientes"}'),
(1607, '{"op_c":"Transformar o sistema em uma forma equivalente triangular para facilitar a resolução","op_1":"Somar os determinantes de todas as matrizes","op_2":"Inverter a matriz identidade","op_3":"Transformar a matriz em diagonal unitária"}'),
(1608, '{"op_c":"Transformar o sistema em uma forma equivalente triangular para facilitar a resolução","op_1":"Multiplicar colunas por constantes diferentes","op_2":"Substituir as linhas por colunas","op_3":"Resolver o sistema sem alterar sua forma original"}'),
(1609, '{"op_c":"Transformar o sistema em uma forma equivalente triangular para facilitar a resolução","op_1":"Somar os determinantes de todas as matrizes","op_2":"Eliminar colunas de zeros","op_3":"Multiplicar todas as equações por um número qualquer"}'),
(1610, '{"op_c":"Transformar o sistema em uma forma equivalente triangular para facilitar a resolução","op_1":"Resolver o sistema sem alterar sua forma original","op_2":"Transformar a matriz em diagonal unitária","op_3":"Substituir as linhas por colunas"}');

-- PERGUNTA 2
INSERT INTO Perguntas (materia_id, texto)
VALUES (32, 'Qual é o principal objetivo do escalonamento de um sistema linear?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"Facilitar a obtenção das soluções por meio de substituições sucessivas"}'),
(@pergunta_id, '{"v1":"Aumentar o número de equações"}'),
(@pergunta_id, '{"v1":"Diminuir o número de incógnitas"}'),
(@pergunta_id, '{"v1":"Obter o determinante da matriz"}'),
(@pergunta_id, '{"v1":"Eliminar as soluções"}'),
(@pergunta_id, '{"v1":"Calcular o traço da matriz"}'),
(@pergunta_id, '{"v1":"Gerar uma matriz simétrica"}'),
(@pergunta_id, '{"v1":"Zerar o determinante"}'),
(@pergunta_id, '{"v1":"Transformar a matriz em identidade"}'),
(@pergunta_id, '{"v1":"Obter as autossoluções"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(1611, '{"op_c":"Facilitar a obtenção das soluções por meio de substituições sucessivas","op_1":"Diminuir o número de incógnitas","op_2":"Aumentar o número de equações","op_3":"Calcular o traço da matriz"}'),
(1612, '{"op_c":"Facilitar a obtenção das soluções por meio de substituições sucessivas","op_1":"Obter o determinante da matriz","op_2":"Eliminar as soluções","op_3":"Gerar uma matriz simétrica"}'),
(1613, '{"op_c":"Facilitar a obtenção das soluções por meio de substituições sucessivas","op_1":"Zerar o determinante","op_2":"Transformar a matriz em identidade","op_3":"Obter as autossoluções"}'),
(1614, '{"op_c":"Facilitar a obtenção das soluções por meio de substituições sucessivas","op_1":"Gerar uma matriz simétrica","op_2":"Diminuir o número de incógnitas","op_3":"Calcular o traço da matriz"}'),
(1615, '{"op_c":"Facilitar a obtenção das soluções por meio de substituições sucessivas","op_1":"Zerar o determinante","op_2":"Eliminar as soluções","op_3":"Obter o determinante da matriz"}'),
(1616, '{"op_c":"Facilitar a obtenção das soluções por meio de substituições sucessivas","op_1":"Aumentar o número de equações","op_2":"Gerar uma matriz simétrica","op_3":"Calcular o traço da matriz"}'),
(1617, '{"op_c":"Facilitar a obtenção das soluções por meio de substituições sucessivas","op_1":"Zerar o determinante","op_2":"Eliminar as soluções","op_3":"Transformar a matriz em identidade"}'),
(1618, '{"op_c":"Facilitar a obtenção das soluções por meio de substituições sucessivas","op_1":"Diminuir o número de incógnitas","op_2":"Gerar uma matriz simétrica","op_3":"Obter as autossoluções"}'),
(1619, '{"op_c":"Facilitar a obtenção das soluções por meio de substituições sucessivas","op_1":"Zerar o determinante","op_2":"Aumentar o número de equações","op_3":"Calcular o traço da matriz"}'),
(1620, '{"op_c":"Facilitar a obtenção das soluções por meio de substituições sucessivas","op_1":"Gerar uma matriz simétrica","op_2":"Eliminar as soluções","op_3":"Transformar a matriz em identidade"}');

-- PERGUNTA 3
INSERT INTO Perguntas (materia_id, texto)
VALUES (32, 'Quais são as operações elementares utilizadas no processo de escalonamento?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"Trocar linhas, multiplicar uma linha por um número diferente de zero e somar linhas proporcionais"}'),
(@pergunta_id, '{"v1":"Trocar colunas e eliminar determinantes"}'),
(@pergunta_id, '{"v1":"Substituir linhas por colunas"}'),
(@pergunta_id, '{"v1":"Multiplicar colunas por zero"}'),
(@pergunta_id, '{"v1":"Somar todas as colunas"}'),
(@pergunta_id, '{"v1":"Eliminar os elementos da diagonal"}'),
(@pergunta_id, '{"v1":"Adicionar linhas sem alterar o sistema"}'),
(@pergunta_id, '{"v1":"Trocar o traço por determinante"}'),
(@pergunta_id, '{"v1":"Multiplicar toda a matriz por zero"}'),
(@pergunta_id, '{"v1":"Subtrair colunas de linhas"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(1621, '{"op_c":"Trocar linhas, multiplicar uma linha por um número diferente de zero e somar linhas proporcionais","op_1":"Substituir linhas por colunas","op_2":"Somar todas as colunas","op_3":"Multiplicar colunas por zero"}'),
(1622, '{"op_c":"Trocar linhas, multiplicar uma linha por um número diferente de zero e somar linhas proporcionais","op_1":"Trocar colunas e eliminar determinantes","op_2":"Multiplicar toda a matriz por zero","op_3":"Eliminar os elementos da diagonal"}'),
(1623, '{"op_c":"Trocar linhas, multiplicar uma linha por um número diferente de zero e somar linhas proporcionais","op_1":"Substituir linhas por colunas","op_2":"Adicionar linhas sem alterar o sistema","op_3":"Trocar o traço por determinante"}'),
(1624, '{"op_c":"Trocar linhas, multiplicar uma linha por um número diferente de zero e somar linhas proporcionais","op_1":"Trocar o traço por determinante","op_2":"Multiplicar colunas por zero","op_3":"Subtrair colunas de linhas"}'),
(1625, '{"op_c":"Trocar linhas, multiplicar uma linha por um número diferente de zero e somar linhas proporcionais","op_1":"Somar todas as colunas","op_2":"Eliminar os elementos da diagonal","op_3":"Trocar colunas e eliminar determinantes"}'),
(1626, '{"op_c":"Trocar linhas, multiplicar uma linha por um número diferente de zero e somar linhas proporcionais","op_1":"Adicionar linhas sem alterar o sistema","op_2":"Trocar o traço por determinante","op_3":"Multiplicar toda a matriz por zero"}'),
(1627, '{"op_c":"Trocar linhas, multiplicar uma linha por um número diferente de zero e somar linhas proporcionais","op_1":"Substituir linhas por colunas","op_2":"Subtrair colunas de linhas","op_3":"Multiplicar colunas por zero"}'),
(1628, '{"op_c":"Trocar linhas, multiplicar uma linha por um número diferente de zero e somar linhas proporcionais","op_1":"Somar todas as colunas","op_2":"Eliminar os elementos da diagonal","op_3":"Trocar colunas e eliminar determinantes"}'),
(1629, '{"op_c":"Trocar linhas, multiplicar uma linha por um número diferente de zero e somar linhas proporcionais","op_1":"Multiplicar toda a matriz por zero","op_2":"Adicionar linhas sem alterar o sistema","op_3":"Substituir linhas por colunas"}'),
(1630, '{"op_c":"Trocar linhas, multiplicar uma linha por um número diferente de zero e somar linhas proporcionais","op_1":"Trocar colunas e eliminar determinantes","op_2":"Trocar o traço por determinante","op_3":"Somar todas as colunas"}');

-- PERGUNTA 4
INSERT INTO Perguntas (materia_id, texto)
VALUES (32, 'Em qual forma o sistema linear deve estar ao final do escalonamento para encontrar as soluções facilmente?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"Forma triangular superior"}'),
(@pergunta_id, '{"v1":"Forma quadrática"}'),
(@pergunta_id, '{"v1":"Forma simétrica"}'),
(@pergunta_id, '{"v1":"Forma diagonal inferior"}'),
(@pergunta_id, '{"v1":"Forma retangular"}'),
(@pergunta_id, '{"v1":"Forma de determinante nulo"}'),
(@pergunta_id, '{"v1":"Forma de matriz identidade"}'),
(@pergunta_id, '{"v1":"Forma aumentada nula"}'),
(@pergunta_id, '{"v1":"Forma com traço zero"}'),
(@pergunta_id, '{"v1":"Forma inversa"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(1631, '{"op_c":"Forma triangular superior","op_1":"Forma quadrática","op_2":"Forma simétrica","op_3":"Forma diagonal inferior"}'),
(1632, '{"op_c":"Forma triangular superior","op_1":"Forma retangular","op_2":"Forma inversa","op_3":"Forma com traço zero"}'),
(1633, '{"op_c":"Forma triangular superior","op_1":"Forma de matriz identidade","op_2":"Forma aumentada nula","op_3":"Forma simétrica"}'),
(1634, '{"op_c":"Forma triangular superior","op_1":"Forma quadrática","op_2":"Forma de determinante nulo","op_3":"Forma inversa"}'),
(1635, '{"op_c":"Forma triangular superior","op_1":"Forma diagonal inferior","op_2":"Forma aumentada nula","op_3":"Forma de matriz identidade"}'),
(1636, '{"op_c":"Forma triangular superior","op_1":"Forma quadrática","op_2":"Forma de determinante nulo","op_3":"Forma simétrica"}'),
(1637, '{"op_c":"Forma triangular superior","op_1":"Forma aumentada nula","op_2":"Forma com traço zero","op_3":"Forma inversa"}'),
(1638, '{"op_c":"Forma triangular superior","op_1":"Forma diagonal inferior","op_2":"Forma retangular","op_3":"Forma de matriz identidade"}'),
(1639, '{"op_c":"Forma triangular superior","op_1":"Forma aumentada nula","op_2":"Forma simétrica","op_3":"Forma de determinante nulo"}'),
(1640, '{"op_c":"Forma triangular superior","op_1":"Forma quadrática","op_2":"Forma inversa","op_3":"Forma com traço zero"}');

-- ==========================================
-- PERGUNTA 4
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (33, 'Qual é a relação entre a solução trivial e a solução não trivial em um sistema homogêneo?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"A solução trivial sempre existe, e a não trivial existe apenas se o determinante for zero"}'),
(@pergunta_id, '{"v1":"A solução não trivial sempre existe, e a trivial nunca"}'),
(@pergunta_id, '{"v1":"Ambas as soluções existem simultaneamente"}'),
(@pergunta_id, '{"v1":"A solução trivial existe apenas se o determinante for zero"}'),
(@pergunta_id, '{"v1":"A solução não trivial depende da matriz identidade"}'),
(@pergunta_id, '{"v1":"A solução trivial é exclusiva de sistemas impossíveis"}'),
(@pergunta_id, '{"v1":"A solução trivial existe apenas em sistemas quadráticos"}'),
(@pergunta_id, '{"v1":"A solução não trivial ocorre quando o determinante é diferente de zero"}'),
(@pergunta_id, '{"v1":"As soluções triviais e não triviais são equivalentes"}'),
(@pergunta_id, '{"v1":"Nenhuma das duas existe em sistemas homogêneos"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(1681, '{"op_c":"A solução trivial sempre existe, e a não trivial existe apenas se o determinante for zero","op_1":"A solução não trivial ocorre quando o determinante é diferente de zero","op_2":"Ambas as soluções existem simultaneamente","op_3":"A solução trivial existe apenas se o determinante for zero"}'),
(1682, '{"op_c":"A solução trivial sempre existe, e a não trivial existe apenas se o determinante for zero","op_1":"A solução trivial é exclusiva de sistemas impossíveis","op_2":"As soluções triviais e não triviais são equivalentes","op_3":"A solução não trivial sempre existe, e a trivial nunca"}'),
(1683, '{"op_c":"A solução trivial sempre existe, e a não trivial existe apenas se o determinante for zero","op_1":"A solução trivial existe apenas em sistemas quadráticos","op_2":"A solução não trivial depende da matriz identidade","op_3":"Nenhuma das duas existe em sistemas homogêneos"}'),
(1684, '{"op_c":"A solução trivial sempre existe, e a não trivial existe apenas se o determinante for zero","op_1":"A solução trivial é exclusiva de sistemas impossíveis","op_2":"A solução não trivial ocorre quando o determinante é diferente de zero","op_3":"Ambas as soluções existem simultaneamente"}'),
(1685, '{"op_c":"A solução trivial sempre existe, e a não trivial existe apenas se o determinante for zero","op_1":"A solução não trivial sempre existe, e a trivial nunca","op_2":"Nenhuma das duas existe em sistemas homogêneos","op_3":"As soluções triviais e não triviais são equivalentes"}'),
(1686, '{"op_c":"A solução trivial sempre existe, e a não trivial existe apenas se o determinante for zero","op_1":"A solução não trivial depende da matriz identidade","op_2":"A solução trivial existe apenas se o determinante for zero","op_3":"A solução trivial é exclusiva de sistemas impossíveis"}'),
(1687, '{"op_c":"A solução trivial sempre existe, e a não trivial existe apenas se o determinante for zero","op_1":"A solução não trivial ocorre quando o determinante é diferente de zero","op_2":"Ambas as soluções existem simultaneamente","op_3":"Nenhuma das duas existe em sistemas homogêneos"}'),
(1688, '{"op_c":"A solução trivial sempre existe, e a não trivial existe apenas se o determinante for zero","op_1":"A solução trivial existe apenas em sistemas quadráticos","op_2":"A solução trivial é exclusiva de sistemas impossíveis","op_3":"As soluções triviais e não triviais são equivalentes"}'),
(1689, '{"op_c":"A solução trivial sempre existe, e a não trivial existe apenas se o determinante for zero","op_1":"A solução não trivial depende da matriz identidade","op_2":"A solução não trivial ocorre quando o determinante é diferente de zero","op_3":"A solução trivial existe apenas se o determinante for zero"}'),
(1690, '{"op_c":"A solução trivial sempre existe, e a não trivial existe apenas se o determinante for zero","op_1":"A solução não trivial sempre existe, e a trivial nunca","op_2":"Ambas as soluções existem simultaneamente","op_3":"Nenhuma das duas existe em sistemas homogêneos"}');

-- ==========================================
-- PERGUNTA 5 (PRÁTICA)
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (33, 'Resolva o sistema homogêneo: v1 x + v2 y = 0 e v3 x + v4 y = 0.');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":1,"v2":2,"v3":2,"v4":4}'),
(@pergunta_id, '{"v1":1,"v2":3,"v3":2,"v4":6}'),
(@pergunta_id, '{"v1":2,"v2":1,"v3":4,"v4":2}'),
(@pergunta_id, '{"v1":3,"v2":1,"v3":6,"v4":2}'),
(@pergunta_id, '{"v1":1,"v2":1,"v3":2,"v4":2}'),
(@pergunta_id, '{"v1":2,"v2":3,"v3":4,"v4":6}'),
(@pergunta_id, '{"v1":3,"v2":2,"v3":6,"v4":4}'),
(@pergunta_id, '{"v1":1,"v2":4,"v3":2,"v4":8}'),
(@pergunta_id, '{"v1":2,"v2":5,"v3":4,"v4":10}'),
(@pergunta_id, '{"v1":1,"v2":-1,"v3":2,"v4":-2}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(1691, '{"op_c":"Infinitas soluções (x,y) = t(-2,1)","op_1":"x=0, y=0","op_2":"x=1, y=2","op_3":"x=2, y=1"}'),
(1692, '{"op_c":"Infinitas soluções (x,y) = t(-3,1)","op_1":"x=0, y=0","op_2":"x=1, y=3","op_3":"x=3, y=1"}'),
(1693, '{"op_c":"Infinitas soluções (x,y) = t(-1,2)","op_1":"x=0, y=0","op_2":"x=2, y=1","op_3":"x=1, y=2"}'),
(1694, '{"op_c":"Infinitas soluções (x,y) = t(-1,3)","op_1":"x=0, y=0","op_2":"x=3, y=1","op_3":"x=1, y=3"}'),
(1695, '{"op_c":"Infinitas soluções (x,y) = t(-1,1)","op_1":"x=0, y=0","op_2":"x=1, y=1","op_3":"x=1, y=-1"}'),
(1696, '{"op_c":"Infinitas soluções (x,y) = t(-3,2)","op_1":"x=0, y=0","op_2":"x=3, y=2","op_3":"x=2, y=3"}'),
(1697, '{"op_c":"Infinitas soluções (x,y) = t(-2,3)","op_1":"x=0, y=0","op_2":"x=3, y=2","op_3":"x=1, y=3"}'),
(1698, '{"op_c":"Infinitas soluções (x,y) = t(-4,1)","op_1":"x=0, y=0","op_2":"x=1, y=4","op_3":"x=4, y=1"}'),
(1699, '{"op_c":"Infinitas soluções (x,y) = t(-5,2)","op_1":"x=0, y=0","op_2":"x=2, y=5","op_3":"x=1, y=5"}'),
(1700, '{"op_c":"Infinitas soluções (x,y) = t(1,1)","op_1":"x=0, y=0","op_2":"x=1, y=-1","op_3":"x=-1, y=1"}');

-- ==========================================
-- PERGUNTA 1
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (34, 'Qual é a definição de módulo de um número real?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"O valor absoluto de um número, sempre não negativo"}'),
(@pergunta_id, '{"v1":"O número real somado ao seu oposto"}'),
(@pergunta_id, '{"v1":"O quadrado de um número"}'),
(@pergunta_id, '{"v1":"A metade do número"}'),
(@pergunta_id, '{"v1":"O número multiplicado por -1"}'),
(@pergunta_id, '{"v1":"O inverso de um número"}'),
(@pergunta_id, '{"v1":"O número dividido por 2"}'),
(@pergunta_id, '{"v1":"O número sem sinal"}'),
(@pergunta_id, '{"v1":"A raiz quadrada de um número negativo"}'),
(@pergunta_id, '{"v1":"O valor sempre positivo de um número real"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(1701, '{"op_c":"O valor absoluto de um número, sempre não negativo","op_1":"O número real somado ao seu oposto","op_2":"O número sem sinal","op_3":"A metade do número"}'),
(1702, '{"op_c":"O valor absoluto de um número, sempre não negativo","op_1":"O quadrado de um número","op_2":"O inverso de um número","op_3":"O número multiplicado por -1"}'),
(1703, '{"op_c":"O valor absoluto de um número, sempre não negativo","op_1":"O número sem sinal","op_2":"O número dividido por 2","op_3":"A raiz quadrada de um número negativo"}'),
(1704, '{"op_c":"O valor absoluto de um número, sempre não negativo","op_1":"A metade do número","op_2":"O número multiplicado por -1","op_3":"O inverso de um número"}'),
(1705, '{"op_c":"O valor absoluto de um número, sempre não negativo","op_1":"O número dividido por 2","op_2":"O número real somado ao seu oposto","op_3":"A raiz quadrada de um número negativo"}'),
(1706, '{"op_c":"O valor absoluto de um número, sempre não negativo","op_1":"O número multiplicado por -1","op_2":"O quadrado de um número","op_3":"A metade do número"}'),
(1707, '{"op_c":"O valor absoluto de um número, sempre não negativo","op_1":"O número sem sinal","op_2":"O número dividido por 2","op_3":"O inverso de um número"}'),
(1708, '{"op_c":"O valor absoluto de um número, sempre não negativo","op_1":"A metade do número","op_2":"O número multiplicado por -1","op_3":"O quadrado de um número"}'),
(1709, '{"op_c":"O valor absoluto de um número, sempre não negativo","op_1":"A raiz quadrada de um número negativo","op_2":"O número real somado ao seu oposto","op_3":"O inverso de um número"}'),
(1710, '{"op_c":"O valor absoluto de um número, sempre não negativo","op_1":"O número dividido por 2","op_2":"O número sem sinal","op_3":"O quadrado de um número"}');

-- ==========================================
-- PERGUNTA 2
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (34, 'Qual é o valor de |v1| quando v1 = -v2?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":-5,"v2":5}'),
(@pergunta_id, '{"v1":-7,"v2":7}'),
(@pergunta_id, '{"v1":-10,"v2":10}'),
(@pergunta_id, '{"v1":-3,"v2":3}'),
(@pergunta_id, '{"v1":-8,"v2":8}'),
(@pergunta_id, '{"v1":-9,"v2":9}'),
(@pergunta_id, '{"v1":-2,"v2":2}'),
(@pergunta_id, '{"v1":-12,"v2":12}'),
(@pergunta_id, '{"v1":-15,"v2":15}'),
(@pergunta_id, '{"v1":-1,"v2":1}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(1711, '{"op_c":"5","op_1":"-5","op_2":"0","op_3":"10"}'),
(1712, '{"op_c":"7","op_1":"-7","op_2":"0","op_3":"14"}'),
(1713, '{"op_c":"10","op_1":"-10","op_2":"0","op_3":"20"}'),
(1714, '{"op_c":"3","op_1":"-3","op_2":"0","op_3":"6"}'),
(1715, '{"op_c":"8","op_1":"-8","op_2":"0","op_3":"16"}'),
(1716, '{"op_c":"9","op_1":"-9","op_2":"0","op_3":"18"}'),
(1717, '{"op_c":"2","op_1":"-2","op_2":"0","op_3":"4"}'),
(1718, '{"op_c":"12","op_1":"-12","op_2":"0","op_3":"24"}'),
(1719, '{"op_c":"15","op_1":"-15","op_2":"0","op_3":"30"}'),
(1720, '{"op_c":"1","op_1":"-1","op_2":"0","op_3":"2"}');

-- ==========================================
-- PERGUNTA 3
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (34, 'Qual das propriedades abaixo é verdadeira para o módulo de números reais?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"|a·b| = |a|·|b|"}'),
(@pergunta_id, '{"v1":"|a+b| = |a| + |b| sempre"}'),
(@pergunta_id, '{"v1":"|a| = -a para todo a"}'),
(@pergunta_id, '{"v1":"|a| nunca é igual a zero"}'),
(@pergunta_id, '{"v1":"|a-b| = |a| - |b|"}'),
(@pergunta_id, '{"v1":"|a/b| = |a| - |b|"}'),
(@pergunta_id, '{"v1":"|a·b| = a·b"}'),
(@pergunta_id, '{"v1":"|a| + |b| = 0"}'),
(@pergunta_id, '{"v1":"|a+b| ≥ |a| + |b|"}'),
(@pergunta_id, '{"v1":"|a·b| = |a| + |b|"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(1721, '{"op_c":"|a·b| = |a|·|b|","op_1":"|a+b| = |a| + |b| sempre","op_2":"|a| nunca é igual a zero","op_3":"|a-b| = |a| - |b|"}'),
(1722, '{"op_c":"|a·b| = |a|·|b|","op_1":"|a/b| = |a| - |b|","op_2":"|a·b| = a·b","op_3":"|a+b| ≥ |a| + |b|"}'),
(1723, '{"op_c":"|a·b| = |a|·|b|","op_1":"|a| + |b| = 0","op_2":"|a| = -a para todo a","op_3":"|a·b| = |a| + |b|"}'),
(1724, '{"op_c":"|a·b| = |a|·|b|","op_1":"|a+b| = |a| + |b| sempre","op_2":"|a| nunca é igual a zero","op_3":"|a-b| = |a| - |b|"}'),
(1725, '{"op_c":"|a·b| = |a|·|b|","op_1":"|a| = -a para todo a","op_2":"|a+b| ≥ |a| + |b|","op_3":"|a/b| = |a| - |b|"}'),
(1726, '{"op_c":"|a·b| = |a|·|b|","op_1":"|a·b| = a·b","op_2":"|a| + |b| = 0","op_3":"|a·b| = |a| + |b|"}'),
(1727, '{"op_c":"|a·b| = |a|·|b|","op_1":"|a| nunca é igual a zero","op_2":"|a+b| = |a| + |b| sempre","op_3":"|a-b| = |a| - |b|"}'),
(1728, '{"op_c":"|a·b| = |a|·|b|","op_1":"|a| = -a para todo a","op_2":"|a·b| = |a| + |b|","op_3":"|a/b| = |a| - |b|"}'),
(1729, '{"op_c":"|a·b| = |a|·|b|","op_1":"|a| + |b| = 0","op_2":"|a+b| ≥ |a| + |b|","op_3":"|a·b| = a·b"}'),
(1730, '{"op_c":"|a·b| = |a|·|b|","op_1":"|a| = -a para todo a","op_2":"|a+b| = |a| + |b| sempre","op_3":"|a| nunca é igual a zero"}');

-- ==========================================
-- PERGUNTA 4
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (34, 'Sabendo que |x| = 7, quais são os valores possíveis de x?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"7 e -7"}'),
(@pergunta_id, '{"v1":"7 apenas"}'),
(@pergunta_id, '{"v1":"0 e 7"}'),
(@pergunta_id, '{"v1":"-7 apenas"}'),
(@pergunta_id, '{"v1":"Nenhum número real"}'),
(@pergunta_id, '{"v1":"7 e 0"}'),
(@pergunta_id, '{"v1":"-7 e 7"}'),
(@pergunta_id, '{"v1":"Apenas números positivos"}'),
(@pergunta_id, '{"v1":"Todos os reais"}'),
(@pergunta_id, '{"v1":"Somente 0"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(1731, '{"op_c":"7 e -7","op_1":"7 apenas","op_2":"0 e 7","op_3":"Nenhum número real"}'),
(1732, '{"op_c":"7 e -7","op_1":"-7 apenas","op_2":"Apenas números positivos","op_3":"Somente 0"}'),
(1733, '{"op_c":"7 e -7","op_1":"Todos os reais","op_2":"7 e 0","op_3":"0 e 7"}'),
(1734, '{"op_c":"7 e -7","op_1":"7 apenas","op_2":"Nenhum número real","op_3":"Somente 0"}'),
(1735, '{"op_c":"7 e -7","op_1":"-7 apenas","op_2":"Todos os reais","op_3":"Apenas números positivos"}'),
(1736, '{"op_c":"7 e -7","op_1":"7 e 0","op_2":"0 e 7","op_3":"Nenhum número real"}'),
(1737, '{"op_c":"7 e -7","op_1":"Somente 0","op_2":"7 apenas","op_3":"Apenas números positivos"}'),
(1738, '{"op_c":"7 e -7","op_1":"Todos os reais","op_2":"-7 apenas","op_3":"7 e 0"}'),
(1739, '{"op_c":"7 e -7","op_1":"Nenhum número real","op_2":"0 e 7","op_3":"7 apenas"}'),
(1740, '{"op_c":"7 e -7","op_1":"Apenas números positivos","op_2":"Somente 0","op_3":"7 e 0"}');

-- ==========================================
-- PERGUNTA 5 (PRÁTICA)
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (34, 'Resolva a equação |x - v1 | = v2 .');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":2,"v2":3}'),
(@pergunta_id, '{"v1":1,"v2":4}'),
(@pergunta_id, '{"v1":3,"v2":5}'),
(@pergunta_id, '{"v1":4,"v2":2}'),
(@pergunta_id, '{"v1":5,"v2":1}'),
(@pergunta_id, '{"v1":0,"v2":6}'),
(@pergunta_id, '{"v1":-1,"v2":3}'),
(@pergunta_id, '{"v1":2,"v2":0}'),
(@pergunta_id, '{"v1":-3,"v2":4}'),
(@pergunta_id, '{"v1":1,"v2":2}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(1741, '{"op_c":"x = 5 ou x = -1","op_1":"x = 2 ou x = 3","op_2":"x = 0 ou x = 4","op_3":"x = -5 ou x = 1"}'),
(1742, '{"op_c":"x = 5 ou x = -3","op_1":"x = 4 ou x = -4","op_2":"x = 1 ou x = 2","op_3":"x = -1 ou x = 3"}'),
(1743, '{"op_c":"x = 8 ou x = -2","op_1":"x = 3 ou x = 5","op_2":"x = 0 ou x = 6","op_3":"x = -5 ou x = 3"}'),
(1744, '{"op_c":"x = 6 ou x = 2","op_1":"x = 4 ou x = -2","op_2":"x = 5 ou x = 3","op_3":"x = -6 ou x = 0"}'),
(1745, '{"op_c":"x = 6 ou x = 4","op_1":"x = 5 ou x = 1","op_2":"x = 3 ou x = 7","op_3":"x = 0 ou x = 2"}'),
(1746, '{"op_c":"x = 6 ou x = -6","op_1":"x = 0 ou x = 6","op_2":"x = -3 ou x = 3","op_3":"x = -1 ou x = 5"}'),
(1747, '{"op_c":"x = 2 ou x = -4","op_1":"x = 0 ou x = -2","op_2":"x = -3 ou x = 3","op_3":"x = -1 ou x = 1"}'),
(1748, '{"op_c":"x = 2","op_1":"x = 0","op_2":"x = -2","op_3":"x = 4"}'),
(1749, '{"op_c":"x = 1 ou x = -7","op_1":"x = -3 ou x = 4","op_2":"x = 3 ou x = -4","op_3":"x = 0 ou x = -2"}'),
(1750, '{"op_c":"x = 3 ou x = -1","op_1":"x = 2 ou x = 0","op_2":"x = 1 ou x = -2","op_3":"x = 4 ou x = -3"}');

-- ==========================================
-- PERGUNTA 1
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (35, 'O que é uma função modular?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"Uma função que envolve o valor absoluto da variável"}'),
(@pergunta_id, '{"v1":"Uma função sempre crescente"}'),
(@pergunta_id, '{"v1":"Uma função com domínio restrito aos números positivos"}'),
(@pergunta_id, '{"v1":"Uma função com imagem sempre negativa"}'),
(@pergunta_id, '{"v1":"Uma função que não possui gráfico"}'),
(@pergunta_id, '{"v1":"Uma função polinomial do 2º grau"}'),
(@pergunta_id, '{"v1":"Uma função que não admite números negativos"}'),
(@pergunta_id, '{"v1":"Uma função com gráfico parabólico"}'),
(@pergunta_id, '{"v1":"Uma função definida apenas por partes"}'),
(@pergunta_id, '{"v1":"Uma função exponencial"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(1751, '{"op_c":"Uma função que envolve o valor absoluto da variável","op_1":"Uma função sempre crescente","op_2":"Uma função com imagem sempre negativa","op_3":"Uma função polinomial do 2º grau"}'),
(1752, '{"op_c":"Uma função que envolve o valor absoluto da variável","op_1":"Uma função com domínio restrito aos números positivos","op_2":"Uma função exponencial","op_3":"Uma função definida apenas por partes"}'),
(1753, '{"op_c":"Uma função que envolve o valor absoluto da variável","op_1":"Uma função com gráfico parabólico","op_2":"Uma função que não admite números negativos","op_3":"Uma função sempre crescente"}'),
(1754, '{"op_c":"Uma função que envolve o valor absoluto da variável","op_1":"Uma função definida apenas por partes","op_2":"Uma função com imagem sempre negativa","op_3":"Uma função exponencial"}'),
(1755, '{"op_c":"Uma função que envolve o valor absoluto da variável","op_1":"Uma função polinomial do 2º grau","op_2":"Uma função com domínio restrito aos números positivos","op_3":"Uma função com gráfico parabólico"}'),
(1756, '{"op_c":"Uma função que envolve o valor absoluto da variável","op_1":"Uma função sempre crescente","op_2":"Uma função exponencial","op_3":"Uma função que não possui gráfico"}'),
(1757, '{"op_c":"Uma função que envolve o valor absoluto da variável","op_1":"Uma função que não admite números negativos","op_2":"Uma função com imagem sempre negativa","op_3":"Uma função exponencial"}'),
(1758, '{"op_c":"Uma função que envolve o valor absoluto da variável","op_1":"Uma função com domínio restrito aos números positivos","op_2":"Uma função definida apenas por partes","op_3":"Uma função que não admite números negativos"}'),
(1759, '{"op_c":"Uma função que envolve o valor absoluto da variável","op_1":"Uma função polinomial do 2º grau","op_2":"Uma função exponencial","op_3":"Uma função com gráfico parabólico"}'),
(1760, '{"op_c":"Uma função que envolve o valor absoluto da variável","op_1":"Uma função que não possui gráfico","op_2":"Uma função com imagem sempre negativa","op_3":"Uma função com domínio restrito aos números positivos"}');

-- ==========================================
-- PERGUNTA 2
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (35, 'Qual é o formato geral de uma função modular f(x)?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"f(x) = |ax + b|"}'),
(@pergunta_id, '{"v1":"f(x) = ax² + bx + c"}'),
(@pergunta_id, '{"v1":"f(x) = a/x"}'),
(@pergunta_id, '{"v1":"f(x) = ax + b"}'),
(@pergunta_id, '{"v1":"f(x) = a^x"}'),
(@pergunta_id, '{"v1":"f(x) = log(x)"}'),
(@pergunta_id, '{"v1":"f(x) = sen(x)"}'),
(@pergunta_id, '{"v1":"f(x) = cos(x)"}'),
(@pergunta_id, '{"v1":"f(x) = √(ax + b)"}'),
(@pergunta_id, '{"v1":"f(x) = |x| + c"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(1761, '{"op_c":"f(x) = |ax + b|","op_1":"f(x) = ax² + bx + c","op_2":"f(x) = a/x","op_3":"f(x) = √(ax + b)"}'),
(1762, '{"op_c":"f(x) = |ax + b|","op_1":"f(x) = a^x","op_2":"f(x) = log(x)","op_3":"f(x) = ax + b"}'),
(1763, '{"op_c":"f(x) = |ax + b|","op_1":"f(x) = cos(x)","op_2":"f(x) = sen(x)","op_3":"f(x) = a/x"}'),
(1764, '{"op_c":"f(x) = |ax + b|","op_1":"f(x) = |x| + c","op_2":"f(x) = √(ax + b)","op_3":"f(x) = a^x"}'),
(1765, '{"op_c":"f(x) = |ax + b|","op_1":"f(x) = ax² + bx + c","op_2":"f(x) = log(x)","op_3":"f(x) = ax + b"}'),
(1766, '{"op_c":"f(x) = |ax + b|","op_1":"f(x) = cos(x)","op_2":"f(x) = √(ax + b)","op_3":"f(x) = sen(x)"}'),
(1767, '{"op_c":"f(x) = |ax + b|","op_1":"f(x) = a/x","op_2":"f(x) = log(x)","op_3":"f(x) = ax² + bx + c"}'),
(1768, '{"op_c":"f(x) = |ax + b|","op_1":"f(x) = |x| + c","op_2":"f(x) = sen(x)","op_3":"f(x) = ax + b"}'),
(1769, '{"op_c":"f(x) = |ax + b|","op_1":"f(x) = cos(x)","op_2":"f(x) = √(ax + b)","op_3":"f(x) = log(x)"}'),
(1770, '{"op_c":"f(x) = |ax + b|","op_1":"f(x) = a^x","op_2":"f(x) = sen(x)","op_3":"f(x) = |x| + c"}');

-- ==========================================
-- PERGUNTA 3
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (35, 'Como é o gráfico da função modular f(x) = |x|?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"É uma linha em forma de V com vértice na origem"}'),
(@pergunta_id, '{"v1":"É uma parábola"}'),
(@pergunta_id, '{"v1":"É uma reta horizontal"}'),
(@pergunta_id, '{"v1":"É uma reta vertical"}'),
(@pergunta_id, '{"v1":"É um círculo"}'),
(@pergunta_id, '{"v1":"É uma curva logarítmica"}'),
(@pergunta_id, '{"v1":"É uma exponencial"}'),
(@pergunta_id, '{"v1":"É uma hipérbole"}'),
(@pergunta_id, '{"v1":"É um gráfico oscilante"}'),
(@pergunta_id, '{"v1":"É um trapézio"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(1771, '{"op_c":"É uma linha em forma de V com vértice na origem","op_1":"É uma parábola","op_2":"É uma reta horizontal","op_3":"É uma hipérbole"}'),
(1772, '{"op_c":"É uma linha em forma de V com vértice na origem","op_1":"É uma exponencial","op_2":"É um gráfico oscilante","op_3":"É um círculo"}'),
(1773, '{"op_c":"É uma linha em forma de V com vértice na origem","op_1":"É uma reta vertical","op_2":"É um trapézio","op_3":"É uma parábola"}'),
(1774, '{"op_c":"É uma linha em forma de V com vértice na origem","op_1":"É uma hipérbole","op_2":"É uma curva logarítmica","op_3":"É uma exponencial"}'),
(1775, '{"op_c":"É uma linha em forma de V com vértice na origem","op_1":"É um gráfico oscilante","op_2":"É uma parábola","op_3":"É um círculo"}'),
(1776, '{"op_c":"É uma linha em forma de V com vértice na origem","op_1":"É uma reta horizontal","op_2":"É uma exponencial","op_3":"É uma curva logarítmica"}'),
(1777, '{"op_c":"É uma linha em forma de V com vértice na origem","op_1":"É um trapézio","op_2":"É uma parábola","op_3":"É um círculo"}'),
(1778, '{"op_c":"É uma linha em forma de V com vértice na origem","op_1":"É uma exponencial","op_2":"É uma curva logarítmica","op_3":"É uma hipérbole"}'),
(1779, '{"op_c":"É uma linha em forma de V com vértice na origem","op_1":"É uma reta vertical","op_2":"É um gráfico oscilante","op_3":"É uma parábola"}'),
(1780, '{"op_c":"É uma linha em forma de V com vértice na origem","op_1":"É uma hipérbole","op_2":"É um círculo","op_3":"É uma curva logarítmica"}');

-- ==========================================
-- PERGUNTA 4 (COMPLETA)
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (35, 'Qual é a lei de formação da função modular v1 em forma de função definida por partes?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"f(x) = |x - 2|"}'),
(@pergunta_id, '{"v1":"f(x) = |x - 3"}'),
(@pergunta_id, '{"v1":"f(x) = | x - 1|"}'),
(@pergunta_id, '{"v1":"f(x) = |x - 4|"}'),
(@pergunta_id, '{"v1":"f(x) = |x + 2|"}'),
(@pergunta_id, '{"v1":"f(x) = |x + 5|"}'),
(@pergunta_id, '{"v1":"f(x) = |x - 6|"}'),
(@pergunta_id, '{"v1":"f(x) = |x - 7|"}'),
(@pergunta_id, '{"v1":"f(x) = |x - 8|"}'),
(@pergunta_id, '{"v1":"f(x) = |x - 9|"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(1781, '{"op_c":"f(x) = x - 2, se x ≥ 2; f(x) = 2 - x, se x < 2","op_1":"f(x) = 2 - x, se x ≥ 2; f(x) = x - 2, se x < 2","op_2":"f(x) = x - 2, se x > 2; f(x) = 2 - x, se x ≤ 2","op_3":"f(x) = x - 2, se x ≥ 0; f(x) = 2 - x, se x < 0"}'),
(1782, '{"op_c":"f(x) = x - 3, se x ≥ 3; f(x) = 3 - x, se x < 3","op_1":"f(x) = 3 - x, se x ≥ 3; f(x) = x - 3, se x < 3","op_2":"f(x) = x - 3, se x ≥ 0; f(x) = 3 - x, se x < 0","op_3":"f(x) = x + 3, se x ≥ -3; f(x) = -3 - x, se x < -3"}'),
(1783, '{"op_c":"f(x) = x - 1, se x ≥ 1; f(x) = 1 - x, se x < 1","op_1":"f(x) = 1 - x, se x ≥ 1; f(x) = x - 1, se x < 1","op_2":"f(x) = x - 1, se x ≥ 0; f(x) = 1 - x, se x < 0","op_3":"f(x) = x + 1, se x ≥ -1; f(x) = -1 - x, se x < -1"}'),
(1784, '{"op_c":"f(x) = x - 4, se x ≥ 4; f(x) = 4 - x, se x < 4","op_1":"f(x) = 4 - x, se x ≥ 4; f(x) = x - 4, se x < 4","op_2":"f(x) = x + 4, se x ≥ -4; f(x) = -4 - x, se x < -4","op_3":"f(x) = x - 4, se x ≥ 0; f(x) = 4 - x, se x < 0"}'),
(1785, '{"op_c":"f(x) = x + 2, se x ≥ -2; f(x) = -2 - x, se x < -2","op_1":"f(x) = -2 - x, se x ≥ -2; f(x) = x + 2, se x < -2","op_2":"f(x) = x - 2, se x ≥ 2; f(x) = 2 - x, se x < 2","op_3":"f(x) = x + 2, se x ≥ 0; f(x) = -2 - x, se x < 0"}'),
(1786, '{"op_c":"f(x) = x + 5, se x ≥ -5; f(x) = -5 - x, se x < -5","op_1":"f(x) = -5 - x, se x ≥ -5; f(x) = x + 5, se x < -5","op_2":"f(x) = x - 5, se x ≥ 5; f(x) = 5 - x, se x < 5","op_3":"f(x) = x + 5, se x ≥ 0; f(x) = -5 - x, se x < 0"}'),
(1787, '{"op_c":"f(x) = x - 6, se x ≥ 6; f(x) = 6 - x, se x < 6","op_1":"f(x) = 6 - x, se x ≥ 6; f(x) = x - 6, se x < 6","op_2":"f(x) = x + 6, se x ≥ -6; f(x) = -6 - x, se x < -6","op_3":"f(x) = x - 6, se x ≥ 0; f(x) = 6 - x, se x < 0"}'),
(1788, '{"op_c":"f(x) = x - 7, se x ≥ 7; f(x) = 7 - x, se x < 7","op_1":"f(x) = 7 - x, se x ≥ 7; f(x) = x - 7, se x < 7","op_2":"f(x) = x + 7, se x ≥ -7; f(x) = -7 - x, se x < -7","op_3":"f(x) = x - 7, se x ≥ 0; f(x) = 7 - x, se x < 0"}'),
(1789, '{"op_c":"f(x) = x - 8, se x ≥ 8; f(x) = 8 - x, se x < 8","op_1":"f(x) = 8 - x, se x ≥ 8; f(x) = x - 8, se x < 8","op_2":"f(x) = x + 8, se x ≥ -8; f(x) = -8 - x, se x < -8","op_3":"f(x) = x - 8, se x ≥ 0; f(x) = 8 - x, se x < 0"}'),
(1790, '{"op_c":"f(x) = x - 9, se x ≥ 9; f(x) = 9 - x, se x < 9","op_1":"f(x) = 9 - x, se x ≥ 9; f(x) = x - 9, se x < 9","op_2":"f(x) = x + 9, se x ≥ -9; f(x) = -9 - x, se x < -9","op_3":"f(x) = x - 9, se x ≥ 0; f(x) = 9 - x, se x < 0"}');

-- ==========================================
-- PERGUNTA 5 (PRÁTICA)
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (35, 'Resolva a equação | v1 x + v2 | = v3 .');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":1,"v2":2,"v3":4}'),
(@pergunta_id, '{"v1":1,"v2":3,"v3":5}'),
(@pergunta_id, '{"v1":2,"v2":4,"v3":6}'),
(@pergunta_id, '{"v1":3,"v2":1,"v3":7}'),
(@pergunta_id, '{"v1":2,"v2":-2,"v3":8}'),
(@pergunta_id, '{"v1":1,"v2":-1,"v3":3}'),
(@pergunta_id, '{"v1":2,"v2":3,"v3":7}'),
(@pergunta_id, '{"v1":1,"v2":0,"v3":4}'),
(@pergunta_id, '{"v1":3,"v2":-3,"v3":6}'),
(@pergunta_id, '{"v1":2,"v2":-4,"v3":10}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(1791, '{"op_c":"x = 2 ou x = -6","op_1":"x = 4 ou x = -4","op_2":"x = 6 ou x = -2","op_3":"x = 0 ou x = -8"}'),
(1792, '{"op_c":"x = 2 ou x = -8","op_1":"x = 1 ou x = -6","op_2":"x = 3 ou x = -4","op_3":"x = 0 ou x = -5"}'),
(1793, '{"op_c":"x = 1 ou x = -5","op_1":"x = 2 ou x = -4","op_2":"x = 0 ou x = -6","op_3":"x = 3 ou x = -3"}'),
(1794, '{"op_c":"x = 2 ou x = -8/3","op_1":"x = 1 ou x = -5/3","op_2":"x = 3 ou x = -7/3","op_3":"x = 0 ou x = -4/3"}'),
(1795, '{"op_c":"x = 3 ou x = -2","op_1":"x = 2 ou x = -3","op_2":"x = 4 ou x = -1","op_3":"x = 0 ou x = -4"}'),
(1796, '{"op_c":"x = 2 ou x = -4","op_1":"x = 3 ou x = -3","op_2":"x = 1 ou x = -5","op_3":"x = 0 ou x = -6"}'),
(1797, '{"op_c":"x = 2 ou x = -5","op_1":"x = 3 ou x = -4","op_2":"x = 1 ou x = -6","op_3":"x = 0 ou x = -3"}'),
(1798, '{"op_c":"x = 4 ou x = -4","op_1":"x = 3 ou x = -3","op_2":"x = 2 ou x = -2","op_3":"x = 1 ou x = -1"}'),
(1799, '{"op_c":"x = 3 ou x = -3","op_1":"x = 2 ou x = -4","op_2":"x = 1 ou x = -5","op_3":"x = 0 ou x = -6"}'),
(1800, '{"op_c":"x = 7 ou x = -3","op_1":"x = 6 ou x = -2","op_2":"x = 8 ou x = -4","op_3":"x = 5 ou x = -5"}');

-- ==========================================
-- PERGUNTA 1
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (36, 'O que representa uma inequação modular?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"Uma desigualdade que envolve o valor absoluto de uma expressão"}'),
(@pergunta_id, '{"v1":"Uma igualdade que envolve módulo"}'),
(@pergunta_id, '{"v1":"Uma soma entre dois módulos"}'),
(@pergunta_id, '{"v1":"Uma equação sem solução"}'),
(@pergunta_id, '{"v1":"Um sistema de equações lineares"}'),
(@pergunta_id, '{"v1":"Uma desigualdade entre funções exponenciais"}'),
(@pergunta_id, '{"v1":"Uma função quadrática"}'),
(@pergunta_id, '{"v1":"Uma expressão sem variável"}'),
(@pergunta_id, '{"v1":"Uma desigualdade que envolve radiciação"}'),
(@pergunta_id, '{"v1":"Uma equação de segundo grau"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(1801, '{"op_c":"Uma desigualdade que envolve o valor absoluto de uma expressão","op_1":"Uma igualdade que envolve módulo","op_2":"Uma equação de segundo grau","op_3":"Uma desigualdade que envolve radiciação"}'),
(1802, '{"op_c":"Uma desigualdade que envolve o valor absoluto de uma expressão","op_1":"Uma função quadrática","op_2":"Uma soma entre dois módulos","op_3":"Uma equação sem solução"}'),
(1803, '{"op_c":"Uma desigualdade que envolve o valor absoluto de uma expressão","op_1":"Um sistema de equações lineares","op_2":"Uma desigualdade entre funções exponenciais","op_3":"Uma equação de segundo grau"}'),
(1804, '{"op_c":"Uma desigualdade que envolve o valor absoluto de uma expressão","op_1":"Uma soma entre dois módulos","op_2":"Uma equação sem solução","op_3":"Uma expressão sem variável"}'),
(1805, '{"op_c":"Uma desigualdade que envolve o valor absoluto de uma expressão","op_1":"Uma função quadrática","op_2":"Uma equação de segundo grau","op_3":"Uma desigualdade entre funções exponenciais"}'),
(1806, '{"op_c":"Uma desigualdade que envolve o valor absoluto de uma expressão","op_1":"Uma igualdade que envolve módulo","op_2":"Uma expressão sem variável","op_3":"Uma soma entre dois módulos"}'),
(1807, '{"op_c":"Uma desigualdade que envolve o valor absoluto de uma expressão","op_1":"Um sistema de equações lineares","op_2":"Uma equação sem solução","op_3":"Uma função quadrática"}'),
(1808, '{"op_c":"Uma desigualdade que envolve o valor absoluto de uma expressão","op_1":"Uma equação de segundo grau","op_2":"Uma desigualdade entre funções exponenciais","op_3":"Uma expressão sem variável"}'),
(1809, '{"op_c":"Uma desigualdade que envolve o valor absoluto de uma expressão","op_1":"Uma função quadrática","op_2":"Uma equação sem solução","op_3":"Uma soma entre dois módulos"}'),
(1810, '{"op_c":"Uma desigualdade que envolve o valor absoluto de uma expressão","op_1":"Um sistema de equações lineares","op_2":"Uma expressão sem variável","op_3":"Uma equação de segundo grau"}');

-- ==========================================
-- PERGUNTA 2
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (36, 'Como resolver inequações do tipo |x| < a, com a > 0?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"-a < x < a"}'),
(@pergunta_id, '{"v1":"x > a"}'),
(@pergunta_id, '{"v1":"x < -a"}'),
(@pergunta_id, '{"v1":"x > a ou x < -a"}'),
(@pergunta_id, '{"v1":"x = a"}'),
(@pergunta_id, '{"v1":"x ≤ -a"}'),
(@pergunta_id, '{"v1":"x ≥ a"}'),
(@pergunta_id, '{"v1":"x < a"}'),
(@pergunta_id, '{"v1":"x > -a"}'),
(@pergunta_id, '{"v1":"x < a ou x > a"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(1811, '{"op_c":"-a < x < a","op_1":"x > a","op_2":"x < -a","op_3":"x > a ou x < -a"}'),
(1812, '{"op_c":"-a < x < a","op_1":"x ≤ -a","op_2":"x < a ou x > a","op_3":"x = a"}'),
(1813, '{"op_c":"-a < x < a","op_1":"x > -a","op_2":"x ≥ a","op_3":"x > a"}'),
(1814, '{"op_c":"-a < x < a","op_1":"x < -a","op_2":"x > a ou x < -a","op_3":"x = a"}'),
(1815, '{"op_c":"-a < x < a","op_1":"x > a","op_2":"x < -a","op_3":"x < a ou x > a"}'),
(1816, '{"op_c":"-a < x < a","op_1":"x ≥ a","op_2":"x > -a","op_3":"x = a"}'),
(1817, '{"op_c":"-a < x < a","op_1":"x ≤ -a","op_2":"x > a ou x < -a","op_3":"x = a"}'),
(1818, '{"op_c":"-a < x < a","op_1":"x > a","op_2":"x < a","op_3":"x > -a"}'),
(1819, '{"op_c":"-a < x < a","op_1":"x > a","op_2":"x < -a","op_3":"x ≥ a"}'),
(1820, '{"op_c":"-a < x < a","op_1":"x ≤ -a","op_2":"x = a","op_3":"x > a"}');

-- ==========================================
-- PERGUNTA 3
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (36, 'Qual é o conjunto solução da inequação |x| ≥ 4?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"x ≤ -4 ou x ≥ 4"}'),
(@pergunta_id, '{"v1":"x > -4 e x < 4"}'),
(@pergunta_id, '{"v1":"x = 4"}'),
(@pergunta_id, '{"v1":"x < -4 e x > 4"}'),
(@pergunta_id, '{"v1":"x ≤ 4"}'),
(@pergunta_id, '{"v1":"x ≥ 4"}'),
(@pergunta_id, '{"v1":"x ≤ -4"}'),
(@pergunta_id, '{"v1":"x > 4"}'),
(@pergunta_id, '{"v1":"x < -4"}'),
(@pergunta_id, '{"v1":"x = 0"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(1821, '{"op_c":"x ≤ -4 ou x ≥ 4","op_1":"x > -4 e x < 4","op_2":"x ≤ 4","op_3":"x = 4"}'),
(1822, '{"op_c":"x ≤ -4 ou x ≥ 4","op_1":"x = 0","op_2":"x > 4","op_3":"x < -4"}'),
(1823, '{"op_c":"x ≤ -4 ou x ≥ 4","op_1":"x ≥ 4","op_2":"x ≤ -4","op_3":"x < -4 e x > 4"}'),
(1824, '{"op_c":"x ≤ -4 ou x ≥ 4","op_1":"x > -4 e x < 4","op_2":"x = 4","op_3":"x < -4"}'),
(1825, '{"op_c":"x ≤ -4 ou x ≥ 4","op_1":"x > 4","op_2":"x ≤ 4","op_3":"x = 0"}'),
(1826, '{"op_c":"x ≤ -4 ou x ≥ 4","op_1":"x < -4 e x > 4","op_2":"x = 4","op_3":"x = 0"}'),
(1827, '{"op_c":"x ≤ -4 ou x ≥ 4","op_1":"x ≥ 4","op_2":"x = 4","op_3":"x > -4 e x < 4"}'),
(1828, '{"op_c":"x ≤ -4 ou x ≥ 4","op_1":"x ≤ 4","op_2":"x = 0","op_3":"x = 4"}'),
(1829, '{"op_c":"x ≤ -4 ou x ≥ 4","op_1":"x > 4","op_2":"x = 4","op_3":"x = 0"}'),
(1830, '{"op_c":"x ≤ -4 ou x ≥ 4","op_1":"x > -4 e x < 4","op_2":"x = 4","op_3":"x = 0"}');

-- ==========================================
-- PERGUNTA 4
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (36, 'O que se deve fazer para resolver inequações modulares?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"Retirar o módulo considerando os dois casos possíveis"}'),
(@pergunta_id, '{"v1":"Elevar ambos os lados ao quadrado"}'),
(@pergunta_id, '{"v1":"Somar os módulos de ambos os lados"}'),
(@pergunta_id, '{"v1":"Substituir x por -x"}'),
(@pergunta_id, '{"v1":"Resolver apenas o caso positivo"}'),
(@pergunta_id, '{"v1":"Multiplicar a inequação por -1"}'),
(@pergunta_id, '{"v1":"Transformar em uma equação linear"}'),
(@pergunta_id, '{"v1":"Adicionar 1 em ambos os lados"}'),
(@pergunta_id, '{"v1":"Isolar o valor absoluto"}'),
(@pergunta_id, '{"v1":"Subtrair o valor absoluto de ambos os lados"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(1831, '{"op_c":"Retirar o módulo considerando os dois casos possíveis","op_1":"Resolver apenas o caso positivo","op_2":"Somar os módulos de ambos os lados","op_3":"Elevar ambos os lados ao quadrado"}'),
(1832, '{"op_c":"Retirar o módulo considerando os dois casos possíveis","op_1":"Substituir x por -x","op_2":"Isolar o valor absoluto","op_3":"Multiplicar a inequação por -1"}'),
(1833, '{"op_c":"Retirar o módulo considerando os dois casos possíveis","op_1":"Adicionar 1 em ambos os lados","op_2":"Transformar em uma equação linear","op_3":"Resolver apenas o caso positivo"}'),
(1834, '{"op_c":"Retirar o módulo considerando os dois casos possíveis","op_1":"Isolar o valor absoluto","op_2":"Subtrair o valor absoluto de ambos os lados","op_3":"Somar os módulos de ambos os lados"}'),
(1835, '{"op_c":"Retirar o módulo considerando os dois casos possíveis","op_1":"Multiplicar a inequação por -1","op_2":"Resolver apenas o caso positivo","op_3":"Substituir x por -x"}'),
(1836, '{"op_c":"Retirar o módulo considerando os dois casos possíveis","op_1":"Somar os módulos de ambos os lados","op_2":"Elevar ambos os lados ao quadrado","op_3":"Isolar o valor absoluto"}'),
(1837, '{"op_c":"Retirar o módulo considerando os dois casos possíveis","op_1":"Transformar em uma equação linear","op_2":"Adicionar 1 em ambos os lados","op_3":"Resolver apenas o caso positivo"}'),
(1838, '{"op_c":"Retirar o módulo considerando os dois casos possíveis","op_1":"Substituir x por -x","op_2":"Isolar o valor absoluto","op_3":"Multiplicar a inequação por -1"}'),
(1839, '{"op_c":"Retirar o módulo considerando os dois casos possíveis","op_1":"Subtrair o valor absoluto de ambos os lados","op_2":"Somar os módulos de ambos os lados","op_3":"Adicionar 1 em ambos os lados"}'),
(1840, '{"op_c":"Retirar o módulo considerando os dois casos possíveis","op_1":"Multiplicar a inequação por -1","op_2":"Resolver apenas o caso positivo","op_3":"Isolar o valor absoluto"}');

-- ==========================================
-- PERGUNTA 5 (PRÁTICA)
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (36, 'Resolva a inequação |x - v1 | ≤ v2 .');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":2,"v2":3}'),
(@pergunta_id, '{"v1":1,"v2":4}'),
(@pergunta_id, '{"v1":-2,"v2":5}'),
(@pergunta_id, '{"v1":3,"v2":2}'),
(@pergunta_id, '{"v1":-1,"v2":6}'),
(@pergunta_id, '{"v1":0,"v2":4}'),
(@pergunta_id, '{"v1":4,"v2":1}'),
(@pergunta_id, '{"v1":-3,"v2":3}'),
(@pergunta_id, '{"v1":2,"v2":5}'),
(@pergunta_id, '{"v1":1,"v2":2}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(1841, '{"op_c":"-1 ≤ x ≤ 5","op_1":"x ≤ 5","op_2":"x ≥ -1","op_3":"x ≥ 5"}'),
(1842, '{"op_c":"-3 ≤ x ≤ 5","op_1":"x ≤ 3","op_2":"x ≥ -3","op_3":"x ≥ 5"}'),
(1843, '{"op_c":"-7 ≤ x ≤ 3","op_1":"x ≤ 3","op_2":"x ≥ -7","op_3":"x ≥ 7"}'),
(1844, '{"op_c":"1 ≤ x ≤ 5","op_1":"x ≤ 1","op_2":"x ≥ 5","op_3":"x ≥ 3"}'),
(1845, '{"op_c":"-7 ≤ x ≤ 5","op_1":"x ≤ -7","op_2":"x ≥ 7","op_3":"x ≥ 5"}'),
(1846, '{"op_c":"-4 ≤ x ≤ 4","op_1":"x ≤ -4","op_2":"x ≥ 4","op_3":"x ≥ 0"}'),
(1847, '{"op_c":"3 ≤ x ≤ 5","op_1":"x ≤ 3","op_2":"x ≥ 5","op_3":"x ≥ 4"}'),
(1848, '{"op_c":"-6 ≤ x ≤ 0","op_1":"x ≤ 0","op_2":"x ≥ -6","op_3":"x ≥ 3"}'),
(1849, '{"op_c":"-3 ≤ x ≤ 7","op_1":"x ≤ -3","op_2":"x ≥ 7","op_3":"x ≥ 5"}'),
(1850, '{"op_c":"-1 ≤ x ≤ 3","op_1":"x ≤ -1","op_2":"x ≥ 3","op_3":"x ≥ 2"}');

-- ==========================================
-- PERGUNTA 1
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (37, 'Qual é a fórmula do termo geral de uma Progressão Aritmética (P.A.)?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"a_n = a_1 + (n - 1)·r"}'),
(@pergunta_id, '{"v1":"a_n = a_1 × r^(n - 1)"}'),
(@pergunta_id, '{"v1":"a_n = a_1 - (n - 1)·r"}'),
(@pergunta_id, '{"v1":"a_n = a_1 / (n - 1)"}'),
(@pergunta_id, '{"v1":"a_n = n·r"}'),
(@pergunta_id, '{"v1":"a_n = r + n"}'),
(@pergunta_id, '{"v1":"a_n = a_1 × n"}'),
(@pergunta_id, '{"v1":"a_n = a_1 + n·r"}'),
(@pergunta_id, '{"v1":"a_n = a_1 + r"}'),
(@pergunta_id, '{"v1":"a_n = a_1 + n"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(1851, '{"op_c":"a_n = a_1 + (n - 1)·r","op_1":"a_n = a_1 × r^(n - 1)","op_2":"a_n = a_1 - (n - 1)·r","op_3":"a_n = a_1 / (n - 1)"}'),
(1852, '{"op_c":"a_n = a_1 + (n - 1)·r","op_1":"a_n = a_1 × n","op_2":"a_n = a_1 + r","op_3":"a_n = a_1 + n·r"}'),
(1853, '{"op_c":"a_n = a_1 + (n - 1)·r","op_1":"a_n = a_1 - (n - 1)·r","op_2":"a_n = r + n","op_3":"a_n = a_1 + n"}'),
(1854, '{"op_c":"a_n = a_1 + (n - 1)·r","op_1":"a_n = a_1 + r","op_2":"a_n = a_1 × r^(n - 1)","op_3":"a_n = n·r"}'),
(1855, '{"op_c":"a_n = a_1 + (n - 1)·r","op_1":"a_n = a_1 / (n - 1)","op_2":"a_n = a_1 + n","op_3":"a_n = r + n"}'),
(1856, '{"op_c":"a_n = a_1 + (n - 1)·r","op_1":"a_n = a_1 × r^(n - 1)","op_2":"a_n = n·r","op_3":"a_n = a_1 + r"}'),
(1857, '{"op_c":"a_n = a_1 + (n - 1)·r","op_1":"a_n = a_1 × n","op_2":"a_n = a_1 + r","op_3":"a_n = a_1 - (n - 1)·r"}'),
(1858, '{"op_c":"a_n = a_1 + (n - 1)·r","op_1":"a_n = n·r","op_2":"a_n = r + n","op_3":"a_n = a_1 + n"}'),
(1859, '{"op_c":"a_n = a_1 + (n - 1)·r","op_1":"a_n = a_1 / (n - 1)","op_2":"a_n = a_1 + r","op_3":"a_n = a_1 + n·r"}'),
(1860, '{"op_c":"a_n = a_1 + (n - 1)·r","op_1":"a_n = a_1 × r^(n - 1)","op_2":"a_n = r + n","op_3":"a_n = a_1 + n"}');

-- ==========================================
-- PERGUNTA 2
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (37, 'Em uma P.A. o primeiro termo é 3 e a razão é 2. Qual é o 5º termo?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":3,"v2":2}'),
(@pergunta_id, '{"v1":4,"v2":3}'),
(@pergunta_id, '{"v1":2,"v2":5}'),
(@pergunta_id, '{"v1":5,"v2":2}'),
(@pergunta_id, '{"v1":1,"v2":4}'),
(@pergunta_id, '{"v1":7,"v2":3}'),
(@pergunta_id, '{"v1":2,"v2":1}'),
(@pergunta_id, '{"v1":0,"v2":2}'),
(@pergunta_id, '{"v1":6,"v2":3}'),
(@pergunta_id, '{"v1":10,"v2":-1}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(1861, '{"op_c":"11","op_1":"13","op_2":"9","op_3":"7"}'),
(1862, '{"op_c":"16","op_1":"10","op_2":"18","op_3":"12"}'),
(1863, '{"op_c":"22","op_1":"20","op_2":"24","op_3":"18"}'),
(1864, '{"op_c":"13","op_1":"10","op_2":"12","op_3":"14"}'),
(1865, '{"op_c":"17","op_1":"13","op_2":"15","op_3":"19"}'),
(1866, '{"op_c":"19","op_1":"16","op_2":"18","op_3":"22"}'),
(1867, '{"op_c":"6","op_1":"4","op_2":"8","op_3":"2"}'),
(1868, '{"op_c":"8","op_1":"4","op_2":"10","op_3":"6"}'),
(1869, '{"op_c":"18","op_1":"15","op_2":"21","op_3":"17"}'),
(1870, '{"op_c":"6","op_1":"8","op_2":"4","op_3":"5"}');

-- ==========================================
-- PERGUNTA 3
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (37, 'Se o termo geral de uma P.A. é a_n = 2n + 3, qual é o valor do 7º termo?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":2,"v2":3}'),
(@pergunta_id, '{"v1":3,"v2":2}'),
(@pergunta_id, '{"v1":4,"v2":1}'),
(@pergunta_id, '{"v1":5,"v2":0}'),
(@pergunta_id, '{"v1":2,"v2":1}'),
(@pergunta_id, '{"v1":1,"v2":3}'),
(@pergunta_id, '{"v1":3,"v2":4}'),
(@pergunta_id, '{"v1":4,"v2":2}'),
(@pergunta_id, '{"v1":1,"v2":5}'),
(@pergunta_id, '{"v1":5,"v2":1}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(1871, '{"op_c":"17","op_1":"14","op_2":"18","op_3":"15"}'),
(1872, '{"op_c":"23","op_1":"21","op_2":"20","op_3":"25"}'),
(1873, '{"op_c":"29","op_1":"28","op_2":"30","op_3":"26"}'),
(1874, '{"op_c":"35","op_1":"32","op_2":"36","op_3":"34"}'),
(1875, '{"op_c":"15","op_1":"14","op_2":"12","op_3":"17"}'),
(1876, '{"op_c":"10","op_1":"12","op_2":"8","op_3":"11"}'),
(1877, '{"op_c":"25","op_1":"27","op_2":"24","op_3":"26"}'),
(1878, '{"op_c":"30","op_1":"27","op_2":"32","op_3":"29"}'),
(1879, '{"op_c":"19","op_1":"17","op_2":"20","op_3":"18"}'),
(1880, '{"op_c":"36","op_1":"35","op_2":"38","op_3":"34"}');

-- ==========================================
-- PERGUNTA 4
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (37, 'Qual dessas Alternativas representa corretamente o termo geral de uma P.A. de razão r = 5 e primeiro termo a₁ = 2?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"a_n = 2 + (n - 1)·5"}'),
(@pergunta_id, '{"v1":"a_n = 2n + 5"}'),
(@pergunta_id, '{"v1":"a_n = 2n - 5"}'),
(@pergunta_id, '{"v1":"a_n = 5n + 2"}'),
(@pergunta_id, '{"v1":"a_n = 5 + (n - 1)·2"}'),
(@pergunta_id, '{"v1":"a_n = n + 5"}'),
(@pergunta_id, '{"v1":"a_n = 2 + 5n"}'),
(@pergunta_id, '{"v1":"a_n = 2 × 5ⁿ"}'),
(@pergunta_id, '{"v1":"a_n = 5n - 2"}'),
(@pergunta_id, '{"v1":"a_n = 2 + 5/n"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(1881, '{"op_c":"a_n = 2 + (n - 1)·5","op_1":"a_n = 2n + 5","op_2":"a_n = 5n + 2","op_3":"a_n = 2 × 5ⁿ"}'),
(1882, '{"op_c":"a_n = 2 + (n - 1)·5","op_1":"a_n = 5 + (n - 1)·2","op_2":"a_n = 2 + 5/n","op_3":"a_n = 2n - 5"}'),
(1883, '{"op_c":"a_n = 2 + (n - 1)·5","op_1":"a_n = n + 5","op_2":"a_n = 5n - 2","op_3":"a_n = 2 + 5n"}'),
(1884, '{"op_c":"a_n = 2 + (n - 1)·5","op_1":"a_n = 5n + 2","op_2":"a_n = 2n + 5","op_3":"a_n = n + 5"}'),
(1885, '{"op_c":"a_n = 2 + (n - 1)·5","op_1":"a_n = 5n - 2","op_2":"a_n = 2 × 5ⁿ","op_3":"a_n = 5 + (n - 1)·2"}'),
(1886, '{"op_c":"a_n = 2 + (n - 1)·5","op_1":"a_n = 2 + 5n","op_2":"a_n = 5n + 2","op_3":"a_n = n + 5"}'),
(1887, '{"op_c":"a_n = 2 + (n - 1)·5","op_1":"a_n = 2n + 5","op_2":"a_n = 5 + (n - 1)·2","op_3":"a_n = 2 + 5/n"}'),
(1888, '{"op_c":"a_n = 2 + (n - 1)·5","op_1":"a_n = 2n - 5","op_2":"a_n = 5n - 2","op_3":"a_n = n + 5"}'),
(1889, '{"op_c":"a_n = 2 + (n - 1)·5","op_1":"a_n = 2 + 5/n","op_2":"a_n = 2n + 5","op_3":"a_n = 5 + (n - 1)·2"}'),
(1890, '{"op_c":"a_n = 2 + (n - 1)·5","op_1":"a_n = 5n - 2","op_2":"a_n = n + 5","op_3":"a_n = 2 × 5ⁿ"}');

-- ==========================================
-- PERGUNTA 5 (PRÁTICA)
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (37, 'Calcule o 8º termo da P.A. de primeiro termo v1 e razão v2 .');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":2,"v2":3}'),
(@pergunta_id, '{"v1":5,"v2":4}'),
(@pergunta_id, '{"v1":1,"v2":2}'),
(@pergunta_id, '{"v1":3,"v2":5}'),
(@pergunta_id, '{"v1":0,"v2":6}'),
(@pergunta_id, '{"v1":4,"v2":3}'),
(@pergunta_id, '{"v1":7,"v2":2}'),
(@pergunta_id, '{"v1":-1,"v2":4}'),
(@pergunta_id, '{"v1":2,"v2":1}'),
(@pergunta_id, '{"v1":6,"v2":-2}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(1891, '{"op_c":"23","op_1":"22","op_2":"25","op_3":"20"}'),
(1892, '{"op_c":"33","op_1":"30","op_2":"35","op_3":"28"}'),
(1893, '{"op_c":"15","op_1":"14","op_2":"16","op_3":"12"}'),
(1894, '{"op_c":"38","op_1":"35","op_2":"40","op_3":"37"}'),
(1895, '{"op_c":"42","op_1":"40","op_2":"43","op_3":"38"}'),
(1896, '{"op_c":"25","op_1":"23","op_2":"26","op_3":"22"}'),
(1897, '{"op_c":"21","op_1":"20","op_2":"22","op_3":"19"}'),
(1898, '{"op_c":"27","op_1":"25","op_2":"30","op_3":"24"}'),
(1899, '{"op_c":"9","op_1":"8","op_2":"10","op_3":"12"}'),
(1900, '{"op_c":"-8","op_1":"-6","op_2":"-9","op_3":"-10"}');

-- ==========================================
-- PERGUNTA 1
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (38, 'Qual é a fórmula para calcular a soma dos n primeiros termos de uma Progressão Aritmética (P.A.)?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"S_n = (a_1 + a_n)·n / 2"}'),
(@pergunta_id, '{"v1":"S_n = (a_1 - a_n)·n / 2"}'),
(@pergunta_id, '{"v1":"S_n = (a_1 + r)·n"}'),
(@pergunta_id, '{"v1":"S_n = (a_1 + n) / 2"}'),
(@pergunta_id, '{"v1":"S_n = n·a_1 + r"}'),
(@pergunta_id, '{"v1":"S_n = (a_1 + a_2) / n"}'),
(@pergunta_id, '{"v1":"S_n = n·(a_1 + r)"}'),
(@pergunta_id, '{"v1":"S_n = (a_1 + a_n) / 2"}'),
(@pergunta_id, '{"v1":"S_n = a_1 + (n - 1)·r"}'),
(@pergunta_id, '{"v1":"S_n = (a_1 + a_n) / n"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(1901, '{"op_c":"S_n = (a_1 + a_n)·n / 2","op_1":"S_n = (a_1 - a_n)·n / 2","op_2":"S_n = (a_1 + r)·n","op_3":"S_n = (a_1 + n) / 2"}'),
(1902, '{"op_c":"S_n = (a_1 + a_n)·n / 2","op_1":"S_n = n·a_1 + r","op_2":"S_n = (a_1 + a_2) / n","op_3":"S_n = (a_1 + a_n) / n"}'),
(1903, '{"op_c":"S_n = (a_1 + a_n)·n / 2","op_1":"S_n = a_1 + (n - 1)·r","op_2":"S_n = (a_1 + a_n) / 2","op_3":"S_n = n·(a_1 + r)"}'),
(1904, '{"op_c":"S_n = (a_1 + a_n)·n / 2","op_1":"S_n = n·a_1 + r","op_2":"S_n = (a_1 - a_n)·n / 2","op_3":"S_n = (a_1 + n) / 2"}'),
(1905, '{"op_c":"S_n = (a_1 + a_n)·n / 2","op_1":"S_n = (a_1 + r)·n","op_2":"S_n = n·(a_1 + r)","op_3":"S_n = (a_1 + a_2) / n"}'),
(1906, '{"op_c":"S_n = (a_1 + a_n)·n / 2","op_1":"S_n = (a_1 + a_n) / n","op_2":"S_n = (a_1 + r)·n","op_3":"S_n = a_1 + (n - 1)·r"}'),
(1907, '{"op_c":"S_n = (a_1 + a_n)·n / 2","op_1":"S_n = (a_1 + a_2) / n","op_2":"S_n = n·a_1 + r","op_3":"S_n = (a_1 + a_n) / 2"}'),
(1908, '{"op_c":"S_n = (a_1 + a_n)·n / 2","op_1":"S_n = a_1 + (n - 1)·r","op_2":"S_n = (a_1 - a_n)·n / 2","op_3":"S_n = n·(a_1 + r)"}'),
(1909, '{"op_c":"S_n = (a_1 + a_n)·n / 2","op_1":"S_n = n·a_1 + r","op_2":"S_n = (a_1 + r)·n","op_3":"S_n = (a_1 + a_2) / n"}'),
(1910, '{"op_c":"S_n = (a_1 + a_n)·n / 2","op_1":"S_n = (a_1 + a_n) / n","op_2":"S_n = n·(a_1 + r)","op_3":"S_n = (a_1 + r)·n"}');

-- ==========================================
-- PERGUNTA 2
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (38, 'Qual é a soma dos 10 primeiros termos da P.A. 2, 5, 8, ...?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":2,"v2":5,"v3":8}'),
(@pergunta_id, '{"v1":1,"v2":3,"v3":5}'),
(@pergunta_id, '{"v1":3,"v2":6,"v3":9}'),
(@pergunta_id, '{"v1":0,"v2":4,"v3":8}'),
(@pergunta_id, '{"v1":5,"v2":8,"v3":11}'),
(@pergunta_id, '{"v1":2,"v2":4,"v3":6}'),
(@pergunta_id, '{"v1":4,"v2":7,"v3":10}'),
(@pergunta_id, '{"v1":3,"v2":5,"v3":7}'),
(@pergunta_id, '{"v1":1,"v2":2,"v3":3}'),
(@pergunta_id, '{"v1":2,"v2":3,"v3":4}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(1911, '{"op_c":"155","op_1":"150","op_2":"160","op_3":"145"}'),
(1912, '{"op_c":"80","op_1":"75","op_2":"85","op_3":"70"}'),
(1913, '{"op_c":"255","op_1":"250","op_2":"260","op_3":"240"}'),
(1914, '{"op_c":"180","op_1":"175","op_2":"185","op_3":"190"}'),
(1915, '{"op_c":"275","op_1":"270","op_2":"280","op_3":"260"}'),
(1916, '{"op_c":"110","op_1":"105","op_2":"120","op_3":"100"}'),
(1917, '{"op_c":"205","op_1":"210","op_2":"215","op_3":"190"}'),
(1918, '{"op_c":"105","op_1":"100","op_2":"110","op_3":"95"}'),
(1919, '{"op_c":"55","op_1":"50","op_2":"60","op_3":"45"}'),
(1920, '{"op_c":"65","op_1":"60","op_2":"70","op_3":"55"}');

-- ==========================================
-- PERGUNTA 3
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (38, 'Se a soma dos 20 primeiros termos de uma P.A. é 710, e a razão é 5, qual é o primeiro termo?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":710,"v2":5,"v3":20}'),
(@pergunta_id, '{"v1":1050,"v2":10,"v3":15}'),
(@pergunta_id, '{"v1":630,"v2":7,"v3":18}'),
(@pergunta_id, '{"v1":190,"v2":3,"v3":10}'),
(@pergunta_id, '{"v1":325,"v2":5,"v3":13}'),
(@pergunta_id, '{"v1":990,"v2":8,"v3":22}'),
(@pergunta_id, '{"v1":1200,"v2":6,"v3":24}'),
(@pergunta_id, '{"v1":600,"v2":4,"v3":20}'),
(@pergunta_id, '{"v1":210,"v2":2,"v3":14}'),
(@pergunta_id, '{"v1":560,"v2":5,"v3":16}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(1921, '{"op_c":"-37.5","op_1":"-35","op_2":"-40","op_3":"-30"}'),
(1922, '{"op_c":"-20","op_1":"-25","op_2":"-15","op_3":"-18"}'),
(1923, '{"op_c":"-22.5","op_1":"-20","op_2":"-25","op_3":"-30"}'),
(1924, '{"op_c":"7","op_1":"5","op_2":"8","op_3":"10"}'),
(1925, '{"op_c":"-7.5","op_1":"-5","op_2":"-10","op_3":"-8"}'),
(1926, '{"op_c":"-18","op_1":"-20","op_2":"-22","op_3":"-15"}'),
(1927, '{"op_c":"-27","op_1":"-25","op_2":"-30","op_3":"-20"}'),
(1928, '{"op_c":"-17","op_1":"-15","op_2":"-18","op_3":"-10"}'),
(1929, '{"op_c":"-11","op_1":"-12","op_2":"-10","op_3":"-15"}'),
(1930, '{"op_c":"-19","op_1":"-17","op_2":"-20","op_3":"-15"}');

-- ==========================================
-- PERGUNTA 4
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (38, 'Em uma P.A. de primeiro termo 4 e último termo 34 com 16 termos, qual é a soma total?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":4,"v2":34,"v3":16}'),
(@pergunta_id, '{"v1":2,"v2":20,"v3":10}'),
(@pergunta_id, '{"v1":5,"v2":25,"v3":11}'),
(@pergunta_id, '{"v1":3,"v2":27,"v3":13}'),
(@pergunta_id, '{"v1":6,"v2":30,"v3":13}'),
(@pergunta_id, '{"v1":1,"v2":15,"v3":8}'),
(@pergunta_id, '{"v1":8,"v2":40,"v3":14}'),
(@pergunta_id, '{"v1":0,"v2":18,"v3":9}'),
(@pergunta_id, '{"v1":10,"v2":28,"v3":12}'),
(@pergunta_id, '{"v1":-5,"v2":15,"v3":9}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(1931, '{"op_c":"304","op_1":"300","op_2":"310","op_3":"290"}'),
(1932, '{"op_c":"110","op_1":"120","op_2":"100","op_3":"130"}'),
(1933, '{"op_c":"165","op_1":"160","op_2":"170","op_3":"150"}'),
(1934, '{"op_c":"195","op_1":"200","op_2":"190","op_3":"185"}'),
(1935, '{"op_c":"234","op_1":"230","op_2":"240","op_3":"220"}'),
(1936, '{"op_c":"64","op_1":"60","op_2":"70","op_3":"50"}'),
(1937, '{"op_c":"336","op_1":"330","op_2":"340","op_3":"320"}'),
(1938, '{"op_c":"81","op_1":"75","op_2":"90","op_3":"85"}'),
(1939, '{"op_c":"228","op_1":"230","op_2":"225","op_3":"220"}'),
(1940, '{"op_c":"45","op_1":"40","op_2":"50","op_3":"35"}');

-- ==========================================
-- PERGUNTA 5 (PRÁTICA)
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (38, 'Calcule a soma dos v3 primeiros termos de uma P.A. de primeiro termo v1 e razão v2.');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":2,"v2":3,"v3":10}'),
(@pergunta_id, '{"v1":1,"v2":2,"v3":15}'),
(@pergunta_id, '{"v1":5,"v2":4,"v3":8}'),
(@pergunta_id, '{"v1":3,"v2":5,"v3":12}'),
(@pergunta_id, '{"v1":0,"v2":6,"v3":10}'),
(@pergunta_id, '{"v1":7,"v2":3,"v3":9}'),
(@pergunta_id, '{"v1":2,"v2":5,"v3":6}'),
(@pergunta_id, '{"v1":4,"v2":4,"v3":7}'),
(@pergunta_id, '{"v1":1,"v2":1,"v3":20}'),
(@pergunta_id, '{"v1":10,"v2":2,"v3":5}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(1941, '{"op_c":"155","op_1":"150","op_2":"160","op_3":"145"}'),
(1942, '{"op_c":"240","op_1":"230","op_2":"245","op_3":"220"}'),
(1943, '{"op_c":"140","op_1":"135","op_2":"150","op_3":"125"}'),
(1944, '{"op_c":"198","op_1":"190","op_2":"200","op_3":"180"}'),
(1945, '{"op_c":"270","op_1":"260","op_2":"280","op_3":"250"}'),
(1946, '{"op_c":"153","op_1":"150","op_2":"160","op_3":"145"}'),
(1947, '{"op_c":"81","op_1":"80","op_2":"85","op_3":"70"}'),
(1948, '{"op_c":"112","op_1":"110","op_2":"115","op_3":"100"}'),
(1949, '{"op_c":"210","op_1":"205","op_2":"220","op_3":"200"}'),
(1950, '{"op_c":"50","op_1":"48","op_2":"52","op_3":"45"}');

-- ==========================================
-- PERGUNTA 1
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (39, 'O que significa interpolar termos em uma Progressão Aritmética (P.A.)?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"Inserir termos entre dois números de modo que formem uma P.A."}'),
(@pergunta_id, '{"v1":"Somar dois números consecutivos de uma P.A."}'),
(@pergunta_id, '{"v1":"Calcular o termo geral de uma P.A."}'),
(@pergunta_id, '{"v1":"Multiplicar os termos de uma P.A."}'),
(@pergunta_id, '{"v1":"Determinar o termo médio de uma sequência"}'),
(@pergunta_id, '{"v1":"Encontrar a soma dos n primeiros termos"}'),
(@pergunta_id, '{"v1":"Substituir os termos por seus inversos"}'),
(@pergunta_id, '{"v1":"Dividir uma P.A. em duas menores"}'),
(@pergunta_id, '{"v1":"Descobrir o último termo da sequência"}'),
(@pergunta_id, '{"v1":"Verificar se uma sequência é aritmética"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(1951, '{"op_c":"Inserir termos entre dois números de modo que formem uma P.A.","op_1":"Somar dois números consecutivos de uma P.A.","op_2":"Calcular o termo geral de uma P.A.","op_3":"Multiplicar os termos de uma P.A."}'),
(1952, '{"op_c":"Inserir termos entre dois números de modo que formem uma P.A.","op_1":"Determinar o termo médio de uma sequência","op_2":"Encontrar a soma dos n primeiros termos","op_3":"Dividir uma P.A. em duas menores"}'),
(1953, '{"op_c":"Inserir termos entre dois números de modo que formem uma P.A.","op_1":"Substituir os termos por seus inversos","op_2":"Verificar se uma sequência é aritmética","op_3":"Descobrir o último termo da sequência"}'),
(1954, '{"op_c":"Inserir termos entre dois números de modo que formem uma P.A.","op_1":"Somar dois números consecutivos de uma P.A.","op_2":"Dividir uma P.A. em duas menores","op_3":"Calcular o termo geral de uma P.A."}'),
(1955, '{"op_c":"Inserir termos entre dois números de modo que formem uma P.A.","op_1":"Multiplicar os termos de uma P.A.","op_2":"Encontrar a soma dos n primeiros termos","op_3":"Determinar o termo médio de uma sequência"}'),
(1956, '{"op_c":"Inserir termos entre dois números de modo que formem uma P.A.","op_1":"Verificar se uma sequência é aritmética","op_2":"Descobrir o último termo da sequência","op_3":"Substituir os termos por seus inversos"}'),
(1957, '{"op_c":"Inserir termos entre dois números de modo que formem uma P.A.","op_1":"Calcular o termo geral de uma P.A.","op_2":"Dividir uma P.A. em duas menores","op_3":"Encontrar a soma dos n primeiros termos"}'),
(1958, '{"op_c":"Inserir termos entre dois números de modo que formem uma P.A.","op_1":"Determinar o termo médio de uma sequência","op_2":"Multiplicar os termos de uma P.A.","op_3":"Substituir os termos por seus inversos"}'),
(1959, '{"op_c":"Inserir termos entre dois números de modo que formem uma P.A.","op_1":"Calcular o termo geral de uma P.A.","op_2":"Verificar se uma sequência é aritmética","op_3":"Descobrir o último termo da sequência"}'),
(1960, '{"op_c":"Inserir termos entre dois números de modo que formem uma P.A.","op_1":"Multiplicar os termos de uma P.A.","op_2":"Somar dois números consecutivos de uma P.A.","op_3":"Encontrar a soma dos n primeiros termos"}');

-- ==========================================
-- PERGUNTA 2
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (39, 'Quantos termos são inseridos ao interpolar v1 meios aritméticos entre v2 e v3 ?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":4,"v2":2,"v3":12}'),
(@pergunta_id, '{"v1":3,"v2":1,"v3":10}'),
(@pergunta_id, '{"v1":5,"v2":0,"v3":20}'),
(@pergunta_id, '{"v1":6,"v2":2,"v3":14}'),
(@pergunta_id, '{"v1":2,"v2":4,"v3":8}'),
(@pergunta_id, '{"v1":8,"v2":3,"v3":11}'),
(@pergunta_id, '{"v1":7,"v2":5,"v3":19}'),
(@pergunta_id, '{"v1":4,"v2":10,"v3":30}'),
(@pergunta_id, '{"v1":3,"v2":6,"v3":15}'),
(@pergunta_id, '{"v1":9,"v2":0,"v3":18}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(1961, '{"op_c":"4","op_1":"3","op_2":"5","op_3":"6"}'),
(1962, '{"op_c":"3","op_1":"2","op_2":"4","op_3":"5"}'),
(1963, '{"op_c":"5","op_1":"4","op_2":"6","op_3":"3"}'),
(1964, '{"op_c":"6","op_1":"5","op_2":"7","op_3":"4"}'),
(1965, '{"op_c":"2","op_1":"1","op_2":"3","op_3":"4"}'),
(1966, '{"op_c":"8","op_1":"7","op_2":"9","op_3":"5"}'),
(1967, '{"op_c":"7","op_1":"5","op_2":"8","op_3":"6"}'),
(1968, '{"op_c":"4","op_1":"3","op_2":"5","op_3":"2"}'),
(1969, '{"op_c":"3","op_1":"2","op_2":"4","op_3":"1"}'),
(1970, '{"op_c":"9","op_1":"8","op_2":"10","op_3":"7"}');

-- ==========================================
-- PERGUNTA 3
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (39, 'Ao inserir n meios aritméticos entre dois números, qual será o número total de termos da sequência formada?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"n + 2"}'),
(@pergunta_id, '{"v1":"n"}'),
(@pergunta_id, '{"v1":"n + 1"}'),
(@pergunta_id, '{"v1":"2n"}'),
(@pergunta_id, '{"v1":"n - 1"}'),
(@pergunta_id, '{"v1":"n²"}'),
(@pergunta_id, '{"v1":"2n + 1"}'),
(@pergunta_id, '{"v1":"3n"}'),
(@pergunta_id, '{"v1":"n + 3"}'),
(@pergunta_id, '{"v1":"n + 4"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(1971, '{"op_c":"n + 2","op_1":"n","op_2":"n + 1","op_3":"2n"}'),
(1972, '{"op_c":"n + 2","op_1":"n - 1","op_2":"2n + 1","op_3":"n + 3"}'),
(1973, '{"op_c":"n + 2","op_1":"n²","op_2":"n + 4","op_3":"3n"}'),
(1974, '{"op_c":"n + 2","op_1":"n + 3","op_2":"2n","op_3":"n - 1"}'),
(1975, '{"op_c":"n + 2","op_1":"2n + 1","op_2":"n²","op_3":"3n"}'),
(1976, '{"op_c":"n + 2","op_1":"2n","op_2":"n","op_3":"n + 4"}'),
(1977, '{"op_c":"n + 2","op_1":"n + 1","op_2":"n + 3","op_3":"2n + 1"}'),
(1978, '{"op_c":"n + 2","op_1":"n²","op_2":"n + 3","op_3":"3n"}'),
(1979, '{"op_c":"n + 2","op_1":"2n","op_2":"n - 1","op_3":"n + 4"}'),
(1980, '{"op_c":"n + 2","op_1":"2n + 1","op_2":"3n","op_3":"n²"}');

-- ==========================================
-- PERGUNTA 4
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (39, 'Qual é a razão de uma P.A. que interpola v3 meios aritméticos entre v1 e v2 ?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":2,"v2":14,"v3":3}'),
(@pergunta_id, '{"v1":4,"v2":16,"v3":3}'),
(@pergunta_id, '{"v1":0,"v2":12,"v3":3}'),
(@pergunta_id, '{"v1":5,"v2":17,"v3":3}'),
(@pergunta_id, '{"v1":1,"v2":13,"v3":3}'),
(@pergunta_id, '{"v1":3,"v2":15,"v3":3}'),
(@pergunta_id, '{"v1":2,"v2":20,"v3":4}'),
(@pergunta_id, '{"v1":6,"v2":18,"v3":3}'),
(@pergunta_id, '{"v1":-2,"v2":10,"v3":3}'),
(@pergunta_id, '{"v1":8,"v2":20,"v3":3}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(1981, '{"op_c":"3","op_1":"4","op_2":"2","op_3":"5"}'),
(1982, '{"op_c":"4","op_1":"3","op_2":"5","op_3":"2"}'),
(1983, '{"op_c":"3","op_1":"2","op_2":"4","op_3":"5"}'),
(1984, '{"op_c":"4","op_1":"5","op_2":"3","op_3":"2"}'),
(1985, '{"op_c":"3","op_1":"2","op_2":"4","op_3":"1"}'),
(1986, '{"op_c":"4","op_1":"5","op_2":"3","op_3":"2"}'),
(1987, '{"op_c":"4.5","op_1":"4","op_2":"5","op_3":"3"}'),
(1988, '{"op_c":"4","op_1":"3","op_2":"5","op_3":"2"}'),
(1989, '{"op_c":"3","op_1":"4","op_2":"2","op_3":"1"}'),
(1990, '{"op_c":"3","op_1":"4","op_2":"2","op_3":"5"}');

-- ==========================================
-- PERGUNTA 5 (PRÁTICA)
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (39, 'Interpolem v3 meios aritméticos entre v1 e v2 .');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":2,"v2":14,"v3":3}'),
(@pergunta_id, '{"v1":1,"v2":10,"v3":3}'),
(@pergunta_id, '{"v1":3,"v2":15,"v3":2}'),
(@pergunta_id, '{"v1":4,"v2":16,"v3":4}'),
(@pergunta_id, '{"v1":2,"v2":20,"v3":4}'),
(@pergunta_id, '{"v1":0,"v2":12,"v3":3}'),
(@pergunta_id, '{"v1":5,"v2":17,"v3":3}'),
(@pergunta_id, '{"v1":1,"v2":19,"v3":4}'),
(@pergunta_id, '{"v1":3,"v2":9,"v3":2}'),
(@pergunta_id, '{"v1":6,"v2":18,"v3":3}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(1991, '{"op_c":"5, 8, 11","op_1":"4, 8, 12","op_2":"3, 7, 11","op_3":"6, 9, 12"}'),
(1992, '{"op_c":"4, 7, 10","op_1":"3, 6, 9","op_2":"5, 8, 11","op_3":"2, 5, 8"}'),
(1993, '{"op_c":"7, 11","op_1":"8, 12","op_2":"6, 10","op_3":"9, 13"}'),
(1994, '{"op_c":"8, 12, 16, 20","op_1":"6, 10, 14, 18","op_2":"7, 11, 15, 19","op_3":"9, 13, 17, 21"}'),
(1995, '{"op_c":"6.5, 11, 15.5, 20","op_1":"5, 10, 15, 20","op_2":"4, 9, 14, 19","op_3":"7, 12, 17, 22"}'),
(1996, '{"op_c":"4, 8, 12","op_1":"3, 7, 11","op_2":"5, 9, 13","op_3":"2, 6, 10"}'),
(1997, '{"op_c":"8, 11, 14","op_1":"6, 9, 12","op_2":"7, 10, 13","op_3":"9, 12, 15"}'),
(1998, '{"op_c":"6.6, 10.2, 13.8, 17.4","op_1":"5, 9, 13, 17","op_2":"7, 11, 15, 19","op_3":"4, 8, 12, 16"}'),
(1999, '{"op_c":"5, 7","op_1":"4, 6","op_2":"6, 8","op_3":"3, 5"}'),
(2000, '{"op_c":"10, 12, 14","op_1":"8, 10, 12","op_2":"9, 11, 13","op_3":"11, 13, 15"}');

-- ==========================================
-- PERGUNTA 1
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (40, 'Qual é a fórmula do termo geral de uma Progressão Geométrica (P.G.)?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"a_n = a_1 · r^(n - 1)"}'),
(@pergunta_id, '{"v1":"a_n = a_1 + (n - 1)·r"}'),
(@pergunta_id, '{"v1":"a_n = a_1 / r^(n - 1)"}'),
(@pergunta_id, '{"v1":"a_n = a_1 · n^(r - 1)"}'),
(@pergunta_id, '{"v1":"a_n = a_1 × n × r"}'),
(@pergunta_id, '{"v1":"a_n = n · a_1 + r"}'),
(@pergunta_id, '{"v1":"a_n = a_1 + r^(n - 1)"}'),
(@pergunta_id, '{"v1":"a_n = a_1 × r × n"}'),
(@pergunta_id, '{"v1":"a_n = a_1 + (n - 1)/r"}'),
(@pergunta_id, '{"v1":"a_n = a_1 × (n - 1) · r"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(2001, '{"op_c":"a_n = a_1 · r^(n - 1)","op_1":"a_n = a_1 + (n - 1)·r","op_2":"a_n = a_1 / r^(n - 1)","op_3":"a_n = a_1 · n^(r - 1)"}'),
(2002, '{"op_c":"a_n = a_1 · r^(n - 1)","op_1":"a_n = a_1 × n × r","op_2":"a_n = n · a_1 + r","op_3":"a_n = a_1 + r^(n - 1)"}'),
(2003, '{"op_c":"a_n = a_1 · r^(n - 1)","op_1":"a_n = a_1 + (n - 1)/r","op_2":"a_n = a_1 × r × n","op_3":"a_n = a_1 + (n - 1)·r"}'),
(2004, '{"op_c":"a_n = a_1 · r^(n - 1)","op_1":"a_n = a_1 / r^(n - 1)","op_2":"a_n = a_1 + r^(n - 1)","op_3":"a_n = a_1 × (n - 1) · r"}'),
(2005, '{"op_c":"a_n = a_1 · r^(n - 1)","op_1":"a_n = a_1 + (n - 1)·r","op_2":"a_n = n · a_1 + r","op_3":"a_n = a_1 × n × r"}'),
(2006, '{"op_c":"a_n = a_1 · r^(n - 1)","op_1":"a_n = a_1 + (n - 1)/r","op_2":"a_n = a_1 + r^(n - 1)","op_3":"a_n = a_1 × r × n"}'),
(2007, '{"op_c":"a_n = a_1 · r^(n - 1)","op_1":"a_n = a_1 × (n - 1) · r","op_2":"a_n = a_1 / r^(n - 1)","op_3":"a_n = a_1 + (n - 1)·r"}'),
(2008, '{"op_c":"a_n = a_1 · r^(n - 1)","op_1":"a_n = n · a_1 + r","op_2":"a_n = a_1 × n × r","op_3":"a_n = a_1 + r^(n - 1)"}'),
(2009, '{"op_c":"a_n = a_1 · r^(n - 1)","op_1":"a_n = a_1 / r^(n - 1)","op_2":"a_n = a_1 × (n - 1) · r","op_3":"a_n = a_1 + (n - 1)/r"}'),
(2010, '{"op_c":"a_n = a_1 · r^(n - 1)","op_1":"a_n = a_1 + (n - 1)·r","op_2":"a_n = a_1 + r^(n - 1)","op_3":"a_n = n · a_1 + r"}');

-- ==========================================
-- PERGUNTA 2
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (40, 'Em uma P.G. de primeiro termo v1 e razão v2, qual é o 5º termo?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":2,"v2":3}'),
(@pergunta_id, '{"v1":1,"v2":2}'),
(@pergunta_id, '{"v1":3,"v2":2}'),
(@pergunta_id, '{"v1":5,"v2":2}'),
(@pergunta_id, '{"v1":4,"v2":3}'),
(@pergunta_id, '{"v1":2,"v2":4}'),
(@pergunta_id, '{"v1":1,"v2":5}'),
(@pergunta_id, '{"v1":3,"v2":3}'),
(@pergunta_id, '{"v1":2,"v2":5}'),
(@pergunta_id, '{"v1":5,"v2":3}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(2011, '{"op_c":"162","op_1":"81","op_2":"54","op_3":"243"}'),
(2012, '{"op_c":"16","op_1":"8","op_2":"12","op_3":"18"}'),
(2013, '{"op_c":"48","op_1":"24","op_2":"36","op_3":"60"}'),
(2014, '{"op_c":"80","op_1":"60","op_2":"70","op_3":"90"}'),
(2015, '{"op_c":"324","op_1":"216","op_2":"243","op_3":"432"}'),
(2016, '{"op_c":"512","op_1":"256","op_2":"1024","op_3":"128"}'),
(2017, '{"op_c":"625","op_1":"125","op_2":"3125","op_3":"25"}'),
(2018, '{"op_c":"243","op_1":"81","op_2":"729","op_3":"162"}'),
(2019, '{"op_c":"1250","op_1":"625","op_2":"2500","op_3":"500"}'),
(2020, '{"op_c":"405","op_1":"243","op_2":"486","op_3":"324"}');

-- ==========================================
-- PERGUNTA 3
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (40, 'Qual é o termo geral da P.G. com a₁ = v1 e r = v2 ?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":5,"v2":2}'),
(@pergunta_id, '{"v1":3,"v2":3}'),
(@pergunta_id, '{"v1":4,"v2":4}'),
(@pergunta_id, '{"v1":2,"v2":5}'),
(@pergunta_id, '{"v1":6,"v2":2}'),
(@pergunta_id, '{"v1":1,"v2":6}'),
(@pergunta_id, '{"v1":10,"v2":2}'),
(@pergunta_id, '{"v1":2,"v2":4}'),
(@pergunta_id, '{"v1":7,"v2":3}'),
(@pergunta_id, '{"v1":5,"v2":5}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(2021, '{"op_c":"a_n = 5 · 2^(n - 1)","op_1":"a_n = 5 + 2^(n - 1)","op_2":"a_n = 5 · (n - 1)","op_3":"a_n = 5 / 2^(n - 1)"}'),
(2022, '{"op_c":"a_n = 3 · 3^(n - 1)","op_1":"a_n = 3 + 3^(n - 1)","op_2":"a_n = 3 · (n - 1)","op_3":"a_n = 3 / 3^(n - 1)"}'),
(2023, '{"op_c":"a_n = 4 · 4^(n - 1)","op_1":"a_n = 4 + 4^(n - 1)","op_2":"a_n = 4 / 4^(n - 1)","op_3":"a_n = 4 · (n - 1)"}'),
(2024, '{"op_c":"a_n = 2 · 5^(n - 1)","op_1":"a_n = 2 + 5^(n - 1)","op_2":"a_n = 2 · (n - 1)","op_3":"a_n = 2 / 5^(n - 1)"}'),
(2025, '{"op_c":"a_n = 6 · 2^(n - 1)","op_1":"a_n = 6 + 2^(n - 1)","op_2":"a_n = 6 · (n - 1)","op_3":"a_n = 6 / 2^(n - 1)"}'),
(2026, '{"op_c":"a_n = 1 · 6^(n - 1)","op_1":"a_n = 1 + 6^(n - 1)","op_2":"a_n = 1 · (n - 1)","op_3":"a_n = 1 / 6^(n - 1)"}'),
(2027, '{"op_c":"a_n = 10 · 2^(n - 1)","op_1":"a_n = 10 + 2^(n - 1)","op_2":"a_n = 10 · (n - 1)","op_3":"a_n = 10 / 2^(n - 1)"}'),
(2028, '{"op_c":"a_n = 2 · 4^(n - 1)","op_1":"a_n = 2 + 4^(n - 1)","op_2":"a_n = 2 / 4^(n - 1)","op_3":"a_n = 2 · (n - 1)"}'),
(2029, '{"op_c":"a_n = 7 · 3^(n - 1)","op_1":"a_n = 7 + 3^(n - 1)","op_2":"a_n = 7 / 3^(n - 1)","op_3":"a_n = 7 · (n - 1)"}'),
(2030, '{"op_c":"a_n = 5 · 5^(n - 1)","op_1":"a_n = 5 + 5^(n - 1)","op_2":"a_n = 5 · (n - 1)","op_3":"a_n = 5 / 5^(n - 1)"}');

-- ==========================================
-- PERGUNTA 4
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (40, 'Qual é a razão de uma P.G. em que a₁ = v1 e a₄ = v2 ?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":2,"v2":16}'),
(@pergunta_id, '{"v1":3,"v2":81}'),
(@pergunta_id, '{"v1":4,"v2":64}'),
(@pergunta_id, '{"v1":5,"v2":40}'),
(@pergunta_id, '{"v1":6,"v2":48}'),
(@pergunta_id, '{"v1":1,"v2":27}'),
(@pergunta_id, '{"v1":2,"v2":54}'),
(@pergunta_id, '{"v1":10,"v2":160}'),
(@pergunta_id, '{"v1":8,"v2":64}'),
(@pergunta_id, '{"v1":5,"v2":80}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(2031, '{"op_c":"2","op_1":"4","op_2":"3","op_3":"8"}'),
(2032, '{"op_c":"3","op_1":"4","op_2":"9","op_3":"2"}'),
(2033, '{"op_c":"2","op_1":"3","op_2":"4","op_3":"5"}'),
(2034, '{"op_c":"2","op_1":"3","op_2":"4","op_3":"1"}'),
(2035, '{"op_c":"2","op_1":"4","op_2":"3","op_3":"5"}'),
(2036, '{"op_c":"3","op_1":"2","op_2":"4","op_3":"5"}'),
(2037, '{"op_c":"3","op_1":"2","op_2":"4","op_3":"5"}'),
(2038, '{"op_c":"2","op_1":"4","op_2":"3","op_3":"1"}'),
(2039, '{"op_c":"2","op_1":"4","op_2":"3","op_3":"5"}'),
(2040, '{"op_c":"2","op_1":"3","op_2":"4","op_3":"5"}');

-- ==========================================
-- PERGUNTA 5 (PRÁTICA)
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (40, 'Calcule o 6º termo da P.G. de primeiro termo v1 e razão v2 .');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":2,"v2":3}'),
(@pergunta_id, '{"v1":1,"v2":2}'),
(@pergunta_id, '{"v1":4,"v2":2}'),
(@pergunta_id, '{"v1":3,"v2":3}'),
(@pergunta_id, '{"v1":5,"v2":2}'),
(@pergunta_id, '{"v1":2,"v2":4}'),
(@pergunta_id, '{"v1":3,"v2":5}'),
(@pergunta_id, '{"v1":1,"v2":6}'),
(@pergunta_id, '{"v1":2,"v2":5}'),
(@pergunta_id, '{"v1":5,"v2":3}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(2041, '{"op_c":"486","op_1":"243","op_2":"162","op_3":"512"}'),
(2042, '{"op_c":"32","op_1":"16","op_2":"64","op_3":"48"}'),
(2043, '{"op_c":"128","op_1":"64","op_2":"256","op_3":"192"}'),
(2044, '{"op_c":"729","op_1":"512","op_2":"243","op_3":"1024"}'),
(2045, '{"op_c":"160","op_1":"128","op_2":"256","op_3":"192"}'),
(2046, '{"op_c":"2048","op_1":"1024","op_2":"512","op_3":"4096"}'),
(2047, '{"op_c":"9375","op_1":"3125","op_2":"15625","op_3":"6250"}'),
(2048, '{"op_c":"7776","op_1":"46656","op_2":"216","op_3":"1296"}'),
(2049, '{"op_c":"6250","op_1":"1250","op_2":"2500","op_3":"3125"}'),
(2050, '{"op_c":"1215","op_1":"729","op_2":"2187","op_3":"243"}');

-- ==========================================
-- PERGUNTA 1
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (41, 'Qual é a fórmula da soma dos n primeiros termos de uma P.G. finita?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"S_n = a_1 (r^n - 1) / (r - 1)"}'),
(@pergunta_id, '{"v1":"S_n = a_1 (r^n + 1) / (r - 1)"}'),
(@pergunta_id, '{"v1":"S_n = a_1 (r^n - 1) / (1 - r)"}'),
(@pergunta_id, '{"v1":"S_n = a_1 (r - 1) / (r^n - 1)"}'),
(@pergunta_id, '{"v1":"S_n = a_1 (n - 1) / r"}'),
(@pergunta_id, '{"v1":"S_n = a_1 n / (r - 1)"}'),
(@pergunta_id, '{"v1":"S_n = a_1 + a_n / 2"}'),
(@pergunta_id, '{"v1":"S_n = n · a_1 · r"}'),
(@pergunta_id, '{"v1":"S_n = a_1 (1 - r^n)"}'),
(@pergunta_id, '{"v1":"S_n = (a_1 + a_n) / n"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(2051, '{"op_c":"S_n = a_1 (r^n - 1) / (r - 1)","op_1":"S_n = a_1 (r^n - 1) / (1 - r)","op_2":"S_n = a_1 n / (r - 1)","op_3":"S_n = a_1 (r - 1) / (r^n - 1)"}'),
(2052, '{"op_c":"S_n = a_1 (r^n - 1) / (r - 1)","op_1":"S_n = a_1 (r^n + 1) / (r - 1)","op_2":"S_n = a_1 (1 - r^n)","op_3":"S_n = a_1 n / (r - 1)"}'),
(2053, '{"op_c":"S_n = a_1 (r^n - 1) / (r - 1)","op_1":"S_n = (a_1 + a_n) / n","op_2":"S_n = a_1 (1 - r^n)","op_3":"S_n = a_1 (r - 1) / (r^n - 1)"}'),
(2054, '{"op_c":"S_n = a_1 (r^n - 1) / (r - 1)","op_1":"S_n = a_1 + a_n / 2","op_2":"S_n = n · a_1 · r","op_3":"S_n = a_1 (1 - r^n)"}'),
(2055, '{"op_c":"S_n = a_1 (r^n - 1) / (r - 1)","op_1":"S_n = a_1 n / (r - 1)","op_2":"S_n = a_1 (r - 1) / (r^n - 1)","op_3":"S_n = (a_1 + a_n) / n"}'),
(2056, '{"op_c":"S_n = a_1 (r^n - 1) / (r - 1)","op_1":"S_n = a_1 (1 - r^n)","op_2":"S_n = n · a_1 · r","op_3":"S_n = a_1 n / (r - 1)"}'),
(2057, '{"op_c":"S_n = a_1 (r^n - 1) / (r - 1)","op_1":"S_n = a_1 (r^n + 1) / (r - 1)","op_2":"S_n = a_1 + a_n / 2","op_3":"S_n = n · a_1 · r"}'),
(2058, '{"op_c":"S_n = a_1 (r^n - 1) / (r - 1)","op_1":"S_n = a_1 (r^n - 1) / (1 - r)","op_2":"S_n = a_1 n / (r - 1)","op_3":"S_n = a_1 (1 - r^n)"}'),
(2059, '{"op_c":"S_n = a_1 (r^n - 1) / (r - 1)","op_1":"S_n = (a_1 + a_n) / n","op_2":"S_n = a_1 + a_n / 2","op_3":"S_n = a_1 (r - 1) / (r^n - 1)"}'),
(2060, '{"op_c":"S_n = a_1 (r^n - 1) / (r - 1)","op_1":"S_n = a_1 (1 - r^n)","op_2":"S_n = n · a_1 · r","op_3":"S_n = a_1 n / (r - 1)"}');

-- ==========================================
-- PERGUNTA 2
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (41, 'Qual é a fórmula da soma infinita de uma P.G. com razão |r| < 1?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"S = a_1 / (1 - r)"}'),
(@pergunta_id, '{"v1":"S = a_1 (1 - r)"}'),
(@pergunta_id, '{"v1":"S = a_1 (r - 1)"}'),
(@pergunta_id, '{"v1":"S = a_1 / (r - 1)"}'),
(@pergunta_id, '{"v1":"S = (a_1 + a_n) / 2"}'),
(@pergunta_id, '{"v1":"S = a_1 (1 + r)"}'),
(@pergunta_id, '{"v1":"S = a_1 · r / (1 - r)"}'),
(@pergunta_id, '{"v1":"S = a_1 / (1 + r)"}'),
(@pergunta_id, '{"v1":"S = a_1 (r + 1) / 2"}'),
(@pergunta_id, '{"v1":"S = n · a_1 / (1 - r)"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(2061, '{"op_c":"S = a_1 / (1 - r)","op_1":"S = a_1 (1 - r)","op_2":"S = a_1 / (r - 1)","op_3":"S = (a_1 + a_n) / 2"}'),
(2062, '{"op_c":"S = a_1 / (1 - r)","op_1":"S = a_1 / (r - 1)","op_2":"S = a_1 (r - 1)","op_3":"S = a_1 / (1 + r)"}'),
(2063, '{"op_c":"S = a_1 / (1 - r)","op_1":"S = a_1 (1 + r)","op_2":"S = a_1 (1 - r)","op_3":"S = n · a_1 / (1 - r)"}'),
(2064, '{"op_c":"S = a_1 / (1 - r)","op_1":"S = a_1 · r / (1 - r)","op_2":"S = a_1 (r + 1) / 2","op_3":"S = a_1 / (r - 1)"}'),
(2065, '{"op_c":"S = a_1 / (1 - r)","op_1":"S = a_1 (r - 1)","op_2":"S = a_1 (1 + r)","op_3":"S = a_1 / (r - 1)"}'),
(2066, '{"op_c":"S = a_1 / (1 - r)","op_1":"S = (a_1 + a_n) / 2","op_2":"S = a_1 (1 - r)","op_3":"S = a_1 / (r - 1)"}'),
(2067, '{"op_c":"S = a_1 / (1 - r)","op_1":"S = n · a_1 / (1 - r)","op_2":"S = a_1 (r + 1) / 2","op_3":"S = a_1 (1 - r)"}'),
(2068, '{"op_c":"S = a_1 / (1 - r)","op_1":"S = a_1 (1 + r)","op_2":"S = a_1 / (1 + r)","op_3":"S = a_1 (r - 1)"}'),
(2069, '{"op_c":"S = a_1 / (1 - r)","op_1":"S = a_1 / (r - 1)","op_2":"S = a_1 (1 - r)","op_3":"S = n · a_1 / (1 - r)"}'),
(2070, '{"op_c":"S = a_1 / (1 - r)","op_1":"S = a_1 (1 + r)","op_2":"S = a_1 (r - 1)","op_3":"S = a_1 / (r - 1)"}');

-- ==========================================
-- PERGUNTA 3
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (41, 'Em uma P.G. com a₁ = v1, r = v2 e n = v3, qual é a soma dos termos?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":2,"v2":2,"v3":4}'),
(@pergunta_id, '{"v1":3,"v2":2,"v3":3}'),
(@pergunta_id, '{"v1":1,"v2":3,"v3":4}'),
(@pergunta_id, '{"v1":5,"v2":2,"v3":3}'),
(@pergunta_id, '{"v1":4,"v2":3,"v3":3}'),
(@pergunta_id, '{"v1":2,"v2":3,"v3":4}'),
(@pergunta_id, '{"v1":3,"v2":4,"v3":3}'),
(@pergunta_id, '{"v1":2,"v2":5,"v3":3}'),
(@pergunta_id, '{"v1":5,"v2":3,"v3":4}'),
(@pergunta_id, '{"v1":3,"v2":2,"v3":4}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(2071, '{"op_c":"30","op_1":"20","op_2":"16","op_3":"24"}'),
(2072, '{"op_c":"21","op_1":"18","op_2":"24","op_3":"30"}'),
(2073, '{"op_c":"40","op_1":"20","op_2":"27","op_3":"81"}'),
(2074, '{"op_c":"35","op_1":"25","op_2":"30","op_3":"40"}'),
(2075, '{"op_c":"52","op_1":"36","op_2":"48","op_3":"54"}'),
(2076, '{"op_c":"80","op_1":"60","op_2":"64","op_3":"72"}'),
(2077, '{"op_c":"255","op_1":"85","op_2":"170","op_3":"340"}'),
(2078, '{"op_c":"155","op_1":"125","op_2":"200","op_3":"100"}'),
(2079, '{"op_c":"170","op_1":"85","op_2":"255","op_3":"340"}'),
(2080, '{"op_c":"30","op_1":"24","op_2":"20","op_3":"16"}');

-- ==========================================
-- PERGUNTA 4
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (41, 'Uma P.G. tem a₁ = v1 e r = v2 . Qual é a soma infinita?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":3,"v2":0.5}'),
(@pergunta_id, '{"v1":6,"v2":0.5}'),
(@pergunta_id, '{"v1":2,"v2":0.25}'),
(@pergunta_id, '{"v1":5,"v2":0.5}'),
(@pergunta_id, '{"v1":4,"v2":0.25}'),
(@pergunta_id, '{"v1":10,"v2":0.5}'),
(@pergunta_id, '{"v1":8,"v2":0.25}'),
(@pergunta_id, '{"v1":6,"v2":0.25}'),
(@pergunta_id, '{"v1":12,"v2":0.5}'),
(@pergunta_id, '{"v1":3,"v2":0.25}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(2081, '{"op_c":"6","op_1":"4","op_2":"8","op_3":"3"}'),
(2082, '{"op_c":"12","op_1":"9","op_2":"6","op_3":"10"}'),
(2083, '{"op_c":"2.67","op_1":"4","op_2":"3","op_3":"2"}'),
(2084, '{"op_c":"10","op_1":"7","op_2":"8","op_3":"9"}'),
(2085, '{"op_c":"5.33","op_1":"4","op_2":"6","op_3":"3"}'),
(2086, '{"op_c":"20","op_1":"15","op_2":"25","op_3":"18"}'),
(2087, '{"op_c":"10.67","op_1":"8","op_2":"12","op_3":"9"}'),
(2088, '{"op_c":"8","op_1":"6","op_2":"9","op_3":"7"}'),
(2089, '{"op_c":"24","op_1":"12","op_2":"18","op_3":"15"}'),
(2090, '{"op_c":"4","op_1":"3","op_2":"6","op_3":"5"}');

-- ==========================================
-- PERGUNTA 5 (PRÁTICA)
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (41, 'Calcule a soma dos 5 primeiros termos da P.G. de a₁ = v1 e r = v2.');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":2,"v2":2}'),
(@pergunta_id, '{"v1":3,"v2":2}'),
(@pergunta_id, '{"v1":5,"v2":2}'),
(@pergunta_id, '{"v1":2,"v2":3}'),
(@pergunta_id, '{"v1":4,"v2":3}'),
(@pergunta_id, '{"v1":1,"v2":2}'),
(@pergunta_id, '{"v1":6,"v2":2}'),
(@pergunta_id, '{"v1":5,"v2":3}'),
(@pergunta_id, '{"v1":3,"v2":3}'),
(@pergunta_id, '{"v1":2,"v2":5}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(2091, '{"op_c":"62","op_1":"60","op_2":"64","op_3":"56"}'),
(2092, '{"op_c":"93","op_1":"81","op_2":"90","op_3":"96"}'),
(2093, '{"op_c":"155","op_1":"140","op_2":"160","op_3":"150"}'),
(2094, '{"op_c":"242","op_1":"210","op_2":"270","op_3":"200"}'),
(2095, '{"op_c":"484","op_1":"400","op_2":"512","op_3":"450"}'),
(2096, '{"op_c":"31","op_1":"30","op_2":"28","op_3":"32"}'),
(2097, '{"op_c":"186","op_1":"150","op_2":"160","op_3":"200"}'),
(2098, '{"op_c":"605","op_1":"540","op_2":"580","op_3":"512"}'),
(2099, '{"op_c":"363","op_1":"300","op_2":"400","op_3":"324"}'),
(2100, '{"op_c":"1562","op_1":"1250","op_2":"1500","op_3":"1600"}');

-- ==========================================
-- PERGUNTA 1
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (42, 'O que é o limite de uma sequência?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"É o valor que os termos da sequência se aproximam à medida que n tende ao infinito."}'),
(@pergunta_id, '{"v1":"É o primeiro termo da sequência."}'),
(@pergunta_id, '{"v1":"É a diferença entre dois termos consecutivos."}'),
(@pergunta_id, '{"v1":"É a soma de todos os termos da sequência."}'),
(@pergunta_id, '{"v1":"É o produto entre o primeiro e o último termo."}'),
(@pergunta_id, '{"v1":"É o termo de maior valor na sequência."}'),
(@pergunta_id, '{"v1":"É o termo de menor valor na sequência."}'),
(@pergunta_id, '{"v1":"É o número de termos da sequência."}'),
(@pergunta_id, '{"v1":"É o termo médio entre dois consecutivos."}'),
(@pergunta_id, '{"v1":"É o número que multiplica todos os termos."}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(2101, '{"op_c":"É o valor que os termos da sequência se aproximam à medida que n tende ao infinito.","op_1":"É o primeiro termo da sequência.","op_2":"É a soma de todos os termos.","op_3":"É o termo médio entre dois consecutivos."}'),
(2102, '{"op_c":"É o valor que os termos da sequência se aproximam à medida que n tende ao infinito.","op_1":"É o produto entre o primeiro e o último termo.","op_2":"É a diferença entre dois termos consecutivos.","op_3":"É o número de termos da sequência."}'),
(2103, '{"op_c":"É o valor que os termos da sequência se aproximam à medida que n tende ao infinito.","op_1":"É o termo de menor valor.","op_2":"É o termo médio entre dois consecutivos.","op_3":"É o termo de maior valor."}'),
(2104, '{"op_c":"É o valor que os termos da sequência se aproximam à medida que n tende ao infinito.","op_1":"É o número que multiplica todos os termos.","op_2":"É a soma de todos os termos.","op_3":"É o termo médio entre dois consecutivos."}'),
(2105, '{"op_c":"É o valor que os termos da sequência se aproximam à medida que n tende ao infinito.","op_1":"É a diferença entre dois termos consecutivos.","op_2":"É o produto entre o primeiro e o último termo.","op_3":"É o termo de maior valor."}'),
(2106, '{"op_c":"É o valor que os termos da sequência se aproximam à medida que n tende ao infinito.","op_1":"É o número de termos.","op_2":"É o termo médio entre dois consecutivos.","op_3":"É o termo de menor valor."}'),
(2107, '{"op_c":"É o valor que os termos da sequência se aproximam à medida que n tende ao infinito.","op_1":"É o termo médio entre dois consecutivos.","op_2":"É o número de termos.","op_3":"É o primeiro termo da sequência."}'),
(2108, '{"op_c":"É o valor que os termos da sequência se aproximam à medida que n tende ao infinito.","op_1":"É o produto entre o primeiro e o último termo.","op_2":"É a soma de todos os termos.","op_3":"É o termo de maior valor."}'),
(2109, '{"op_c":"É o valor que os termos da sequência se aproximam à medida que n tende ao infinito.","op_1":"É o número que multiplica todos os termos.","op_2":"É o termo médio entre dois consecutivos.","op_3":"É a diferença entre dois termos consecutivos."}'),
(2110, '{"op_c":"É o valor que os termos da sequência se aproximam à medida que n tende ao infinito.","op_1":"É o termo médio entre dois consecutivos.","op_2":"É o número de termos.","op_3":"É o produto entre o primeiro e o último termo."}');

-- ==========================================
-- PERGUNTA 2
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (42, 'Quando dizemos que uma sequência converge?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"Quando seus termos se aproximam de um número fixo."}'),
(@pergunta_id, '{"v1":"Quando seus termos crescem indefinidamente."}'),
(@pergunta_id, '{"v1":"Quando a sequência não tem limite."}'),
(@pergunta_id, '{"v1":"Quando seus termos se alternam entre valores positivos e negativos."}'),
(@pergunta_id, '{"v1":"Quando todos os termos são iguais a zero."}'),
(@pergunta_id, '{"v1":"Quando a sequência é decrescente."}'),
(@pergunta_id, '{"v1":"Quando há apenas um termo."}'),
(@pergunta_id, '{"v1":"Quando seus termos são aleatórios."}'),
(@pergunta_id, '{"v1":"Quando seus termos se repetem periodicamente."}'),
(@pergunta_id, '{"v1":"Quando seus termos formam uma progressão geométrica com razão maior que 1."}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(2111, '{"op_c":"Quando seus termos se aproximam de um número fixo.","op_1":"Quando crescem indefinidamente.","op_2":"Quando a sequência é decrescente.","op_3":"Quando se alternam entre positivos e negativos."}'),
(2112, '{"op_c":"Quando seus termos se aproximam de um número fixo.","op_1":"Quando a sequência não tem limite.","op_2":"Quando seus termos se repetem periodicamente.","op_3":"Quando há apenas um termo."}'),
(2113, '{"op_c":"Quando seus termos se aproximam de um número fixo.","op_1":"Quando seus termos são aleatórios.","op_2":"Quando crescem indefinidamente.","op_3":"Quando todos os termos são iguais a zero."}'),
(2114, '{"op_c":"Quando seus termos se aproximam de um número fixo.","op_1":"Quando a sequência é decrescente.","op_2":"Quando há apenas um termo.","op_3":"Quando seus termos são aleatórios."}'),
(2115, '{"op_c":"Quando seus termos se aproximam de um número fixo.","op_1":"Quando todos os termos são iguais a zero.","op_2":"Quando seus termos se alternam entre positivos e negativos.","op_3":"Quando seus termos crescem indefinidamente."}'),
(2116, '{"op_c":"Quando seus termos se aproximam de um número fixo.","op_1":"Quando se alternam entre positivos e negativos.","op_2":"Quando a sequência não tem limite.","op_3":"Quando há apenas um termo."}'),
(2117, '{"op_c":"Quando seus termos se aproximam de um número fixo.","op_1":"Quando seus termos são aleatórios.","op_2":"Quando crescem indefinidamente.","op_3":"Quando se repetem periodicamente."}'),
(2118, '{"op_c":"Quando seus termos se aproximam de um número fixo.","op_1":"Quando a sequência é decrescente.","op_2":"Quando há apenas um termo.","op_3":"Quando seus termos formam uma P.G. com r > 1."}'),
(2119, '{"op_c":"Quando seus termos se aproximam de um número fixo.","op_1":"Quando todos os termos são iguais a zero.","op_2":"Quando crescem indefinidamente.","op_3":"Quando há apenas um termo."}'),
(2120, '{"op_c":"Quando seus termos se aproximam de um número fixo.","op_1":"Quando se alternam entre positivos e negativos.","op_2":"Quando seus termos são aleatórios.","op_3":"Quando se repetem periodicamente."}');

-- ==========================================
-- PERGUNTA 3
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (42, 'Quando dizemos que uma sequência diverge?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"Quando seus termos não se aproximam de um valor fixo."}'),
(@pergunta_id, '{"v1":"Quando seus termos se aproximam de zero."}'),
(@pergunta_id, '{"v1":"Quando há um limite finito."}'),
(@pergunta_id, '{"v1":"Quando seus termos são constantes."}'),
(@pergunta_id, '{"v1":"Quando há apenas um termo."}'),
(@pergunta_id, '{"v1":"Quando todos os termos são iguais a 1."}'),
(@pergunta_id, '{"v1":"Quando há termos nulos."}'),
(@pergunta_id, '{"v1":"Quando há termos negativos."}'),
(@pergunta_id, '{"v1":"Quando há termos pares e ímpares alternados."}'),
(@pergunta_id, '{"v1":"Quando há uma P.G. com razão menor que 1."}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(2121, '{"op_c":"Quando seus termos não se aproximam de um valor fixo.","op_1":"Quando há um limite finito.","op_2":"Quando há apenas um termo.","op_3":"Quando há termos negativos."}'),
(2122, '{"op_c":"Quando seus termos não se aproximam de um valor fixo.","op_1":"Quando há uma P.G. com r < 1.","op_2":"Quando há termos nulos.","op_3":"Quando há termos constantes."}'),
(2123, '{"op_c":"Quando seus termos não se aproximam de um valor fixo.","op_1":"Quando há um limite finito.","op_2":"Quando há termos negativos.","op_3":"Quando há termos pares e ímpares alternados."}'),
(2124, '{"op_c":"Quando seus termos não se aproximam de um valor fixo.","op_1":"Quando todos os termos são iguais a 1.","op_2":"Quando há termos nulos.","op_3":"Quando há uma P.G. com razão menor que 1."}'),
(2125, '{"op_c":"Quando seus termos não se aproximam de um valor fixo.","op_1":"Quando há um limite finito.","op_2":"Quando há termos pares e ímpares alternados.","op_3":"Quando há termos negativos."}'),
(2126, '{"op_c":"Quando seus termos não se aproximam de um valor fixo.","op_1":"Quando há um limite finito.","op_2":"Quando há termos pares e ímpares alternados.","op_3":"Quando há termos negativos."}'),
(2127, '{"op_c":"Quando seus termos não se aproximam de um valor fixo.","op_1":"Quando há um limite finito.","op_2":"Quando há termos pares e ímpares alternados.","op_3":"Quando há termos negativos."}'),
(2128, '{"op_c":"Quando seus termos não se aproximam de um valor fixo.","op_1":"Quando há um limite finito.","op_2":"Quando há termos pares e ímpares alternados.","op_3":"Quando há termos negativos."}'),
(2129, '{"op_c":"Quando seus termos não se aproximam de um valor fixo.","op_1":"Quando há um limite finito.","op_2":"Quando há termos pares e ímpares alternados.","op_3":"Quando há termos negativos."}'),
(2130, '{"op_c":"Quando seus termos não se aproximam de um valor fixo.","op_1":"Quando há um limite finito.","op_2":"Quando há termos pares e ímpares alternados.","op_3":"Quando há termos negativos."}');

-- ==========================================
-- PERGUNTA 4
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (42, 'Qual é o limite da sequência aₙ = 1/n quando n tende ao infinito?');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":"1/n"}'),
(@pergunta_id, '{"v1":"2/n"}'),
(@pergunta_id, '{"v1":"3/n"}'),
(@pergunta_id, '{"v1":"5/n"}'),
(@pergunta_id, '{"v1":"10/n"}'),
(@pergunta_id, '{"v1":"1/(2n)"}'),
(@pergunta_id, '{"v1":"1/(3n)"}'),
(@pergunta_id, '{"v1":"4/n"}'),
(@pergunta_id, '{"v1":"1/(5n)"}'),
(@pergunta_id, '{"v1":"n/(n+1)"}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(2131, '{"op_c":"0","op_1":"1","op_2":"∞","op_3":"Indeterminado"}'),
(2132, '{"op_c":"0","op_1":"1","op_2":"∞","op_3":"Indeterminado"}'),
(2133, '{"op_c":"0","op_1":"1","op_2":"∞","op_3":"Indeterminado"}'),
(2134, '{"op_c":"0","op_1":"1","op_2":"∞","op_3":"Indeterminado"}'),
(2135, '{"op_c":"0","op_1":"1","op_2":"∞","op_3":"Indeterminado"}'),
(2136, '{"op_c":"0","op_1":"1","op_2":"∞","op_3":"Indeterminado"}'),
(2137, '{"op_c":"0","op_1":"1","op_2":"∞","op_3":"Indeterminado"}'),
(2138, '{"op_c":"0","op_1":"1","op_2":"∞","op_3":"Indeterminado"}'),
(2139, '{"op_c":"0","op_1":"1","op_2":"∞","op_3":"Indeterminado"}'),
(2140, '{"op_c":"1","op_1":"0","op_2":"∞","op_3":"Indeterminado"}');

-- ==========================================
-- PERGUNTA 5 (PRÁTICA)
-- ==========================================
INSERT INTO Perguntas (materia_id, texto)
VALUES (42, 'Calcule o limite da sequência aₙ = (v1·n + v2)/(n + v3), quando n tende ao infinito.');
SET @pergunta_id = LAST_INSERT_ID();

INSERT INTO Variaveis (pergunta_id, valores) VALUES
(@pergunta_id, '{"v1":1,"v2":2,"v3":3}'),
(@pergunta_id, '{"v1":2,"v2":1,"v3":1}'),
(@pergunta_id, '{"v1":3,"v2":2,"v3":1}'),
(@pergunta_id, '{"v1":4,"v2":1,"v3":2}'),
(@pergunta_id, '{"v1":5,"v2":3,"v3":4}'),
(@pergunta_id, '{"v1":2,"v2":5,"v3":2}'),
(@pergunta_id, '{"v1":3,"v2":4,"v3":3}'),
(@pergunta_id, '{"v1":1,"v2":0,"v3":5}'),
(@pergunta_id, '{"v1":6,"v2":2,"v3":1}'),
(@pergunta_id, '{"v1":1,"v2":3,"v3":1}');

INSERT INTO Alternativas (Variaveis_id, opcoes) VALUES
(2141, '{"op_c":"1","op_1":"2","op_2":"0","op_3":"∞"}'),
(2142, '{"op_c":"2","op_1":"1","op_2":"3","op_3":"0"}'),
(2143, '{"op_c":"3","op_1":"2","op_2":"1","op_3":"∞"}'),
(2144, '{"op_c":"4","op_1":"2","op_2":"3","op_3":"0"}'),
(2145, '{"op_c":"5","op_1":"4","op_2":"6","op_3":"0"}'),
(2146, '{"op_c":"2","op_1":"3","op_2":"1","op_3":"∞"}'),
(2147, '{"op_c":"3","op_1":"2","op_2":"4","op_3":"0"}'),
(2148, '{"op_c":"1","op_1":"0","op_2":"2","op_3":"∞"}'),
(2149, '{"op_c":"6","op_1":"5","op_2":"4","op_3":"∞"}'),
(2150, '{"op_c":"1","op_1":"2","op_2":"0","op_3":"∞"}');
    
    -- INSERINDO A PERGUNTA BASE
	
