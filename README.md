# MINA CUSTOM ACTION FOR GITHUB

This action permits to use mina to deploy your application on your server.
It's is based on ruby:2.5.0 docker image. If you want to run with another version of ruby, you can change the Dockerfile and use your forked version.

## Inputs

## `ssh_private_key`

**Required** This is the private ssh key that can access server. Save it to github secrets!

## `command`

**Required** Mina command to run. 'deploy' for 'mina deploy'.

## `environment`

**Required** This is environment to deploy. If not provided it runs 'mina deploy' command.


## Example usage

- name: Mina deploy
  id: mina-deploy
  uses: marcosanson/mina-action@v1
  with:
    command: 'deploy'
    ssh_private_key: ${{ secrets.SSHPRIVATEKEY }}
