# Como rodar aplicação

> 🚨 **Atenção, ler atentamente antes de codar ou iniciar a aplicação!!!!!** 🚨 

## Requisitos
- Docker;
- Git;
- Git Bash ou Qualquer terminal baseado em Bash.
- WSL (Windows/Powershell)
  
## Desenvolvimento
Criar na base do seu projeto um arquivo .env com o seguinte conteúdo:
```
ROOT_PASSWORD="{senha_do_banco_desejada}"
```

### Bash (Git Bash)
Executar o arquivo "build.sh"
```
./build.sh
```

Executar o arquivo "start.sh"
```
./start.sh
```

Executar o arquivo "exec.sh"
```
./exec.sh
```

### Powershell
Executar o arquivo "build.sh"
```
wsl bash ./build.sh
```

Executar o arquivo "start.sh"
```
wsl bash ./start.sh
```

Executar o arquivo "exec.sh"
```
wsl bash ./exec.sh
```
