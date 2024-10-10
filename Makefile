include domains.mk

CAROOT:=~/.akka/cert

up: cert
	docker compose up -d

down:
	docker compose down

restart:
	docker compose restart proxy

logs:
	docker compose logs -f


install:
	CAROOT=$(CAROOT) mkcert -install


info:
	CAROOT=$(CAROOT) mkcert -CAROOT

cert: ~/.akka/cert/rootCA-key.pem ~/.akka/cert/akka-key.pem

 ~/.akka/cert/rootCA-key.pem:
	mkdir -p ~/.akka/cert
	CAROOT=$(CAROOT) mkcert -install

~/.akka/cert/akka-key.pem: domains.mk
	mkdir -p ~/.akka/cert
	CAROOT=$(CAROOT) mkcert --key-file ~/.akka/cert/akka-key.pem  --cert-file ~/.akka/cert/akka-crt.pem $(DOMAINS)

clean:
	mkdir -p ~/.akka/cert
	rm ~/.akka/cert/akka*.pem

clean_all:
	mkdir -p ~/.akka/cert
	rm ~/.akka/cert/*.pem

