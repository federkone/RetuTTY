# PowerShell Server Manager - GUI Tool

Una interfaz gráfica basada en Windows Forms para gestionar conexiones de servidores mediante protocolos SSH, SFTP, SCP, Wake-on-LAN, Knockd Service y Ping.

## 📋 Descripción

Esta aplicación es una utilidad completa para administrar servidores que funciona como gestor de credenciales para diversos servicios de red. Inspirada en herramientas como PuTTY. 

El objetivo principal es proporcionar una plataforma portable que permita conectarse a servidores con solo un par de clics, sin necesidad de usar la consola ni tener servicios adicionales instalados en el sistema operativo.

### 📦 Componentes Incluidos

- **OpenSSH** - Cliente SSH integrado,Fuente: [Github](https://github.com/PowerShell/Win32-OpenSSH/releases/tag/V8.6.0.0p1-Beta)
- **WinSCP** - Cliente SFTP/SCP integrado,Fuente: [winscp.net](https://winscp.net/download/WinSCP-6.5.1-Portable.zip)
- **Scripts PowerShell** - Para funcionalidades adicionales usando servicios nativos


### 🎯 Caso de uso potencial para esta aplicacion:

Permitir automatizar secuencias completas de comandos, ejemplo:

1. **Ejecutar WAKE ON LAN (WOL), o WAKE ON WAN (WOW)** para encencer un servidor remoto.
2. **Timeout automático** - Espera estimada de "X" minutos para encendido
3. **Ejecutar servicio KNOCKD** para lanzar una secuencia de comandos necesaria para habilitar el puerto SSH en el servidor remoto. 
4. **Ejecutar conexión SSH** de manera automática consumiendo las credenciales almacenadas en esta aplicación.

Después de esta secuencia de pasos automatizada reproducida con éxito tendriamos una terminal abierta con el acceso al servidor.
Este caso de uso fue el principal impulsor de esta idea.

## 🛠️ Requisitos del Sistema

Windows debe tener la política de ejecución configurada como:
```powershell
Set-ExecutionPolicy Unrestricted
```

Para más información consultar la [documentación oficial de Microsoft](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.security/set-executionpolicy?view=powershell-7.5)

## 🚀 Uso/ejecución

Para su ejecución puede usar el ".exe" o ejecutar el script como administrador "./Appv2.ps1".

## 💡 Adicional
Como característica adicional, podemos reemplazar la consola Powershell de Windows por otra que más nos guste.
como así también podemos probar otras versiones de OpenSSH y WindSCP. 
Todas las dependencias pueden ser intercambiables simplemente reemplazando los directorios y modificando la referencia de ejecución en el código fuente.

## 🔄 Flujo de Trabajo Típico

1. **Almacenar credenciales** del servidor en la aplicación
2. **Configurar secuencia automatizada** (opcional)
3. **Gestionar múltiples servidores** desde una interfaz unificada
