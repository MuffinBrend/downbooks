# Downbooks

Downbooks permite publicar y acceder a tu biblioteca personal.

## Contribuir

Sigue las instrucciones para preparar el entorno de desarrollo requerido
por Downbooks.

### Requisitos

- Ruby 2.2.3, aconsejable instalarlo con
  [rbenv](https://github.com/sstephenson/rbenv) o similar para no interferir
  con la versión de Ruby incluida en el sistema
- MySQL
- Git

### Construye Downbooks desde cero

- Consigue el código del proyecto en
  [https://github.com/MuffinBrend/downbooks](https://github.com/MuffinBrend/downbooks).
- Ve a la carpeta que contiene el código fuente y ejecuta
  `bundle install`. Eso instalará las gemas necesarias para desarrollar y
  ejecutar la aplicación.
- Agrega la información de tu base de datos en variables de entorno. Puedes
  usar [direnv](https://github.com/direnv/direnv) para no guardar las variables
  de entorno en tu perfil. Las variables de entorno que necesitas inicializar
  las encuentras en el fichero `config/database.yml`. Para desarrollar la
  aplicación, necesitas proporcionar datos para los entornos de _test_ y
  _development_.
- Prepara la base de datos ejecutando `bundle exec rake db:setup`. Eso creará
  las bases de datos de test y development, ejecutará las migraciones e
  inicializará
- Inicia el servidor de desarrollo ejecutando `bundle exec rails server`. A
  continuación puedes conectarte con tu navegador, accediendo a
  `http://localhost:3000`.

### Actualiza tu proyecto local

- Actualiza tu copia del código con `git pull`.
- Instala nuevas gemas ejecutando `bundle install`.
- Ejecuta migraciones en tu base de datos ejecutando
  `bundle exec rake db:migrate`.
- Inicia el servidor de desarrollo con `bundle exec rails server`.
