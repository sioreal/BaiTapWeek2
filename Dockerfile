# Step 1: Biên dịch Java và đóng gói WAR
FROM eclipse-temurin:17-jdk AS builder
WORKDIR /app
COPY . .

# Biên dịch code Java và đóng gói file ROOT.war
RUN mkdir -p web/WEB-INF/classes && \
    javac -encoding UTF-8 -d web/WEB-INF/classes $(find src -name "*.java") -cp "$(find / -name '*.jar' | tr '\n' ':')" || true && \
    mkdir -p target && \
    jar -cvf target/ROOT.war -C web .

# Step 2: Đưa vào Tomcat
FROM tomcat:10.1-jdk17
RUN rm -rf /usr/local/tomcat/webapps/*
COPY --from=builder /app/target/ROOT.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
