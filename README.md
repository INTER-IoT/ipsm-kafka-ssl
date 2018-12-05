# SSL configuration for IPSM and IPSM Dashboard
This repository contains a simple tool to generate an SSL configuration for the [ipsm-docker](https://github.com/INTER-IoT/ipsm-docker) and [ipsm-dashboard-docker](https://github.com/INTER-IoT/ipsm-dashboard-docker). Before using it you need to edit the configuration parameters in `config.env`.

Then, to generate the certificates and keys use the following command:

```bash
bash configure.sh
```

The above assumes that [OpenSSL](https://www.openssl.org/) toolkit has been installed on the machine.
