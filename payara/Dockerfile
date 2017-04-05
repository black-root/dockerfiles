FROM payara/server-full

MAINTAINER DeadPul862

ENV PATH $PATH:$PAYARA_PATH/bin

ADD customization/mysql-connector-java-5.1.41-bin.jar  /opt/payara41/glassfish/domains/domain1/lib/ext/

RUN asadmin start-domain && asadmin create-jdbc-connection-pool --user admin --passwordfile /opt/pwdfile \
--datasourceclassname com.mysql.jdbc.jdbc2.optional.MysqlDataSource --restype javax.sql.DataSource --steadypoolsize=2 --maxpoolsize=2 \
--property user=root:password=1234:DataBaseName=gestor_tramites:ServerName=172.18.0.2:port=3306:driverClass=com.mysql.jdbc.Driver academicaTpi2017 && \
asadmin create-jdbc-resource --user admin --passwordfile /opt/pwdfile \
--connectionpoolid academicaTpi2017 --enabled=true academicaRes2017

ADD TramitesAcademicaMavenApp-ear-1.0-SNAPSHOT.ear /opt/payara41/glassfish/domains/domain1/autodeploy 
#COPY  /opt/payara41/glassfish/domains/domain1/autodeploy 

EXPOSE 4848 8080

CMD ["asadmin", "start-domain", "-v"]

