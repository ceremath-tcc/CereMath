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
        id INT PRIMARY KEY auto_increment,  -- ID da conquista
        nome VARCHAR(255),           -- Nome da Conquista
        Descricao NVARCHAR(500)       -- A descrição da Conquista
    );
    
    Create table user_Conquista(
        id_user int not null primary key,
        id_conquista int not null,	
        conquistas bit not null,
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
        opcoes JSON NOT NULL, -- Ex: '{"op_c": 0, "op_2": 1, "op_3": 2, "op_4": 3}' - op_c é a correta!
        FOREIGN KEY (pergunta_id) REFERENCES perguntas(id) ON DELETE CASCADE
    );
    
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
    
    -- Perguntas -- Funcionando
    insert into perguntas(materia_id, texto) values
    (1, "Sample01. v1, v2.");
    
    select * from perguntas;
    
    
    -- Variaveis -- Funcionando
    insert into variaveis(pergunta_id, valores) values
    (4, '{"v1": 1, "v2": 1}');
    
    select pergunta_id, JSON_EXTRACT(valores, '$.v1') as valor1, JSON_EXTRACT(valores, '$.v2') as valor2 from variaveis where pergunta_id = 4 and id = 1;
    
    
    -- Alternaticas -- Funcionando
    insert into alternativas(pergunta_id, opcoes) values
    (4, '{"op_c": 0, "op_2": 1, "op_3": 2, "op_4": 3}');
    
    select pergunta_id, JSON_EXTRACT(opcoes, '$.op_c') as opcao_correta, JSON_EXTRACT(opcoes, '$.op_2') as opcao_1, JSON_EXTRACT(opcoes, '$.op_3') as opcao_2, JSON_EXTRACT(opcoes, '$.op_4') as opcao_3 from alternativas where pergunta_id = 4;
    
    SELECT * FROM user_Conceito where id_user=1;