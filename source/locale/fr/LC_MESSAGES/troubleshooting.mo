��    D      <              \  Y  ]  l   �  7   $  S   \  �   �  U   :     �  ~   �  %     2   ;  �   n  �   	  R   �	  G   �	  �   G
  	  *  �   4  �   �  �   �  �   p  �       �  8   �  �   �  p   �  '   N     v  i   �     �       q     �   �      /  �   P  *     `   -     �     �  T  �     �  P        X  �   y  �   
      d     �   �  O  H  #   �  �   �  �   }   �   %!     �!     �!      "  .   $"  *   S"  3   ~"     �"  ,   �"  2   �"  =   +#  7   i#  �   �#  �   P$     �$  �   �$  �  s%  �  ,'  r   �(  S   O)  p   �)  �   *  c   �*     +  �   +  3   �+  6   �+  �   ,  �   �,  c   �-  [   �-    H.  <  ^/  �   �0  .  �1  �   �2  �   [3  �  4  ,   �5  T   �5    ;6  �   T7  7   �7     8  �   %8     �8     �8  �   �8  �   X9  $   (:  �   M:  5   (;  l   ^;     �;     �;  �  �;  	   �=  O   �=  q  �=  �   k?  G  @  X  dA  y   �C  �   7D  �  E  (   �G  �   H  �   �H  �   �I     �J  
   �J     �J  =   �J  +   K  N   0K  #   K  5   �K  >   �K  K   L  I   dL  �   �L  �   �M  #   7N  �   [N   A known issue on VMware machines. ESX hosts lock certain critical virtual machine files and file systems to prevent concurrent changes. Sometimes the files are not unlocked when the virtual machine is powered off. When a virtual machine attempts to power on, it can not access these critical files, and the virtual machine is unable to power on. A virtual router is running, but the host is disconnected. A virtual router no longer functions as expected. Adjust the above command to suit your deployment needs. After changing the network offering on a network, load balancer rules stop working. Before you continue with destroying this router, ensure that the backup router is running. Otherwise the network connection will be lost. Below are a few troubleshooting steps to check whats going wrong with your network... Cause Create a firewall rule on the virtual router for each of your existing load balancing rules so that they continue to function. Data Loss on Exported Primary Storage Destroy the router by using the destroyRouter API. Ensure `Traffic Labels <http://cloudstack.apache.org/docs/en-US/Apache_CloudStack/4.2.0/html/Installation_Guide/about-physical-networks.html>`_ are set for the Zone. For more information about the API syntax, see the API Reference at `http://cloudstack.apache.org/docs/api/ <http://cloudstack.apache.org/docs/api/>`_. Force stop the router. Use the stopRouter API with forced=true parameter to do so. Host was placed in maintenance mode, but still appears live in vCenter. However, the Virtual Router's (VR) Source NAT Public IP address **WONT** be reachable until appropriate Ingress rules are in place. You can add *Ingress* rules under *Network, Guest Network, IP Address, Firewall* setting page. If the pings dont work, run *tcpdump(8)* all over the place to check who is gobbling up the packets. Ultimately, if the switches are not configured correctly, CloudStack networking wont work so fix the physical networking issues before you proceed to the next steps If the template was created by uploading an OVA file that was created using vSphere Client, it is possible the OVA contained an ISO image. If it does, the deployment of VMs from the template will fail. If you are sure that a virtual router is down forever, or no longer functions as expected, destroy it. You must create one afresh while keeping the backup router up and running (it is assumed this is in a redundant router setup): In a vast majority of the cases, the problem has turned out to be at the switching layer where the L3 switches were configured incorrectly. It is possible that a client from outside the intended pool has mounted the storage. When this occurs, the LVM is wiped and all data in the volume is lost KVM traffic labels require to be named as *"cloudbr0"*, *"cloudbr2"*, *"cloudbrN"* etc and the corresponding bridge must exist on the KVM hosts. If you create labels/bridges with any other names, CloudStack (atleast earlier versions did) seems to ignore them. CloudStack does not create the physical bridges on the KVM hosts, you need to create them **before** before adding the host to Cloudstack. List labels using *CloudMonkey* Load balancer rules fail after changing network offering Load balancing rules were created while using a network service offering that includes an external load balancer device such as NetScaler, and later the network service offering changed to one that uses the CloudStack virtual router. Loss of existing data on primary storage which has been exposed as a Linux NFS server export on an iSCSI volume. Maintenance mode not working on vCenter More Information Note that the job ID is 1076. You can track back the events relating to job 1076 with the following grep: On *host1 (kvm1)* On *host2 (kvm2)* On an existing zone, you can modify the traffic labels by going to *Infrastructure, Zones, Physical Network* tab. Pre-create labels on the XenServer Hosts. Similar to KVM bridge setup, traffic labels must also be pre-created on the XenServer hosts before adding them to CloudStack. Recovering a Lost Virtual Router Recreate the missing router by using the restartNetwork API with cleanup=false parameter. For more information about redundant router setup, see Creating a New Network Offering. Remove the ISO and re-upload the template. See the export procedure in the "Secondary Storage" section of the CloudStack Installation Guide See the following: Solution Some users have reported that flushing IPTables rules (or changing routes) on the SSVM, CPVM or the Virtual Router makes the Internet work. This is not expected behaviour and suggests that your networking settings are incorrect. No IPtables/route changes are required on the SSVM, CPVM or the VR. Go back and double check all your settings. Symptom The CloudStack Agent Server logs its activities in `/var/log/cloudstack/agent/`. The CloudStack Management Server logs all web site, middle tier, and database activities for diagnostics purposes in `/var/log/cloudstack/management/`. The CloudStack logs a variety of error messages. We recommend this command to find the problematic output in the Management Server log:. The CloudStack administrator UI was used to place the host in scheduled maintenance mode. This mode is separate from vCenter's maintenance mode. The CloudStack processes requests with a Job ID. If you find an error in the logs and you are interested in debugging the issue you can grep for this job ID in the management server log. For example, suppose that you find the following ERROR message: The Internet would be accessible from both the SSVM and CPVM instances by default. Their public IPs will also be directly pingable from the Internet. Please note that these test would work only if your switches and traffic labels are configured correctly for your environment. If your SSVM/CPVM cant reach the Internet, its very unlikely that the Virtual Router (VR) can also the reach the Internet suggesting that its either a switching issue or incorrectly assigned traffic labels. Fix the SSVM/CPVM issues before you debug VR issues. The VM Instances by default wont be able to access the Internet. Add Egress rules to permit traffic. The Virtual Router (VR) should also be able to reach the Internet without having any Egress rules. The Egress rules only control forwarded traffic and not traffic that originates on the VR itself. The Virtual Router, SSVM, CPVM *public* interface would be bridged to a physical interface on the host. In the example below, *cloudbr0* is the public interface and CloudStack has correctly created the virtual interfaces bridge. This virtual interface to physical interface mapping is done automatically by CloudStack using the traffic label settings for the Zone. If you have provided correct settings and still dont have a working working Internet, check the switching layer before you debug any further. You can verify traffic using tcpdump on the virtual, physical and bridge interfaces. The Virtual router is lost or down. The switches have to be configured correctly to pass VLAN traffic. You can verify if VLAN traffic is working by bringing up a tagged interface on the hosts and pinging between them as below... This section was contibuted by Shanker Balan and was originally published on `Shapeblue's blog <http://shankerbalan.net/blog/internet-not-working-on-cloudstack-vms/>`_ Traffic labels need to be set for all hypervisors including XenServer, KVM and VMware types. You can configure traffic labels when you creating a new zone from the *Add Zone Wizard*. Trouble Shooting Steps TroubleShooting Troubleshooting Internet Traffic Unable to access Virtual machine configuration Unable to access a file since it is locked Unable to deploy VMs from uploaded vSphere template Unable to open Swap File Unable to power on virtual machine on VMware Use vCenter to place the host in maintenance mode. Virtual machine does not power on. You might see errors like: When attempting to create a VM, the VM will not deploy. When copying and pasting a command, be sure the command has pasted as a single line before executing. Some document viewers may introduce unwanted line breaks in copied text. When setting up LUN exports, restrict the range of IP addresses that are allowed access by specifying a subnet mask. For example: Working with Server Logs `VMware Knowledge Base Article <http://kb.vmware.com/selfservice/microsites/search.do?language=en_US&cmd=displayKC&externalId=10051/>`_ Project-Id-Version: Apache CloudStack Administration RTD
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2014-06-30 12:52+0200
PO-Revision-Date: 2016-10-09 11:59+0200
Last-Translator: 
Language-Team: French (http://www.transifex.com/ke4qqq/apache-cloudstack-administration-rtd/language/fr/)
Plural-Forms: nplurals=2; plural=(n > 1)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 1.3
 Une erreur connue sur les machines VMware. Les hôtes ESX verrouille certains fichiers et systèmes de fichiers de machine virtuelle critique pour prévenir de changement concurrent. Parfois, les fichiers ne sont pas déverouillés quand la machine virtuelle est éteinte. Quand la machine virtuelle essaie de redémarrer, elle ne peut pas accéder à ces fichiers critiques, et la machine virtuelle n'est pas capable de démarrer. Un routeur virtuel fonctionne, mais l'hôte est déconnecté. Un routeur virtuel ne fonctionne plus comme attendu. Ajuster la commande ci-dessous pour correspondre aux besoins de votre déploiement. Après le changement d'offre réseau sur un réseau, les règles du répartiteur de charge ne fonctionnent plus. Avant de continuer avec la destruction de ce routeur, assurez vous que le routeur de secours est en fonctionnement. Sinon la connexion au réseau sera perdue. Ci-dessous les quelques étapes de dépannage pour vérifier ce qui ne va pas avec votre réseau... Cause Créer une règle de firewall sur le routeur virtuel pour chacune de vos règles de répartition de charge afin qu'elles continuent à fonctionner. Données perdues sur un stockage primaire exporté. Détruire le routeur en utilisant l'API destroyRouter. S'assurer que les `Labels Trafics <http://cloudstack.apache.org/docs/en-US/Apache_CloudStack/4.2.0/html/Installation_Guide/about-physical-networks.html>`_ sont renseignés pour cette Zone. Pour plus d'information sur la syntaxe de l'API, voir la Référence de l'API à l'adresse `http://cloudstack.apache.org/docs/api/ <http://cloudstack.apache.org/docs/api/>`_. Forcer l'arrêt du routeur. Utiliser l'API stopRouter avec le paramètre forced=true pour le faire. L'hôte a été placé en mode maintenance, mais apparaît toujours vivant dans le vCenter. Toutefois, les adresses IP publique de Source NAT du Routeur Virtuel (VR) **ne seront pas** accessible tant que les règles entrantes ne sont pas en place. Vous pouvez ajouter les règles *Ingress*  sous la page de configuration *Réseau, Réseau Invité, Adresse IP, Parefeu*. Si les pings ne fonctionne pas, utiliser *tcpdump(8)* un peu partout pour vérifier qui absorbe les paquets. En définitive, si les commutateurs ne sont pas configurés correctement, le réseau CloudStack ne fonctionnera pas alors corriger les pannes réseaux physiques avant de poursuivre avec les étapes suivantes Si le modèle a été créé en téléchargeant un fichier OVA qui a été créé en utilisant un client vSphere, il est possible que l'OVA contienne une image ISO. Si c'est le cas, le déploiement des VMs depuis le modèle va échouer. Si vous êtes certain que le routeur est définitivement stoppé, ou qu'il ne fonctionne plus comme attendu, le détruire. Vous devez en créer un de nouveau tout en conservant le routeur de secours démarré et en fonctionnement (ceci suppose qu'il s'agit d'une configuration avec routeur redondant) : Dans une grande majorité des cas, le problème s'est avéré être un problème de commutateur où la couche 3 des commutateurs était incorrectement configurée. Il est possible qu'un client depuis l'extérieur du pool attendu ait monté le stockage. Lorsque cela arrive, le LVM est corrompu et toutes les données du volume sont perdus. Les labels de trafic KVM nécessitent d'être nommés comme *"cloudbr0"*, *"cloudbr2"*, *"cloudbrN"* etc et le pont correspondant doit exister sur les hôtes KVM. Si vous créez des labels/ponts avec n'importe quel autre nom, CloudStack (au moins les versions anciennes le font) semble les ignorer. CloudStack ne crée pas les ponts physiques sur les hôtes KVM, vous devez les créer **avant** d'ajouter l'hôte dans CloudStack. Lister les labels en utilisant *CloudMonkey* Les règles du répartiteur de charge échouent après un changement d'offre réseau Les règles de répartitions de charge ont été créées lors de l'utilisation d'une offre de service qui inclue un répartiteur de charge physique externe comme un NetScaler, et plus tard l'offre de service réseau à changée pour une qui utilise un routeur virtuel CloudStack. La perte de données existante sur le stockage primaire qui a été exposé comme un export de serveur Linux NFS sur un volume ISCSI. Le mode de maintenance ne fonctionne pas sur un vCenter Plus d'information Noter que l'identifiant du travail est 1076. Vous pouvez tracer les évènements en relation avec le travail 1076 avec le grep suivant : Sur *host1 (kvm1)* Sur *host2 (kvm2)* Sur une zone existante, vous pouvez modifier les labels de trafic en allant sur l'onglet *Infrastructure, Zones, Réseau physique*. Pré-créer les labels sur les hôtes XenServer. Similaire à la configuration du pont KVM, les labels de trafics doivent aussi être pré-créés sur les hôtes XenServer avant de les ajouter à CloudStack. Récupérer un routeur virtuel perdu Recréer le routeur manquant en utilisant l'API restartNetwork avec le paramètre cleanup=false. Pour plus d'information à propos de la configuration redondante des routeurs, voir Créer une nouvelle offre de réseau. Ejecter l'ISO et télécharger de nouveau le modèle. Voir la procédure d'exportation dans la section "Stockage secondaire" du guide d'installation de CloudStack Voir ce qui suit : Solution Certains utilisateurs ont rapportés qu'en réinitialisant les règles IPTables (ou en changeant les routes) sur la SSVM, CPVM ou sur le Routeur Virtuel font fonctionner internet. Ce n'est pas un comportement normal et cela suggère que vos paramètres réseaux sont incorrectes. Aucun changement de règles IPTables ou de route ne sont nécessaires sur la SSVM, CPVM ou le VR. Revenir et refaire une vérification de tous vos paramètres. Symptôme L'agent CloudStack enregistre ses activités dans `/var/log/cloudstack/agent/`. Le serveur de gestion de CloudStack consigne toutes les activités du site web, du middle tier, et de la base de données à des fins de diagnostique dans `/var/log/cloudstack/management/`. CloudStack enregistre une variété de messages d'erreurs. Nous recommandons cette commande pour trouver la sortie problématique parmi les enregistrements du serveur de gestion : L'interface d'administration de CloudStack a été utilisée pour basculer l'hôte en mode de maintenance programmée. Ce mode est différent du mode de maintenance du vCenter. CloudStack traite les requêtes avec un identifiant de travail. Si vous trouver une error dans les logs et que vous êtes intéressés dans le dépannage de ce problème, vous pouvez faire un grep pour cet ID de travail dans les logs du serveur de gestion. Par example, en supposant que vous trouviez le message ERROR suivant : Internet devrait être accessible depuis à la fois les instances SSVM et CPVM par défaut. Leurs IP publiques seront également directement pingable depuis Internet. Merci de prendre note que ces tests ne fonctionneront que si vos commutateurs et les labels de trafic sont correctement configurés dans votre environnement. Si vos SSVM/CPVM ne peuvent pas joindre Internet, il y a peu de chance que le Routeur Virtuel puisse également le faire, ce qui indique un problème de commutateur ou de labels de trafic mal attribués. Fixer les problèmes SSVM/CPVM avant de débugger les problèmes de VR. Les instances de VM ne peuvent pas accéder par défaut à Internet. Ajouter les règles Egress pour permettre le trafic. Le routeur virtuel (VR) devrait aussi être capable d'atteindre Internet sans avoir des règles Egress. Les règles Egress contrôlent seulement le trafic transféré et pas le trafic qui provient du VR lui-même. L'interface publique du Routeur Virtuel, de la SSVM et de la CPVM doivent être attachées à l'interface physique sur l'hôte. Dans l'exemple ci-dessous, *cloudbr0* est l'interface publique et CloudStack a correctement crée le pont des interfaces virtuelles. L'attachement de l'interface virtuelle à l'interface physique est automatiquement effectuée par CloudStack, en s'appuyant sur le paramètre de label du trafic pour la zone. Si vous avez fourni les paramètres correctes et que vous n'avez toujours pas de connexion Internet, vérifier la couche réseau avant de débugger plus loin. Vous pouvez vérifier le trafic en utilisant tcpdump sur les interfaces virtuelles, les interfaces physiques et les ponts. Le routeur virtuel est perdu ou stoppé. Les commutateurs doivent être configurés correctement pour laisser passer le trafic VLAN. Vous pouvez vérifier si le trafic VLAN fonctionne en montant une interface sur les hôtes et en pinguant entre eux comme ci-dessous... Cette section est une contribution de Shanker Balan et a été publié à l'origine sur le `Blog Shapeblue <http://shankerbalan.net/blog/internet-not-working-on-cloudstack-vms/>`_ Les labels de trafic doivent être renseignés sur tous les hyperviseurs incluant les types XenServer, KVM et VMware. Vous pouvez configurer les labels de trafic quand vous créez une nouvelle zone depuis l'*Assistant d'Ajout de Zone*. Étapes de dépannage Dépannage Dépanner le trafic Internet Accès impossible à la configuration d'une machine virtuelle Accès impossible à un fichier avec verrou Impossible de déployer des VMs depuis un modèle téléchargé depuis vSphere Impossible d'ouvrir le fichier Swap Impossible d'allumer une machine virtuelle sur VMware Utiliser le vCenter pour basculer l'hôte en mode maintenance. La machine virtuelle ne démarre pas. Vous devriez voir des erreurs comme : Lors de la tentative de création d'une VM, la VM ne va pas se déployer. Lors du copier/coller d'une commande, soyez certain que la commande est collée sur une seule ligne avant de l'exécuter. Certains lecteur de document peuvent introduire un saut de ligne indésirable dans le texte copié. Lors de la configuration de l'exportation d'un LUN, restreindre la plage des adresses IP autorisées à y accéder en spécifiant un masque de sous réseau. Par exemple : Travailler avec les logs du serveur `Article de la base de connaissance VMware  <http://kb.vmware.com/selfservice/microsites/search.do?language=en_US&cmd=displayKC&externalId=10051/>`_ 