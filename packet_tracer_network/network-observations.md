## Local Network

PC1 et PC2 peuvent communiquer directement sans passerelle par défaut (default gateway), car ils se trouvent tous les deux dans le même sous-réseau IPv4 : 192.168.10.0/24. Une passerelle par défaut est nécessaire uniquement lorsqu’un hôte doit communiquer avec une destination située en dehors de son sous-réseau local.

Avant le premier échange ICMP, le protocole ARP est utilisé pour découvrir l’adresse MAC associée à l’adresse IPv4 de destination. PC1 envoie une requête ARP pour 192.168.10.11, et PC2 répond en fournissant son adresse MAC.

Si la destination se trouvait en dehors du sous-réseau local, PC1 enverrait le trafic à sa passerelle par défaut au lieu de l’envoyer directement à l’hôte de destination. ARP serait alors utilisé pour découvrir l’adresse MAC de la passerelle par défaut, puis le routeur transmettrait le paquet vers le réseau distant.