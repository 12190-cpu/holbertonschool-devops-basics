## Local Network

PC1 et PC2 peuvent communiquer directement sans passerelle par défaut (default gateway), car ils se trouvent tous les deux dans le même sous-réseau IPv4 : 192.168.10.0/24. Une passerelle par défaut est nécessaire uniquement lorsqu’un hôte doit communiquer avec une destination située en dehors de son sous-réseau local.

Avant le premier échange ICMP, le protocole ARP est utilisé pour découvrir l’adresse MAC associée à l’adresse IPv4 de destination. PC1 envoie une requête ARP pour 192.168.10.11, et PC2 répond en fournissant son adresse MAC.

Si la destination se trouvait en dehors du sous-réseau local, PC1 enverrait le trafic à sa passerelle par défaut au lieu de l’envoyer directement à l’hôte de destination. ARP serait alors utilisé pour découvrir l’adresse MAC de la passerelle par défaut, puis le routeur transmettrait le paquet vers le réseau distant.

## Routed Networks
R1 n’a pas besoin de routes statiques pour les trois réseaux, car il possède une interface active directement connectée à chacun d’eux. Les réseaux 192.168.10.0/24, 192.168.20.0/24 et 10.0.0.0/30 apparaissent donc automatiquement comme des routes directement connectées dans la table de routage.

Lorsque la passerelle par défaut (default gateway) de PC3 a été supprimée, PC3 pouvait toujours communiquer avec PC4, car les deux machines se trouvent dans le même sous-réseau 192.168.20.0/24. En revanche, PC3 ne pouvait plus communiquer avec PC1, car PC1 se trouve dans le sous-réseau 192.168.10.0/24. Le trafic destiné à un autre sous-réseau doit être envoyé à la passerelle par défaut, qui est 192.168.20.1 pour PC3.

On peut identifier une passerelle par défaut manquante sur un hôte lorsque la communication avec les machines du même sous-réseau fonctionne toujours, mais que la communication avec les réseaux distants échoue.

À l’inverse, une interface inactive sur le routeur apparaîtrait comme étant down dans la commande :

show ip interface brief

Dans ce cas, le réseau connecté à cette interface ne serait pas disponible pour l’acheminement normal du trafic.

## Dynamic Addressing
Le processus DHCP utilise quatre étapes principales : Discover, Offer, Request et Acknowledgment (DORA).

Tout d’abord, le client envoie un message DHCP Discover afin de rechercher un serveur DHCP. Le serveur répond avec un Offer, contenant une configuration IP disponible. Le client envoie ensuite un Request pour accepter l’adresse proposée, puis le serveur termine le processus avec un Acknowledgment (ACK) confirmant l’attribution du bail DHCP.

Les adresses des passerelles sont exclues des pools DHCP car elles sont déjà attribuées aux interfaces du routeur. L’exclusion de ces adresses empêche le serveur DHCP de les attribuer à des clients, ce qui évite les conflits d’adresses IP.

PC1, PC2, PC3 et PC4 utilisent DHCP, car les postes clients peuvent recevoir automatiquement leur adresse IP, leur masque de sous-réseau et leur passerelle par défaut. SRV1 reste configuré avec une adresse statique 10.0.0.2/30, car un serveur doit conserver une adresse prévisible et stable afin que les autres équipements puissent accéder de manière fiable à ses services.

Lorsque le pool DEV_LAN a été temporairement modifié de 192.168.10.0/24 vers 192.168.30.0/24, PC1 n’a pas pu obtenir de bail DHCP valide. Le pool DHCP doit correspondre au réseau sur lequel se trouve le client. Après avoir rétabli DEV_LAN sur 192.168.10.0/24, PC1 a de nouveau reçu un bail valide et la connectivité a été rétablie.

La running configuration est la configuration actuellement active dans la mémoire du routeur. La startup configuration est la configuration sauvegardée que le routeur charge après un redémarrage.