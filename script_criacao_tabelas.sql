-- ===========================
-- ESTRUTURA
-- ===========================
CREATE TABLE unidades (
    id_unidade INT PRIMARY KEY,
    nome_unidade VARCHAR(50),
    cidade VARCHAR(50)
);

CREATE TABLE medicos (
    id_medico INT PRIMARY KEY,
    nome_medico VARCHAR(50),
    especialidade VARCHAR(50)
);

CREATE TABLE atendimentos (
    id_atendimento INT PRIMARY KEY,
    id_unidade INT,
    id_medico INT,
    data_atendimento DATE,
    tipo_atendimento VARCHAR(30), -- 'Consulta', 'Exame', 'Emergencia'
    valor NUMERIC(10,2),
    CONSTRAINT fk_unidade FOREIGN KEY(id_unidade) REFERENCES unidades(id_unidade),
    CONSTRAINT fk_medico FOREIGN KEY(id_medico) REFERENCES medicos(id_medico)
);

