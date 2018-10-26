# Movies-Series-App

### Descripción 
- Sistema que permite visualizar-subir archivos para reproducción de video.

### Características
- Filtro por nombre, categoría, letra.
- Subida de archivos mediante background (sidekiq)
- Administración mediante usuario administrador 
- Comentarios a través de Disqus

### Instalación

- Para utilizar los comentarios se debe crear el servicio en https://disqus.com/admin/create/ luego configurarlo [disqus (url)](https://github.com/JamesAndresCM/movies-series-app/blob/master/app/views/videos/show.html.erb#L19)

```bash
bundle install
rails db:create
rails db:migrate
rails db:seed
redis-server
bundle exec sidekiq -C config/sidekiq.yml
rails server
```

Para agregar contenido utilizar la cuenta de administrador: 

- User : admin@domain.com
- Pass : admin123

- url : http://localhost:3000/login

- Sidekiq se utilizará en el proceso de subida de un video (convertirá formato a mp4), solo si el formato de video es diferente a mp4

- Algunos formatos pueden no funcionar correctamente (codec video o audio), se recomienda utilizar mp4

***
### Screenshots

<img src="https://i.imgur.com/lTLHdgY.jpg" />
<br>
<img src="https://i.imgur.com/Izvr5xV.png" />
<br>
<img src="https://i.imgur.com/HwO1NeY.png" />

## API Rest

### EndPoints

- Devuelve todas las series ```localhost:3000/api/v1/series/index```
- Paginación ```localhost:3000/api/v1/series/index?page=1```
- Búsqueda de serie por nombre ```localhost:3000/api/v1/series/search?q=param```

- Respuesta :

<img src="https://i.imgur.com/s64PyqS.png" />