Projeto de Engenharia de Dados.

Este projeto tem como objetivo conectar ao banco de dados, realizar a leitura de tabelas específicas usando PySpark, e exportar os dados para um arquivo CSV em um local definido pelo usuário.

Dentro do arquivo deve ser definido o caminho do JDBC e também o caminho onde o arquivo deve ser gerado.

## Pré-requisitos
1. Java 11
2. Spark 3.5.3
3. PostgreSQL local
4. Driver JDBC: `postgresql-42.2.24.jar`

## Como usar
1. Execute `cria_banco.sql` no seu Postgres local
2. Ajuste usuário/senha no `movimento_flat.py`
3. Ajuste o caminho da geração do arquivo