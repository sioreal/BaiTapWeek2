
FROM tomcat:10.1-jdk21-openjdk

# 1. Xóa ứng dụng mặc định
RUN rm -rf /usr/local/tomcat/webapps/*

# 2. Copy giao diện vào ROOT
COPY web/ /usr/local/tomcat/webapps/ROOT/

# 3. Copy file class đã biên dịch vào đúng vị trí
COPY out/production/Buoi1/murach/* /usr/local/tomcat/webapps/ROOT/WEB-INF/classes/

EXPOSE 8080
CMD ["catalina.sh", "run"]
