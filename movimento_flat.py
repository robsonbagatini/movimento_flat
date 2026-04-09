from pyspark.sql import SparkSession
from pyspark.sql import functions as F

# Configure o caminho do seu jar JDBC do PostgreSQL
path_to_jdbc_jar = "caminho\postgresql-42.2.24.jar"  # ajuste aqui

# Configure seu banco de dados
jdbc_url = "jdbc:postgresql://db.gnufbrjwmcsxmlkhjfpp.supabase.co:5432/postgres" # ajuste aqui
db_properties = { 
    "user": "postgres",         
    "password": "password$",       
    "driver": "org.postgresql.Driver", 
    "fetchsize": "10000"  
}


# Caminho para salvar o arquivo (ajuste aqui)
caminho_saida = "/caminho/para/diretorio/movimento_flat"

# Cria a sessão Spark
spark = SparkSession.builder \
    .appName("Movimento Flat") \
    .config("spark.jars", path_to_jdbc_jar) \
    .getOrCreate()

movimento_df = spark.read.jdbc(jdbc_url, "movimento", properties=db_properties)
associado_df = spark.read.jdbc(jdbc_url, "associado", properties=db_properties)
conta_df = spark.read.jdbc(jdbc_url, "conta", properties=db_properties)
cartao_df = spark.read.jdbc(jdbc_url, "cartao", properties=db_properties)

# Renomear as colunas
associado_sel = associado_df.select(
    F.col("id").alias("id_associado"),
    F.col("nome").alias("nome_associado"),
    F.col("sobrenome").alias("sobrenome_associado"),
    F.col("idade").alias("idade_associado"),
    F.col("email").alias("email_associado")
)

conta_sel = conta_df.select(
    F.col("id").alias("id_conta"),
    F.col("tipo_conta"),
    F.col("data_criacao").alias("data_criacao_conta"),
    F.col("id_associado")
)

cartao_sel = cartao_df.select(
    F.col("id").alias("id_cartao"),
    F.col("num_cartao").alias("numero_cartao"),
    F.col("nom_impresso").alias("nome_impresso_cartao"),
    F.col("id_conta")
)

movimento_sel = movimento_df.select(
    F.col("vlr_transacao").alias("vlr_transacao_movimento"),
    F.col("des_transacao").alias("des_transacao_movimento"),
    F.col("data_movimento"),
    F.col("id_cartao")
)

# Joins para consolidar os dados
conta_com_associado = conta_sel.join(associado_sel, "id_associado", "left")
cartao_completo = cartao_sel.join(conta_com_associado, "id_conta", "left")
final_df = movimento_sel.join(cartao_completo, "id_cartao", "left")

# Colunas Finais
colunas_finais = [
    "nome_associado",
    "sobrenome_associado",
    "idade_associado",
    "email_associado",
    "tipo_conta",
    "data_criacao_conta",
    "numero_cartao",
    "nome_impresso_cartao",
    "vlr_transacao_movimento",
    "des_transacao_movimento",
    "data_movimento"
]

df_export = final_df.select(*colunas_finais)

# Exporta arquivo
df_export.write \
   .mode("overwrite") \
   .option("header", "true") \
   .option("delimiter", ";") \
   .option("dateFormat", "yyyy-MM-dd HH:mm:ss") \
   .csv(caminho_saida)

print(f"CSV gerado em: {caminho_saida}")

# Finaliza a sessão Spark
spark.stop()