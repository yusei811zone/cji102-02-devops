# 使用官方 Python 鏡像
FROM python:3.9-slim

# 設定工作目錄
WORKDIR /app

# 1. 複製依賴清單並安裝 (這是測試通過的前提)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 2. 複製剩餘程式碼 (包含 app.py 和 test_app.py)
COPY . .

# 3. 強制執行單元測試
# 如果 Flask 沒裝好，這一步會因為 Import Error 而直接噴錯中斷 Build
RUN python -m unittest test_app.py

# 設定埠號與啟動命令
EXPOSE 5000
CMD ["python", "app.py"]