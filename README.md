# Movies-Series-App

### Descripción 
- Sistema que permite visualizar-subir archivos para reproducción de video.

### Características
- Filtro por nombre, categoría, letra.
- Subida de archivos mediante background (sidekiq)
- Administración mediante usuario administrador 
- Comentarios a través de Disqus

### Instalación

- - Para utilizar los comentarios se debe crear el servicio en https://disqus.com/admin/create/ luego configurar el servicio de [disqus (url)(https://github.com/JamesAndresCM/movies-series-app/blob/master/app/views/videos/show.html.erb)

```bash
bundle install
rails db:create
rails db:migrate
redis-server
bundle exec sidekiq -C config/sidekiq.yml
rails server
```

Para agregar contenido utilizar la cuenta de administrador: 

User : admin@domain.com
Pass : admin123

url : http://localhost:3000/login

***
### Screenshots

<img src="https://i.imgur.com/lTLHdgY.jpg" />
<br>
<img src="https://i.imgur.com/Izvr5xV.png" />
<br>
<img src="https://i.imgur.com/HwO1NeY.png" />