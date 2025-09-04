# <img width="30" height="30" src="https://img.icons8.com/?size=100&id=cdYUlRaag9G9&format=png&color=000000" alt="docker"> **Docker Cheat Sheet**

¡Bienvenido a **Docker Cheat Sheet**! Este repositorio es tu guía rápida y práctica para el mundo de Docker. Si eres un desarrollador, SysAdmin o simplemente alguien interesado en la contenerización que busca comprender los conceptos esenciales o necesita un recordatorio rápido, ¡aquí encontrarás una referencia concisa y útil!

Aquí hallarás una colección organizada de los comandos, conceptos y flujos de trabajo clave de Docker, cada uno con una explicación clara y ejemplos prácticos para que puedas aplicarlos directamente en tus proyectos.

## 📚 Tabla de Contenidos

- [ **Docker Cheat Sheet**](#-docker-cheat-sheet)
  - [📚 Tabla de Contenidos](#-tabla-de-contenidos)
  - [🌎 Acerca de](#-acerca-de)
  - [🚀 ¿Qué encontrarás aquí?](#-qué-encontrarás-aquí)
  - [📂 Estructura del Repositorio](#-estructura-del-repositorio)
  - [📝 ¿Cómo Usarlo?](#-cómo-usarlo)
  - [🤝 Contribuciones](#-contribuciones)
  - [🫂 Referencias y Agradecimientos](#-referencias-y-agradecimientos)
  - [🎖️ Licencia](#️-licencia)
  - [📩 Contáctame](#-contáctame)

## 🌎 Acerca de

**Docker** ha revolucionado la forma en que los desarrolladores construyen, empaquetan y despliegan aplicaciones. Permite empaquetar una aplicación y todas sus dependencias en un "contenedor" aislado que puede ejecutarse de manera consistente en cualquier entorno. Esto elimina los problemas de "funciona en mi máquina" y simplifica enormemente los procesos de desarrollo, pruebas y despliegue.

Este **Docker Cheat Sheet** tiene como objetivo simplificar el aprendizaje y la consulta rápida de los conceptos fundamentales de Docker. Está diseñado para ser un recurso accesible que te permita trabajar con contenedores de manera más eficiente y con mayor confianza.

## 🚀 ¿Qué encontrarás aquí?

- `02_images/` → Subdirectorios que contienen cada uno una familia de comandos y conceptos de Docker.
  - Cada subdirectorio contiene:
    - Un archivo `.md` (ej: `images.md`, `docker_compose.md`) que ofrece una explicación general de los conceptos y su uso dentro de esa categoría.
    - Archivos de ejemplo (ej: `02_volumes.sh`, `01_first_container.sh`) con código listo para usar para cada comando o configuración específica.

## 📂 Estructura del Repositorio

El repositorio está organizado por temas principales de Docker para facilitar la navegación y el aprendizaje:

```bash
docker-cheat-sheet/
├── .gitignore
├── LICENSE
├── README.md
├── 01_introduction/
│   ├── introduction.md
│   ├── 01_first_container.sh
│   └── 02_basic_image_management.sh
├── 02_images/
│   ├── images.md
│   ├── 01_python-flask-app.sh
│   ├── 02_nginx-static.sh
│   └── ...
├── 03_containers/
│   ├── containers.md
│   ├── 01_life_cycle.sh
│   ├── 02_volumes.sh
│   └── 03_networks.sh
├── 04_docker_compose/
│   ├── docker_compose.md
│   ├── 01_flask-postgres-redis.sh
│   ├── 02_nginx-php.sh
│   └── ...
├── 05_orchestration_and_scalability/
│   ├── orchestration_and_scalability.md
│   ├── .sh
│   ├── .sh
│   └── ...
└── ...
```

## 📝 ¿Cómo Usarlo?

Para aprovechar al máximo este `docker-cheat-sheet`, sigue estos pasos:

1. **Clona el repositorio:** Abre tu terminal o Git Bash y clona este repositorio en tu máquina local:

   ```bash
   git clone https://github.com/ayorick23/docker-cheat-sheet.git
   ```

2. **Navega al directorio:**

   ```bash
   cd docker-cheat-sheet
   ```

3. **Explora los ejemplos:** Dirígete a través de los directorios para explorar las diferentes categorías de comandos. Por ejemplo, para comprender la gestión de imágenes:

   ```bash
   cd 02_images/images.md
   ```

4. **Ejecuta y haz pruebas:** Abre los archivos de ejemplo (generalmente con extensión .sh) dentro de cada categoría para ver el comando en acción.

   ```bash
   cat 01_life_cycle.sh
   ```

## 🤝 Contribuciones

¡Las contribuciones son increíblemente valiosas! Si deseas mejorar este Docker Cheat Sheet, añadir nuevos comandos, mejorar explicaciones o proporcionar más ejemplos, por favor:

1. Haz un fork de este repositorio.
2. Crea una nueva rama (`git checkout -b feature/nuevo-comando-red`).
3. Realiza tus cambios y haz commit (`git commit -m "Añadir comando para inspeccionar red"`).
4. Haz un push de tus cambios a tu fork (`git push origin feature/nuevo-comando-red`).
5. Abre un Pull Request en este repositorio.

## 🫂 Referencias y Agradecimientos

Este repositorio ha sido creado recopilando y sintetizando información de diversas fuentes fiables sobre Docker. Quiero extender mi más sincero agradecimiento a los siguientes recursos, que han sido fundamentales para la construcción de este contenido:

- **Documentación oficial de Docker:** La fuente más completa y precisa para todas las características y funcionalidades de Docker.
  - [Docker documentation](https://docs.docker.com/)
- **Roadmap DevOps:** Una guía completa para convertirse en un ingeniero de DevOps, que incluye Docker.
  - [Roadmap DevOps](https://roadmap.sh/java)
- **Ultimate Docker: Guía de cero hasta despliegues** por **Nicolas Schurmann:** Un recurso invaluable que proporcionó una base sólida y conocimientos teóricos y prácticos sobre los fundamentos de Docker, la plataforma Docker Hub y flujos de trabajo avanzados hasta el despliegue de aplicaciones en servidores.
  - [Curso de Udemy](https://www.udemy.com/course/ultimate-docker-guia-de-cero-hasta-despliegues/?kw=ultimate+docker&src=sac&couponCode=KEEPLEARNING)

## 🎖️ Licencia

Este proyecto está bajo la Licencia MIT. Consulta el archivo `LICENSE` para más detalles.

## 📩 Contáctame

Si tienes alguna pregunta o sugerencia, no dudes en contactarme:

[![GitHub](https://img.shields.io/badge/-GitHub-181717?style=flat&logo=github&logoColor=white)](https://github.com/ayorick23)
[![Gmail](https://img.shields.io/badge/-Email-D14836?style=flat&logo=gmail&logoColor=white)](mailto:mayorickhenry@gmail.com)
[![LinkedIn](https://img.shields.io/badge/-LinkedIn-blue?style=flat&logo=linkedin&logoColor=white)](https://linkedin.com/in/dereckmendez/)
[![Kaggle](https://img.shields.io/badge/-Kaggle-181717?style=flat&logo=kaggle&logoColor=white)](https://www.kaggle.com/dereckmendez)
