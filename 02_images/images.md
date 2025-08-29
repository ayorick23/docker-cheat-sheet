# Images

## Construyendo Imágenes con Dockerfiles

Una **imagen de Docker** es una plantilla de solo lectura que contiene las instrucciones necesarias para crear un contenedor. A diferencia de las imágenes que descargas de Docker Hub, tú puedes crear las tuyas propias, personalizadas para tus aplicaciones. Para ello, utilizamos un Dockerfile, que es un archivo de texto simple que contiene una serie de comandos para ensamblar la imagen.

El **Dockerfile** actúa como un script para la construcción de la imagen. Docker lee las instrucciones línea por línea, ejecutando cada una de ellas para crear una nueva capa sobre la anterior. Esta estructura de capas es lo que hace que las imágenes de Docker sean tan ligeras y eficientes.

## Instrucciones Clave de un Dockerfile

Un Dockerfile típico incluye varias instrucciones esenciales. A continuación, se detallan las más comunes:

### `FROM`

Define la imagen base sobre la que se construirá la tuya. Una imagen base es el punto de partida, como un sistema operativo (`ubuntu`, `alpine`) o un entorno de ejecución (`node:14`, `python:3.9`). Es la primera instrucción en cualquier Dockerfile.

```docker
FROM python:3.9-slim
```

### `WORKDIR`

Establece el directorio de trabajo dentro del contenedor. Las instrucciones `RUN`, `CMD`, `COPY`, y `ADD` que le sigan se ejecutarán en este directorio. Es una buena práctica usarla para mantener el Dockerfile limpio y organizado.

```docker
WORKDIR /app
```

### `COPY`

Copia archivos o directorios desde el sistema de archivos del host al sistema de archivos del contenedor. Es la forma más común y segura de añadir código a la imagen.

```docker
COPY . . # Copia todo el contenido del directorio actual del host al directorio de trabajo en el contenedor
```

### `RUN`

Ejecuta un comando en una nueva capa sobre la imagen actual. Se usa para instalar paquetes, configurar el entorno o cualquier otro comando de línea que sea necesario para la aplicación.

```docker
RUN apt-get update && apt-get install -y nginx
```

### `EXPOSE`

Informa a Docker de que el contenedor escucha en los puertos de red especificados en tiempo de ejecución. No publica el puerto, solo documenta qué puertos se espera que estén disponibles. El mapeo de puertos se realiza al ejecutar el contenedor con el comando `docker run -p`.

```docker
EXPOSE 80
```

### `CMD`

Proporciona un comando predeterminado para la ejecución del contenedor. Solo puede haber una instrucción `CMD` en un Dockerfile. Si se especifica un comando al ejecutar el contenedor (`docker run <imagen> <comando>`), este anulará el `CMD` del Dockerfile.

```docker
CMD ["nginx", "-g", "daemon off;"]
```

### `ENTRYPOINT`

Similar a `CMD`, pero define el comando principal que se ejecutará al iniciar el contenedor. Los argumentos pasados al `docker run` se adjuntan al `ENTRYPOINT`. Es ideal para crear contenedores ejecutables.

```docker
ENTRYPOINT ["/usr/bin/npm"]
```

## Flujo de Construcción

El comando para construir una imagen es `docker build`.

```docker
docker build -t <nombre_imagen> .
```

- `-t`: Asigna un nombre (etiqueta o "tag") a la imagen.
- `.`: Indica el directorio que contiene el Dockerfile y el contexto de construcción.

## Gestión de Imágenes

Una vez que has creado o descargado imágenes, es fundamental saber cómo gestionarlas para mantener tu entorno de trabajo organizado.

### Listado de Imágenes

Para ver todas las imágenes que tienes en tu máquina local, utiliza el comando `docker images`.

```docker
docker images
```

El resultado te mostrará una lista de imágenes con información como el **REPOSITORY** (el nombre), el **TAG** (la etiqueta o versión, por defecto `latest`), el **IMAGE ID** (identificador único), la fecha de creación y el tamaño.

### Etiquetado de Imágenes

El etiquetado (`tagging`) es una práctica esencial para la gestión de versiones. Te permite asignar un nombre más descriptivo y versiones a tus imágenes.

```docker
docker tag <id_imagen> <nuevo_nombre>:<nueva_etiqueta>
```

- **Ejemplo:** Si tu imagen tiene el ID `a1b2c3d4e5f6`, puedes etiquetarla así:

  ```docker
  docker tag a1b2c3d4e5f6 mi-aplicacion:v1.0
  ```

### Eliminación de Imágenes

Para liberar espacio, puedes eliminar imágenes que ya no necesitas.

```docker
docker rmi <id_imagen_o_nombre>:<etiqueta>
```

- **Ejemplo:**

  ```docker
  docker rmi mi-aplicacion:v1.0
  ```

Si una imagen está siendo utilizada por un contenedor, no podrás eliminarla. Primero deberás detener y eliminar el contenedor.

### Publicando Imágenes en Docker Hub

Para compartir tus imágenes con otros o usarlas en otros entornos, puedes subirlas a un registro como Docker Hub.

1. **Inicia sesión:**

   ```docker
   docker login
   ```

2. **Etiqueta la imagen para tu repositorio:** El formato es `nombre_de_usuario/nombre_del_repositorio:etiqueta`.

   ```docker
   docker tag mi-aplicacion:v1.0 tu_usuario/mi-aplicacion:v1.0
   ```

3. **Sube la imagen:**

   ```docker
   docker push tu_usuario/mi-aplicacion:v1.0
   ```

## Mejores Prácticas para un Dockerfile Eficiente

Crear Dockerfiles eficientes es clave para tener imágenes ligeras, rápidas y seguras. Aquí tienes algunas pautas fundamentales:

1. **Utiliza una imagen base ligera:** Evita imágenes base muy grandes como `ubuntu:latest`. En su lugar, opta por versiones `slim` o `alpine`. Una imagen base más pequeña resulta en una imagen final más ligera y rápida de construir y transferir.

2. **Combina instrucciones `RUN`:** Cada instrucción `RUN` en un Dockerfile crea una nueva capa de imagen. Combinar varios comandos (`apt-get update && apt-get install`) en una sola instrucción reduce el número de capas y el tamaño de la imagen final. Utiliza el operador `&&` y el `\` para la legibilidad.

   - **Mala práctica:**

   ```docker
   RUN apt-get update
   RUN apt-get install -y nginx
   ```

   - **Buena práctica:**

   ```docker
   RUN apt-get update && apt-get install -y nginx
   ```

3. **Ordena tus instrucciones por frecuencia de cambio:** Coloca las instrucciones que cambian con menos frecuencia (como la instalación de dependencias) al principio del Dockerfile. De esta forma, cuando modificas tu código (`COPY`), Docker puede usar la caché de las capas anteriores y no necesita reconstruir toda la imagen.
4. **Minimiza el contexto de construcción:** El comando `docker build` envía todo el contenido del directorio (`.` en el comando) al demonio de Docker. Usa un archivo `.dockerignore` para excluir archivos y directorios innecesarios (como `.git`, `node_modules`, `venv`) que no deben ser copiados a la imagen. Esto acelera el proceso de construcción.
5. **Especifica versiones exactas de dependencias:** Fija las versiones de los paquetes que instalas (`python:3.9` en lugar de `python:latest`). Esto asegura que la imagen se construya de forma reproducible y evita problemas con actualizaciones futuras.
6. **Utiliza `COPY` en lugar de `ADD`:** La instrucción `ADD` puede descomprimir archivos `tar` y obtener archivos de URLs, lo que la hace menos transparente y segura. La instrucción `COPY` es más simple y predecible, siendo la opción preferida en la mayoría de los casos.
