import sqlite3
import pandas as pd

DATA_DIR = "../pandas_bill/data"

def main():
    conn=sqlite3.connect("bill.db")
    df1=pd.read_csv("data/cleaned.csv")
    df1.to_sql("expenses", conn, if_exists='replace', index=False)
    df2 = pd.read_csv("data/budget.csv")
    df2.to_sql("budget", conn, if_exists='replace', index=False)
    conn.close()
    print("导入完成")

if __name__ == "__main__":
    main()