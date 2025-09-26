import sys
import io
import cohere
import json

# Força saída UTF-8 (Windows-friendly)
sys.stdin = io.TextIOWrapper(sys.stdin.buffer, encoding='utf-8')
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding='utf-8')

def ia(texto):
    #Define a api do Cohere
    co = cohere.ClientV2(api_key="xtKw3npMFnDGUEl0bE12i92uLaCSoQcVyT7V8Y8S")
    
    #Transforma o json em array
    user_text = json.loads(texto)

    #Envia o historico para a IA e pede a resposta
    response = co.chat(
        model="command-a-03-2025",
        messages=user_text
    )

    #Transforma a resposta em UTF-8 (compativel com acentos e etc)
    retorno = response.message.content[0].text
    retorno_utf8 = retorno.encode('utf-8', errors='replace').decode('utf-8')
    
    return retorno_utf8

#Roda o codigo com o valor enviado no php
if __name__ == "__main__":
    historico = sys.stdin.read()  # lê o JSON do PHP
    print(ia(historico))