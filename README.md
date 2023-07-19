1. Get certificate from domain (api.github.com:443) and append the certificate into a file `cert.pem`

````
echo -n | openssl s_client -connect api.github.com:443 | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > cert.pem
````

2. Generate hash:

```
openssl x509 -in assets/certs/cert.pem -pubkey -noout | openssl rsa -pubin -outform der | openssl dgst -sha256 -binary | openssl enc -base64
```
