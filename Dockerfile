# 빌드 스테이지: Maven을 사용하여 빌드 수행
FROM maven:3.8.1-jdk-11 AS build

# 작업 디렉토리 설정
WORKDIR /usr/src/app

# 소스 코드와 pom.xml 파일을 컨테이너로 복사
COPY src ./src
COPY pom.xml .

# Maven 빌드를 실행하여 WAR 파일 생성
RUN mvn clean package

# 배포 스테이지: Tomcat 이미지를 사용하여 WAR 파일 배포
FROM tomcat:8.0

# 빌드된 WAR 파일을 Tomcat의 webapps 디렉토리에 복사
COPY --from=build /usr/src/app/target/*.war /usr/local/tomcat/webapps/

# Tomcat 서버 실행
CMD ["catalina.sh", "run"]