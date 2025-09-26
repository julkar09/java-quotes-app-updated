#1 Base image (OS) :for java openjdk
 
FROM openjdk:17-jdk-alpine
 
#2 working directory(which folder application will run) for app
 
WORKDIR /app
 
#3 code the code from your HOST to your container(Working direstory)
 
COPY src/Main.java /app/Main.java
COPY quotes.txt quotes.txt
 
#4 Run the command to install Library or to compil code(Here javac is used to complie java app)
 
RUN javac Main.java
 
#5 expose the port
 
EXPOSE 8000
 
#6serve the app to keep it running
 
CMD ["java","Main"]
