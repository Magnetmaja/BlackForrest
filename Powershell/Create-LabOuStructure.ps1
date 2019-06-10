
function Create-LabOuStructure ($RootOUName) {
 
$RootOuPath = (Get-ADDomain).DistinguishedName
$RootOuLabName = $RootOUName

$RootOU = New-ADOrganizationalUnit -Name $RootOuLabName -Path $RootOuPath -PassThru

$ComputerOU = New-ADOrganizationalUnit -Name "Computers" -Path $RootOU.DistinguishedName -PassThru
$UserOU = New-ADOrganizationalUnit -Name "Users" -Path $RootOU.DistinguishedName -PassThru
$GroupOU = New-ADOrganizationalUnit -Name "Groups" -Path $RootOU.DistinguishedName -PassThru


"Laptops", "Workstations", "Thin Client", "Tablets" |
    % { New-ADOrganizationalUnit -Name $PSItem -Path $ComputerOU.DistinguishedName -PassThru }

"Board", "Production", "Sales", "IT","Admins" |
    % { New-ADOrganizationalUnit -Name $PSItem -Path $UserOU.DistinguishedName -PassThru }

"Security Groups", "Resource Groups", "Administrative Groups", "Management Groups","Admin Group" |
    % { New-ADOrganizationalUnit -Name $PSItem -Path $GroupOU.DistinguishedName -PassThru }

    }

    Create-LabOuStructure "Magnetmaja"