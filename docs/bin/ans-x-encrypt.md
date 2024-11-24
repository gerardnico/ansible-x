% ans-x-encrypt(1) Version Latest | Ansible-vault encrypt_string
# NAME

`ans-x-encrypt` is a `ansible-vault encrypt_string` shortcut


# SYNOPSIS

```bash${SYNOPSIS}
```

# EXAMPLE: ENCRYPT A STRING


```bash
# from Iterm / Cygwin / Linux / Windows WSL 
ans-x-encrypt 'the_password_to_encrypt'
# from DOS
ans-x-encrypt the_password_to_encrypt
```


It's the same as executing fom [a bash shell](ans-x-bash.md) inside the [Docker Image](../ans-x-docker.md)
```bash
ansible-vault encrypt_string 'the_secret_to_encrypt'
echo 'the_secret_to_encrypt' | ansible-vault encrypt_string 
```


# EXAMPLE: ENCRYPT A FILE

```bash
# windows
type cert.pem | ans-x-encrypt
# bash
ans-x-encrypt < cert.pem
```