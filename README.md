# README

## Execução

1. Subir o ambiente.
```bash
make up
```
3. Entrar no control
```bash
make control
```

4. Copiar chave para o node1 e node2 com a senha Password123
```bash
ssh-copy-id root@node1
ssh-copy-id root@node2
```

5. Executar o ping para ver se está conectado
```bash
cd /root/ansible
ansible -i hosts all -m ping
```