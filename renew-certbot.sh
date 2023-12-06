#!/bin/bash

# Comando para renovar o certificado
comando_certificado="echo '1' | certbot certonly --force-renew -d velocidade.redeplanetanet.com.br"

# Token e ID do chat do Telegram
TELEGRAM_BOT_TOKEN="5430493437:AAFLLfCCaSNHrlqJgxRqQwGRNQoVx2yK2TA"
TELEGRAM_CHAT_ID="1058792574"

# Função para enviar mensagem no Telegram
enviar_mensagem_telegram() {
    mensagem="$1"
    curl -s -X POST "https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage" -d "chat_id=$TELEGRAM_CHAT_ID&text=$mensagem"
}

# Executar o comando para renovar o certificado
if $comando_certificado ; then
    mensagem="O certificado SSL do Servidor Speedtest foi renovado com sucesso em: $(date '+%Y-%m-%d %H:%M:%S')"
    enviar_mensagem_telegram "$mensagem"
else
    mensagem="Ocorreu um erro na renovação do certificado SSL do Servidor Speedtest."
    enviar_mensagem_telegram "$mensagem"
fi
    ""