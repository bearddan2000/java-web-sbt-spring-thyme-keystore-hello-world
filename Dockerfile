FROM hseeberger/scala-sbt:11.0.2-oraclelinux7_1.3.5_2.12.10

WORKDIR /tmp

COPY bin/ .

RUN mkdir src/main/resources/keystore

# RUN cd src/main/resources/keystore

RUN $JAVA_HOME/bin/keytool -genkeypair \
-dname "cn=myname, ou=mygroup, o=mycompany, c=mycountry" \
-alias baeldung -keyalg RSA -keysize 2048 \
-storetype PKCS12 \
-keystore /tmp/src/main/resources/keystore/baeldung.p12 \
-storepass password -validity 3650

# RUN cd /tmp

ENTRYPOINT ["sbt"]

CMD ["clean", "compile", "package", "run"]
