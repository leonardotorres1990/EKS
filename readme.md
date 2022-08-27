Hola!!


Este codigo define la implementación del servicio EKS y despliegue de aplicación sobre el clúster.
Pasos para su despliegue:

1. No incluir archivo eks.tf en el primer despliegue
2. Comentarear el grupo de lineas de codigo 14-16 y 80-89 del archivo vpc.tf
3. Realizar primer despliegue
4. Descomentarear gurpo de lineas de codigo descritas en punto 2, realizar segundo despliegue
5. Incluir el archivo eks.tf para el tercer despliegue


Inicie sesión en la consola de AWS y sobre el servicio AWS cloudshell ejecutar los pasos referidos en el siguiente enlace:
"https://docs.aws.amazon.com/es_es/eks/latest/userguide/sample-deployment.html"

