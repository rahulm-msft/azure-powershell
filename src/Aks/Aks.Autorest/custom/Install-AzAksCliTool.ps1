
# ----------------------------------------------------------------------------------
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# Code generated by Microsoft (R) AutoRest Code Generator.Changes may cause incorrect behavior and will be lost if the code
# is regenerated.
# ----------------------------------------------------------------------------------

<#
.Synopsis
Download and install kubectl and kubelogin.
.Description
Download and install kubectl and kubelogin.
#>
function Install-AzAksCliTool
{
    [OutputType([System.Boolean])]
    [CmdletBinding(PositionalBinding=$false, SupportsShouldProcess, ConfirmImpact='Medium')]
    param(
        [Alias("KubectlInstallDestination")]
        [Parameter()]
        [System.String]
        # Path at which to install kubectl. Default to install into ~/.azure-kubectl/
        ${Destination},

        [Alias("KubectlInstallVersion")]
        [Parameter()]
        [System.String]
        # Version of kubectl to install, e.g. 'v1.17.2'. Default value: Latest.
        ${Version},
    
        [Alias("KubectlDownloadFromMirror")]
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        # Download from mirror site : https://mirror.azure.cn/kubernetes/kubectl/
        ${DownloadFromMirror},

        [Parameter()]
        [System.String]
        # Path at which to install kubectl. Default to install into ~/.azure-kubelogin/
        ${KubeloginInstallDestination},

        [Parameter()]
        [System.String]
        # Version of kubectl to install, e.g. 'v0.0.20'. Default value: Latest
        ${KubeloginInstallVersion},
    
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        # Download from mirror site : https://mirror.azure.cn/kubernetes/kubelogin
        ${KubeloginDownloadFromMirror},
    
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        # Wait for .NET debugger to attach
        ${PassThru},
    
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        # Run cmdlet in the background
        ${AsJob},
    
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        # Overwrite existing kubectl and kubelogin without prompt
        ${Force}
    )
    
    process
    {
        #Region Install kubectl
        $KubectlParams = @{}
        If ($PSBoundParameters.ContainsKey("Destination"))
        {
            $KubectlParams["Destination"] = $PSBoundParameters["Destination"]
        }
        If ($PSBoundParameters.ContainsKey("Version"))
        {
            $KubectlParams["Version"] = $PSBoundParameters["Version"]
        }
        If ($PSBoundParameters.ContainsKey("DownloadFromMirror"))
        {
            $KubectlParams["DownloadFromMirror"] = $PSBoundParameters["DownloadFromMirror"]
        }
        If ($PSBoundParameters.ContainsKey("Force"))
        {
            $KubectlParams["Force"] = $PSBoundParameters["Force"]
        }
        Install-Kubectl @KubectlParams
        #EndRegion

        #Region Install kubelogin
        $KubeloginParams = @{}
        If ($PSBoundParameters.ContainsKey("KubeloginInstallDestination"))
        {
            $KubeloginParams["Destination"] = $PSBoundParameters["KubeloginInstallDestination"]
        }
        If ($PSBoundParameters.ContainsKey("KubeloginInstallVersion"))
        {
            $KubeloginParams["Version"] = $PSBoundParameters["KubeloginInstallVersion"]
        }
        If ($PSBoundParameters.ContainsKey("KubeloginDownloadFromMirror"))
        {
            $KubeloginParams["DownloadFromMirror"] = $PSBoundParameters["KubeloginDownloadFromMirror"]
        }
        If ($PSBoundParameters.ContainsKey("Force"))
        {
            $KubeloginParams["Force"] = $PSBoundParameters["Force"]
        }
        Install-Kubelogin @KubeloginParams
        #EndRegion
    }
}

function IsWindows {
    [Microsoft.Azure.PowerShell.Cmdlets.Aks.DoNotExportAttribute()]
    param(
    )
    process {
        return (Get-OSName).contains("Windows")
    }
}

function Get-OSName {
    [Microsoft.Azure.PowerShell.Cmdlets.Aks.DoNotExportAttribute()]
    param(
    )
    process {
        if ($PSVersionTable.PSEdition.Contains("Core")) {
            $OSPlatform = $PSVersionTable.OS
        } else {
            $OSPlatform = $env:OS
        }
        return $OSPlatform
    }
}
Function Install-Kubectl
{
    [Microsoft.Azure.PowerShell.Cmdlets.Aks.DoNotExportAttribute()]
    [CmdletBinding(PositionalBinding=$false, SupportsShouldProcess, ConfirmImpact='Medium')]
    param(
        [Parameter()]
        [System.String]
        ${Destination},

        [Parameter()]
        [System.String]
        ${Version},
    
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        ${DownloadFromMirror},
    
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        ${Force}
    )

    Process
    {
        $baseUrl = "https://storage.googleapis.com/kubernetes-release/release"
        If ($DownloadFromMirror)
        {
            $baseUrl = "https://mirror.azure.cn/kubernetes/kubectl"
        }
        If (($Null -Eq $Destination) -or ("" -Eq $Destination))
        {
            $Destination = [System.IO.Path]::Combine($env:USERPROFILE, ".azure-kubectl")
        }
        $Destination = Resolve-Path -Path $Destination
        If (-not (Test-Path -Path $Destination))
        {
            New-Item -Path $Destination -ItemType Directory
        }
        If (($Null -Eq $Version) -or ("" -Eq $Version))
        {
            $url = "$baseUrl/stable.txt"
            $Version = (Invoke-WebRequest -Uri $url).Content.Trim()
        }
        If (IsWindows)
        {
            $destFilePath = [System.IO.Path]::Combine($Destination, "kubectl.exe")
            $downloadFileUrl = "$baseUrl/$Version/bin/windows/amd64/kubectl.exe"
        }
        ElseIf ($IsLinux)
        {
            $destFilePath = [System.IO.Path]::Combine($Destination, "kubectl")
            $downloadFileUrl = "$baseUrl/$Version/bin/linux/amd64/kubectl"
        }
        ElseIf ($IsMacOS)
        {
            $destFilePath = [System.IO.Path]::Combine($Destination, "kubectl")
            $downloadFileUrl = "$baseUrl/$Version/bin/darwin/amd64/kubectl"
        }
        Else
        {
            $message = "Sorry, this cmdlet is not supported in current OS."
            $ex = [System.PlatformNotSupportedException]::New($message)
            $ex.Data[[Microsoft.Azure.Commands.Common.AzurePSErrorDataKeys]::ErrorKindKey] = [Microsoft.Azure.Commands.Common.ErrorKind]::UserError
            $ex.Data[[Microsoft.Azure.Commands.Common.AzurePSErrorDataKeys]::DesensitizedErrorMessageKey] = $message
            throw $ex
        }
        #region download and install
        If ($PSCmdlet.ShouldProcess("Downloading kubectl from internet.", $destFilePath))
        {
            If (Test-Path -Path $destFilePath)
            {
                If ($Force -Or $PSCmdlet.ShouldContinue("File $destFilePath exist, are you want to replace it?", "Replace file"))
                {
                    $tmpFilePath = "$destFilePath.tmp"
                    Write-Verbose "Downloading from $downloadFileUrl to local: $tmpFilePath"
                    Invoke-WebRequest -Uri $downloadFileUrl -OutFile $tmpFilePath
                    Write-Verbose "Deleting $destFilePath"
                    Remove-Item -Path $destFilePath
                    Write-Verbose "Moving $tmpFilePath to $destFilePath"
                    Move-Item -Path $tmpFilePath -Destination $destFilePath
                }
            }
            Else
            {
                Write-Verbose "Downloading from $downloadFileUrl to local: $destFilePath"
                Invoke-WebRequest -Uri $downloadFileUrl -OutFile $destFilePath
            }
        }
        #endregion
    }
}

Function Install-Kubelogin
{
    [Microsoft.Azure.PowerShell.Cmdlets.Aks.DoNotExportAttribute()]
    [CmdletBinding(PositionalBinding=$false, SupportsShouldProcess, ConfirmImpact='Medium')]
    param(
        [Parameter()]
        [System.String]
        ${Destination},

        [Parameter()]
        [System.String]
        ${Version},
    
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        ${DownloadFromMirror},
    
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        ${Force}
    )

    Process
    {
        $baseDownloadUrl = "https://github.com/Azure/kubelogin/releases/download"
        $latestReleaseUrl = "https://api.github.com/repos/Azure/kubelogin/releases/latest"
        If ($DownloadFromMirror)
        {
            $baseDownloadUrl = "https://mirror.azure.cn/kubernetes/kubelogin"
            $latestReleaseUrl = "https://mirror.azure.cn/kubernetes/kubelogin/latest"
        }
        If (($Null -Eq $Destination) -or ("" -Eq $Destination))
        {
            $Destination = [System.IO.Path]::Combine($env:USERPROFILE, ".azure-kubelogin")
        }
        $Destination = Resolve-Path -Path $Destination
        If (-not (Test-Path -Path $Destination))
        {
            New-Item -Path $Destination -ItemType Directory
        }
        If (($Null -Eq $Version) -or ("" -Eq $Version))
        {
            $latestVersionInfo = (Invoke-WebRequest -Uri $latestReleaseUrl).Content | ConvertFrom-Json
            $Version = $latestVersionInfo.tag_name.Trim()
        }
        $downloadFileUrl = "$baseDownloadUrl/$Version/kubelogin.zip"
        If (IsWindows)
        {
            $subDir = "windows_amd64"
            $binaryName = "kubelogin.exe"
            $destFilePath = [System.IO.Path]::Combine($Destination, "kubelogin.exe")
        }
        ElseIf ($IsLinux)
        {
            $subDir = "linux_amd64"
            $binaryName = "kubelogin"
            $destFilePath = [System.IO.Path]::Combine($Destination, "kubelogin")
        }
        ElseIf ($IsMacOS)
        {
            If ($Env:PROCESSOR_ARCHITECTURE -Eq "AMD64")
            {
                $subDir = "darwin_amd64"
            }
            Else
            {
                $subDir = "darwin_arm64"
            }
            $binaryName = "kubelogin"
            $destFilePath = [System.IO.Path]::Combine($Destination, "kubelogin")
        }
        Else
        {
            $message = "Sorry, this cmdlet is not supported in current OS."
            $ex = [System.PlatformNotSupportedException]::New($message)
            $ex.Data[[Microsoft.Azure.Commands.Common.AzurePSErrorDataKeys]::ErrorKindKey] = [Microsoft.Azure.Commands.Common.ErrorKind]::UserError
            $ex.Data[[Microsoft.Azure.Commands.Common.AzurePSErrorDataKeys]::DesensitizedErrorMessageKey] = $message
            throw $ex
        }
        
        #region download and install
        If ($PSCmdlet.ShouldProcess("Downloading kubelogin from internet.", $destFilePath))
        {
            $downloadFilePath = [System.IO.Path]::Combine($Destination, "kubelogin.zip")
            $uncompressFolderPath = [System.IO.Path]::Combine($Destination, "kubelogin-folder")
            $binFilePath = [System.IO.Path]::Combine($uncompressFolderPath, "bin", $subDir, $binaryName)
            $shouldDownload = $true
            If (Test-Path -Path $destFilePath)
            {
                If ($Force -Or $PSCmdlet.ShouldContinue("File $destFilePath exist, are you want to replace it?", "Replace file"))
                {
                    Write-Verbose "Deleting $destFilePath"
                    Remove-Item -Path $destFilePath
                }
                Else
                {
                    $shouldDownload = $false
                }
            }
            If ($shouldDownload)
            {
                Write-Verbose "Downloading from $downloadFileUrl to local: $downloadFilePath"
                Invoke-WebRequest -Uri $downloadFileUrl -OutFile $downloadFilePath
                Expand-Archive $downloadFilePath -DestinationPath $uncompressFolderPath -Force
                Write-Verbose "Deleting $destFilePath"
                Move-Item -Path $binFilePath -Destination $destFilePath
                Write-Verbose "Deleting $downloadFilePath"
                Remove-Item $downloadFilePath
                Write-Verbose "Deleting $uncompressFolderPath"
                Remove-Item $uncompressFolderPath -Recurse
            }
        }
        #endregion
    }
}
