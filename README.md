![Streamlit](https://img.shields.io/badge/Streamlit-FF4B4B?style=for-the-badge&logo=streamlit&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)
![LangChain](https://img.shields.io/badge/LangChain-4CBB17?style=for-the-badge)

# 🤖 Document Helper Chatbot

A **Streamlit**-powered chatbot that lets you interact with arbitrary documents.  
It leverages **Cohere** for embedding generation, **Pinecone** for vector storage & similarity search, and **LangChain** for prompt/chaining logic—delivered in a clean, Docker-ready package.

---

## 📖 Description

- **Interactive UI**: Built with Streamlit's chat components.
- **Embeddings & Retrieval**:  
  - Uses Cohere embeddings (`embed-english-v3.0`)  
  - Stores and queries vectors in Pinecone
- **LLM Orchestration**:  
  - LangChain's history-aware retriever  
  - "Stuff" documents chain via a chat model (Cohere Chat)
- **Easy Deployment**:  
  - Dockerfile included  
  - Environment-variable driven

---

## ✨ Features

- 📑 **Chat** with your documentation or web pages  
- 🔍 **Contextual retrieval**: remembers conversation history  
- 🔐 **Secure**: API keys are loaded from environment  
- 🚀 **One-command Docker deploy** on any host or PaaS (Railway, Heroku, etc.)

---

## 🛠 Tech Stack

| Component                | Technology        |
| ------------------------ | ----------------- |
| Frontend & UI            | Streamlit         |
| Embeddings               | Cohere API        |
| Vector DB & Retrieval    | Pinecone          |
| LLM / Chat Model         | LangChain + Cohere Chat |
| Loader (web scraping)    | FireCrawl         |
| Containerization         | Docker            |
| Configuration            | python-dotenv     |

---

## 📋 Prerequisites

- **Git**  
- **Docker** _(for containerized run)_  
- **Python 3.12** _(for local run)_  
- **Cohere API Key**  
- **Pinecone API Key & Index Name**  
- **(Optional) Pipenv** if you prefer Pipfile management

---

## 🚀 Local Setup

> These steps will get you a local copy up and running in development mode.

1. **Clone the repo**  
   ```bash
   git clone https://github.com/abhayymishraa/chatbot-langchain-streamlit-pinecone.git
   cd chatbot-langchain-streamlit-pinecone
   ```

2. **Create & activate a Python virtualenv**
   ```bash
   python3.12 -m venv .venv
   source .venv/bin/activate
   ```

3. **Install dependencies**

   If using Pipenv:
   ```bash
   pip install pipenv
   pipenv install --dev
   pipenv shell
   ```

   Or with pip + requirements.txt:
   ```bash
   pip install -r requirements.txt
   ```

4. **Configure environment variables**

   In the project root, create a file named `.env`:
   ```dotenv
   # .env
   COHERE_API_KEY=your-cohere-api-key
   PINECONE_API_KEY=your-pinecone-api-key
   PINECONE_INDEX_NAME=your-pinecone-index
   LANGCHAIN_API_KEY=your-langchain-api-key
   FIRECRAWL_API_KEY=your-firecrawl-api-key
   LANGCHAIN_TRACING_V2=true
   LANGCHAIN_PROJECT=Document_helper_chatbot
   ```
   Note: Never commit your `.env` to Git.

5. **Run the app**
   ```bash
   streamlit run main.py \
     --server.port 8501 \
     --server.address 0.0.0.0
   ```
   Open http://localhost:8501 in your browser.

---

## 🐳 Docker Setup

1. **Build the image**
   ```bash
   docker build -t chatbot-langchain-streamlit-pinecone .
   ```

2. **Run the container**
   ```bash
   docker run --env-file .env -p 8501:8501 chatbot-langchain-streamlit-pinecone
   ```
   Visit http://localhost:8501.

---

## 🗂 Project Structure

```
.
├── backend/
│   └── core.py           # LLM + embedding + vector retrieval logic
├── main.py               # Streamlit application entrypoint
├── Pipfile / Pipfile.lock
├── requirements.txt      # For pip-based installs
├── Dockerfile            # Container specification
├── .env.example          # Template for your .env (no secrets)
└── README.md
```

---



Created & maintained by Abhay Mishra.
Feel free to open issues, PRs, or reach out on GitHub!
