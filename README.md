# Trabajo Práctico 1: PowerShell y Auditoría de Sistemas

**Asignatura:** Programación para Seguridad Informática  
**Docente:** Lic. Carlos Pacheco  
**Alumna:** Mariana Belén Mamani Burgos  

---

## 📋 1. Descripción del Práctico
Este trabajo práctico consiste en el desarrollo e implementación de un script automatizado en **PowerShell** (`TP1-Seguridad.ps1`), diseñado con el objetivo de auditar, inspeccionar y recopilar información clave sobre la configuración de seguridad local, la versión del intérprete de comandos y las especificaciones técnicas del sistema operativo, complementado con la ejecución de utilidades nativas del Símbolo del Sistema (`cmd`).

---

## 🛠️ 2. Contenido del Script (`TP1-Seguridad.ps1`)
El script ejecuta de manera secuencial los siguientes comandos de auditoría:

```powershell
<#
.SYNOPSIS
    Trabajo Práctico 1 - Programación para Seguridad Informática
.DESCRIPTION
    Script para obtener la versión de PowerShell, política de ejecución (permisividad),
    información de la edición del SO e información completa del sistema con systeminfo.
#>

Write-Host "=============================================" -ForegroundColor Cyan
Write-Host "   INFORME DE SISTEMA - TRABAJO PRÁCTICO 1   " -ForegroundColor Cyan
Write-Host "=============================================" -ForegroundColor Cyan

# 1. Versión de PowerShell
Write-Host "`n[+] 1. Versión de PowerShell:" -ForegroundColor Yellow
$PSVersionTable

# 2. Configuración de permisividad (Política de ejecución)
Write-Host "`n[+] 2. Configuración de Permisividad (Execution Policy):" -ForegroundColor Yellow
Get-ExecutionPolicy -List

# 3. Información relacionada a la edición del sistema operativo
Write-Host "`n[+] 3. Información del Sistema Operativo:" -ForegroundColor Yellow
Get-CimInstance Win32_OperatingSystem | Select-Object Caption, Version, OSArchitecture, BuildNumber, RegisteredUser

# 4. Información completa de la PC utilizando el comando del Símbolo del Sistema
Write-Host "`n[+] 4. Información Completa de la PC (Systeminfo):" -ForegroundColor Yellow

```

## 🔍 3. Explicación Técnica de las Instrucciones

Cada instrucción dentro del script cumple una función específica dentro del análisis y la seguridad informática:

* **Versión de PowerShell (`$PSVersionTable`):** Consulta una variable automática del sistema que arroja una tabla detallada con la versión exacta de PowerShell, la edición (`Desktop` o `Core`) y la versión de .NET Framework (`CLRVersion`), permitiendo validar la compatibilidad de módulos y entornos de ejecución.

* **Configuración de Permisividad (`Get-ExecutionPolicy -List`):** Evalúa las políticas de ejecución configuradas en los diferentes ámbitos (*scopes*) del sistema (`MachinePolicy`, `UserPolicy`, `Process`, `CurrentUser`, `LocalMachine`). Es un parámetro crítico en seguridad para determinar si el equipo permite la ejecución de scripts sin firmar.

* **Edición del Sistema Operativo (`Get-CimInstance Win32_OperatingSystem`):** Extrae mediante WMI/CIM las propiedades del SO (como `Caption`, `Version`, `OSArchitecture`, `BuildNumber` y `RegisteredUser`), ofreciendo un inventario limpio y estructurado de la plataforma.

* **Información Completa de la PC (`cmd.exe /c "systeminfo"`):** Invoca al Símbolo del Sistema para ejecutar la herramienta nativa `systeminfo`, generando un reporte forense exhaustivo que abarca el tiempo de actividad (*uptime*), memoria RAM disponible, revisiones de actualizaciones de seguridad instaladas (`KBs`), adaptadores de red y el estado de la virtualización (VBS).

---

## 🚀 4. Instrucciones de Ejecución

1. Clonar el repositorio oficial del proyecto o descargar el archivo `TP1-Seguridad.ps1` en una carpeta local.
2. Abrir **Visual Studio Code** o la terminal de **PowerShell** posicionándose en el directorio del archivo.
3. Habilitar temporalmente la ejecución de scripts en la sesión actual si el sistema lo requiere:
   ```powershell
   Set-ExecutionPolicy -Scope Process -ExecutionPolicy RemoteSigned