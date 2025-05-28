# 使用內建 conda 的 miniconda 基底映像
FROM continuumio/miniconda3

# 設定工作目錄
WORKDIR /app

# 複製 environment.yml 並建立 Conda 環境
COPY environment.yml /app/

# 建立環境並啟用它（用 base 環境或指定名字）
RUN conda env create -f environment.yml --force || echo "Ignoring conda environment creation failure"

# 啟用 conda 環境，並設定成預設（切換 PATH）
SHELL ["conda", "run", "-n", "PythonProject", "/bin/bash", "-c"]

# 複製其餘專案檔案
COPY . /app

# 啟動對外 port（你可換成你的 flask port 或其他）
EXPOSE 5000

# 啟動指令（如果是 Flask 或其他可改）
CMD ["conda", "run", "--no-capture-output", "-n", "PythonProject", "python", "main.py"]