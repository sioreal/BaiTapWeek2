FROM tomcat:10.1-jdk17

# 1. Xóa các ứng dụng mặc định của Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# 2. Copy toàn bộ giao diện (HTML, JSP, CSS) vào ROOT
COPY web/ /usr/local/tomcat/webapps/ROOT/

# 3. Copy các file .class đã biên dịch vào WEB-INF/classes
COPY out/production/* /usr/local/tomcat/webapps/ROOT/WEB-INF/classes/

EXPOSE 8080
CMD ["catalina.sh", "run"]
