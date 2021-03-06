#region Header
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.
using module .\..\Common\Common.psm1
using module .\..\Convert.Stig\Convert.Stig.psm1

$exclude = @($MyInvocation.MyCommand.Name,'Template.*.txt')
$supportFileList = Get-ChildItem -Path $PSScriptRoot -Exclude $exclude
Foreach ($supportFile in $supportFileList)
{
    Write-Verbose "Loading $($supportFile.FullName)"
    . $supportFile.FullName
}
#endregion
#region Class
Class WmiRule : STIG
{
    [string] $Query
    [string] $Property
    [string] $Value
    [string] $Operator

    # Constructor
    WmiRule ( [xml.xmlelement] $StigRule )
    {
        $this.InvokeClass( $StigRule )
    }
}
#endregion
