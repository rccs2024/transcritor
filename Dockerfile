FROM python:3.10-slim

# Instala ffmpeg e dependências
RUN apt-get update && \
    apt-get install -y ffmpeg && \
    pip install --no-cache-dir streamlit yt-dlp python-docx openai-whisper

# Copia todos os arquivos do projeto
COPY . /app
WORKDIR /app

# Porta padrão para Streamlit
EXPOSE 8501

# Comando para iniciar a aplicação
CMD ["streamlit", "run", "app.py", "--server.port=8501", "--server.enableCORS=false"]

