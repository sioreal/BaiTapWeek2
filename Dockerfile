# Step 1: Build file WAR bằng Maven
FROM maven:3.9-eclipse-temurin-17 AS builder
WORKDIR /app
COPY . .
# Tạo thư mục webapps tạm và nén nguồn web thành ROOT.war
RUN mkdir -p target && jar -cvf target/ROOT.war -C web .

# Step 2: Đưa vào Tomcat
FROM tomcat:10.1-jdk17
RUN rm -rf /usr/local/tomcat/webapps/*
COPY --from=builder /app/target/ROOT.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
