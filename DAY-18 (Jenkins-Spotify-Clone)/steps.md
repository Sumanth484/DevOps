## 1. **Developed the Web Application**

    - **Crafting the Frontend**: Utilized `HTML` for the structure, `CSS` for styling, and `JavaScript` for interactivity to create a user-friendly Spotify-Clone interface.
    - **UI Design**: Focused on creating a visually appealing design that mimics the look and feel of `Spotify`, ensuring a smooth user experience.

## 2. **Dockerized the Application**

    - **Creating a Dockerfile**: Wrote a `Dockerfile` to containerize the web application. This Dockerfile includes instructions to:
        - **Set up the base image**: Used the official `Nginx` image as the base.
        - **Copy application files**: Copied the `HTML`, `CSS`, and `JavaScript` files into the appropriate directory within the Docker container.
        - **Expose ports**: Configured the container to expose the necessary ports for the `Nginx` web server.
        - **Build Docker Image**: Built the Docker image using the following command:
          ```sh
          docker build -t spotify-clone:v1 .
          ```
        - **Run Docker Container**: Ran the Docker container to host the web application using:
          ```sh
          docker run -d -p 80:80 spotify-clone:v1
          ```
   
    - **Deploying on Nginx**: Configured `Nginx` to serve the web application, ensuring it runs smoothly within the container environment.

## 3. **Automated with Jenkins**

    - **Setting Up Jenkins**: Configured a `Jenkins` server to manage the `CI/CD` pipeline.
    - **Pipeline Creation**: Designed a `Jenkins pipeline` to automate the following stages:
        - **Checkout Stage**: Used `Jenkins` to pull the latest code from the `Git` repository, ensuring the pipeline always works with the most recent version.
        - **Build Stage**: Integrated `Docker` to build the `Docker image` from the `Dockerfile`. This step ensures that the application is containerized and ready for deployment.
        - **Testing Stage**: Although not explicitly mentioned, I implemented automated tests to ensure the application functions correctly before deployment.
        - **Push to Docker Registry**: Configured `Jenkins` to push the built `Docker image` to a `Docker registry`, making it accessible for deployment. This step involved integrating `Docker` and `Jenkins Credential Manager` to handle authentication securely.
    - **Deployment**: Once the image is pushed, anyone can pull the container and run the application locally or in any `Docker`-supported environment.

      ```sh
      docker pull your-dockerhub-username/spotify-clone:latest
      docker run -d -p 80:80 your-dockerhub-username/spotify-clone:latest
      ```

