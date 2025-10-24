create database Ceremath;
    use Ceremath;
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
		id_conceito int not null, 
		concluido TINYINT NOT NULL DEFAULT 0, 
		acertos int not null DEFAULT 0, 
		erros int not null DEFAULT 0, 
		atualizado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, 
		PRIMARY KEY (id_user, id_conceito), 
		foreign key(id_user) references users(id), 
		foreign key(id_conceito) references Conceito(id) 
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
        id_conquista int not null,	
        concluido TINYINT NOT NULL DEFAULT 0,  
        atualizado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        primary key (id_user, id_conquista),
        foreign key(id_user) references users(id),
        foreign key(id_conquista) references Conquista(id)
    );

    -- Tabela principal com a pergunta base e placeholders
    CREATE TABLE perguntas (
        id INT AUTO_INCREMENT PRIMARY KEY,
        materia_id INT NOT NULL,
        texto TEXT NOT NULL, -- Exemplo: "Considere a equação [v1]x + [v2] = [v3]. Descubra o valor de x."
        FOREIGN KEY (materia_id) REFERENCES Conceito(id)
    );
    -- Tabela que armazena os nomes das variáveis (ex: v1, v2) e seus possíveis valores
    CREATE TABLE variaveis (
        id INT AUTO_INCREMENT PRIMARY KEY,
        pergunta_id INT NOT NULL,
        valores JSON NOT NULL,     -- Exemplo: '{"v1": 1, "v2": 1}'
        FOREIGN KEY (pergunta_id) REFERENCES perguntas(id) ON DELETE CASCADE
    );
    -- Tabela opcional para armazenar alternativas geradas (ex: se quiser salvar)
    CREATE TABLE alternativas (
        id INT AUTO_INCREMENT PRIMARY KEY,
		pergunta_id INT NOT NULL,
        variaveis_id INT NOT NULL,
        opcoes JSON NOT NULL, -- Ex: '{"op_c": 0, "op_2": 1, "op_3": 2, "op_4": 3}' - op_c é a correta!
        FOREIGN KEY (variaveis_id) REFERENCES variaveis(id) ON DELETE CASCADE,
        FOREIGN KEY (pergunta_id) REFERENCES perguntas(id) ON DELETE CASCADE
    );
    
    insert into Users (email, username, password) values
    ("ceremath.tcc@gmail.com", "Ceremath", "123123123");
    

    INSERT INTO Conquista (nome, descricao, raridade, trigger_key) VALUES
	('Bem vindo', 'Conquistada por fazer a primeira conta', 'Comum', 'CRIAR_CONTA'),
	('Explorador', 'Acessou 5 conteúdos diferentes', 'Comum', 'VISITAS_5_CONTEUDOS'),
	('Curioso(a)', 'Fez a primeira pergunta para a IA', 'Comum', 'CHAT_IA_PRIMEIRA_VEZ'),
	('Navegador(a)', 'Visitou tudo do site', 'Comum', 'VISITOU_TUDO'),
	('Águia', 'Concluiu uma lição sem pedir ajuda à IA', 'Rara', 'SEM_AJUDA_IA'),
	('Nunca desista', 'Tentou mais de duas vezes fazer a lição depois de não passar', 'Rara', 'TENTOU_VARIAS_VEZES'),
	('Memória de elefante', 'Concluiu uma lição que já havia visto novamente', 'Rara', 'LICAO_REFEITA'),
	('Primeiro Histórico', 'Viu o histórico pelo menos uma vez das lições concluídas', 'Comum', 'ABRIU_HISTORICO'),
	('Concluiu Conjuntos', 'Finalizou todos os conceitos de Conjuntos', 'Épica', 'CONC	LUIU_CONJUNTOS'),
	('Concluiu Função Afim', 'Finalizou todos os conceitos de Função Afim', 'Épica', 'CONCLUIU_FUNCAO_AFIM'),
	('Concluiu Função Quadrática', 'Finalizou todos os conceitos de Função Quadrática', 'Épica', 'CONCLUIU_FUNCAO_QUADRATICA'),
	('Concluiu Função Exponencial', 'Finalizou todos os conceitos de Função Exponencial', 'Épica', 'CONCLUIU_FUNCAO_EXPONENCIAL'),
	('Concluiu Trigonometria', 'Finalizou todos os conceitos de Trigonometria', 'Épica', 'CONCLUIU_TRIGONOMETRIA'),
	('Concluiu Matrizes', 'Finalizou todos os conceitos de Matrizes', 'Épica', 'CONCLUIU_MATRIZES'),
	('Concluiu Sistemas Lineares', 'Finalizou todos os conceitos de Sistemas Lineares', 'Épica', 'CONCLUIU_SISTEMAS_LINEARES'),
	('Concluiu Função Modular', 'Finalizou todos os conceitos de Função Modular', 'Épica', 'CONCLUIU_FUNCAO_MODULAR'),
	('Concluiu Progressão Aritmética', 'Finalizou todos os conceitos de Progressão Aritmética', 'Épica', 'CONCLUIU_PROGRESSAO_ARITMETICA'),
	('Concluiu Progressão Geométrica', 'Finalizou todos os conceitos de Progressão Geométrica', 'Épica', 'CONCLUIU_PROGRESSAO_GEOMETRICA');

 select * from conceito;
 
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
    -- INSERINDO A PERGUNTA BASE
	INSERT INTO perguntas (materia_id, texto)
	VALUES (1, 'Dado o conjunto A = {v1}, o elemento v2 pertence a A?');
    
    select * from user_Conceito;
 
	-- Vamos supor que o ID gerado acima foi 1 (use LAST_INSERT_ID() se quiser automatizar)
	SET @pergunta_id = LAST_INSERT_ID();
    
	-- INSERINDO AS 10 VARIAÇÕES DA QUESTÃO
	INSERT INTO variaveis (pergunta_id, valores) VALUES
	(@pergunta_id, '{"v1": "1,2,3,4,5", "v2": 3}'),
	(@pergunta_id, '{"v1": "2,4,6,8", "v2": 5}'),
	(@pergunta_id, '{"v1": "0,1,2,3", "v2": 0}'),
	(@pergunta_id, '{"v1": "5,10,15", "v2": 20}'),
	(@pergunta_id, '{"v1": "a,b,c,d", "v2": "b"}'),
	(@pergunta_id, '{"v1": "a,e,i,o,u", "v2": "x"}'),
	(@pergunta_id, '{"v1": "10,20,30,40", "v2": 10}'),
	(@pergunta_id, '{"v1": "1 ,3 , 5, 7, 9", "v2": 4}'),
	(@pergunta_id, '{"v1": "brasil,argentina, chile", "v2": "peru"}'),
	(@pergunta_id, '{"v1": "azul,verde,vermelho", "v2": "verde"}');
 
	-- Agora pegamos os IDs das variáveis para vincular as alternativas
	-- (em produção você pode obter via SELECT ou via código backend)
	-- Aqui vou assumir que elas foram inseridas com IDs de 1 a 10, respectivamente.
 
	INSERT INTO alternativas (variaveis_id, pergunta_id, opcoes) VALUES
	(1, @pergunta_id, '{"alt_c":"Sim","alt_2":"Não"}'),
	(2, @pergunta_id, '{"alt_c":"Não","alt_2":"Sim"}'),
	(3, @pergunta_id, '{"alt_c":"Sim","alt_2":"Não"}'),
	(4, @pergunta_id, '{"alt_c":"Não","alt_2":"Sim"}'),
	(5, @pergunta_id, '{"alt_c":"Sim","alt_2":"Não"}'),
	(6, @pergunta_id, '{"alt_c":"Não","alt_2":"Sim"}'),
	(7, @pergunta_id, '{"alt_c":"Sim","alt_2":"Não"}'),
	(8, @pergunta_id, '{"alt_c":"Não","alt_2":"Sim"}'),
	(9, @pergunta_id, '{"alt_c":"Não","alt_2":"Sim"}'),
	(10, @pergunta_id, '{"alt_c":"Sim","alt_2":"Não"}');