# 베이스 이미지로 tomcat 사용
FROM tomcat:9.0

# 컨테이너의 webapps 디렉토리에 WAR 파일 복사
COPY target/*.war /usr/local/tomcat/webapps/

# 컨테이너에서 Tomcat 서버를 실행
CMD ["catalina.sh", "run"]