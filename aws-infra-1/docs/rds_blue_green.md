## Blue/Green Deployment para RDS con AWS DMS

1. Crear instancia RDS "verde" con misma configuración que la actual.
2. Usar AWS DMS para replicar la base de datos "azul" hacia la nueva.
3. Validar aplicación apuntando a la instancia verde en entorno de staging.
4. Una vez validado, cambiar el `CNAME` en Route 53 para que apunte a la nueva instancia.
5. Monitorear y eliminar la instancia anterior solo cuando se confirme la estabilidad.
