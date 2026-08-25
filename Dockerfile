# Sử dụng Tomcat 10.1 chạy Java 17/21
FROM tomcat:10.1-jdk17

# 1. Xóa toàn bộ các ứng dụng mặc định của Tomcat để tránh xung đột
RUN rm -rf /usr/local/tomcat/webapps/*

# 2. Copy file .war được tạo ra từ IntelliJ và ĐỔI TÊN thành ROOT.war
# (Thay 'Buoi1_war_exploded.war' hoặc 'Buoi1.war' đúng với tên file .war trong folder out/ của bạn)
COPY out/artifacts/*.war /usr/local/tomcat/webapps/ROOT.war

# 3. Mở cổng 8080
EXPOSE 8080

# 4. Khởi chạy Tomcat
CMD ["catalina.sh", "run"]
