include domains.mk

up: cert
	docker compose up -d

down:
	docker compose down

restart:
	docker compose restart proxy

logs:
	docker compose logs -f

cert: .user/cert/akka-key.pem

.user/cert/akka-key.pem: domains.mk
	mkdir -p .user/cert
	mkcert --key-file .user/cert/akka-key.pem  --cert-file .user/cert/akka-crt.pem $(DOMAINS)

clean:
	mkdir -p .user/cert
	rm .user/cert/*.pem

