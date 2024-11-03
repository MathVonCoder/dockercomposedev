# searxng

Searxng is a private meta search engine that can be self hosted.  
Privacy include: 
- no ads
- no cookie tracking

With a self hosted instance, the main thing public is your IP,  
so  with a an elevated powershell window:
``` 

$PORT=8082
docker run --rm -d -p ${PORT}:8080 `
   -v "${PWD}/searxng:/etc/searxng" `
   -e "BASE_URL=http://localhost:${PORT}/" `
   -e "INSTANCE_NAME=my-instance" `
   searxng/searxng
```

Then open a browser to http://localhost:8082

more info:
- [Docker start](https://docs.searxng.org/admin/installation-docker.html)

