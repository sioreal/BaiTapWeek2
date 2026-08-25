# Step 1: Dùng JDK 21 biên dịch trực tiếp file .java từ thư mục src
FROM eclipse-temurin:21-jdk AS builder
WORKDIR /app
COPY . .

# Tạo thư mục chứa .class và dùng javac biên dịch toàn bộ code Java
RUN mkdir -p web/WEB-INF/classes && \
    javac -encoding UTF-8 -d web/WEB-INF/classes $(find src -name "*.java") -cp "$(find / -name '*.jar' | tr '\n' ':')" || true

# Step 2: Đưa sang Tomcat 10 chạy JDK 21
FROM tomcat:10.1-jdk21-openjdk
RUN rm -rf /usr/local/tomcat/webapps/*
COPY --from=builder /app/web /usr/local/tomcat/webapps/ROOT

EXPOSE 8080
CMD ["catalina.sh", "run"]
