#!/bin/bash
CFG=certs
rm -rf ${CFG}
mkdir -p ${CFG}/ca
mkdir -p ${CFG}/client
mkdir -p ${CFG}/server
. config.env
bash ./scripts/gen-kafka-ssl.sh ca ca-cert KafkaServer
echo "done 1"
bash ./scripts/gen-kafka-ssl.sh server ca-cert kafka- KafkaServer
echo "done 2"
bash ./scripts/gen-kafka-ssl.sh client ca-cert default-kafka- KafkaDefaultClient
echo "done 3"
bash ./scripts/gen-kafka-ssl.sh -k client ca-cert default-kafka- KafkaDefaultClient
keytool -importkeystore -srckeystore default-kafka-client.keystore.jks -srcstorepass "${CLIENT_PASS}" -destkeystore default-kafka-client.keystore.jks -deststoretype pkcs12
keytool -importkeystore -srckeystore kafka-server.keystore.jks -srcstorepass "${PASS}" -destkeystore kafka-server.keystore.jks -deststoretype pkcs12
echo "done all"
mv ca-cert ${CFG}/ca
mv default-kafka-client*.jks ${CFG}/client
mv default-kafka-client.key ${CFG}/client
mv default-kafka-client.pem ${CFG}/client
mv kafka-server*.jks ${CFG}/server
rm default*
rm kafka*
rm ca-*
