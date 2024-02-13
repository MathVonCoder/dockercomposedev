# gittea docker image

ref: https://docs.gitea.com/installation/install-with-docker

# launch

as ever: `docker compose up -d`

after running, go to http://localhost:3000 you will be prompted with a first page.  
I recommend desactivating inscription and creating a first admin user  
other params will be stored later.

On your first connect:
- create a std user
- create a default organization (optionnal)

# todo

[ ] test ssh on port 2222
[ ] test backup
[ ] separate LFS