# Usa a imagem oficial do Python 3.13.3 como base
FROM python:3.13.3

# Instala o Poetry, ferramenta para gerenciamento de dependências e ambiente virtual
RUN pip install poetry

# Copia todo o conteúdo do diretório atual para o diretório /src no container
COPY . /src

# Define o diretório de trabalho do container como /src
WORKDIR /src

# Instala as dependências do projeto definidas no pyproject.toml usando o Poetry
RUN poetry install

# Expõe a porta 8501, que será usada pelo Streamlit
EXPOSE 8501

# Define o comando padrão ao iniciar o container:
# Executa o app Streamlit localizado em app/app.py, acessível externamente na porta 8501
ENTRYPOINT ["poetry", "run", "streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]

