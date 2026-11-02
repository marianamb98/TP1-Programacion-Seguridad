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
cmd.exe /c "systeminfo"