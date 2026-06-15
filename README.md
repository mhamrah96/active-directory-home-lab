![Windows Server](https://img.shields.io/badge/Windows_Server-2019-blue)
![Windows 10](https://img.shields.io/badge/Windows_10-Client-blue)
![Active Directory](https://img.shields.io/badge/Active_Directory-Environment-green)
![PowerShell](https://img.shields.io/badge/PowerShell-Automation-blue)



# Enterprise Active Directory Infrastructure Lab
This project documents the setup of a Windows Server 2019 Active Directory lab in VirtualBox. The environment includes a domain controller, DNS, DHCP, RRAS/NAT, a domain-joined Windows 10 client, Group Policy, delegated administration, PowerShell user provisioning, and shared folder permissions.

## Key Skills Demonstrated

- Active Directory Domain Services (AD DS)
- Windows Server 2019 Administration
- DNS and DHCP Configuration
- RRAS/NAT Routing
- Windows 10 Domain Joining
- Organizational Unit (OU) Management
- Group Policy Object (GPO) Administration
- PowerShell Automation and User Provisioning
- Delegation of Control
- Remote Desktop Protocol (RDP) Configuration
- Password Complexity and Account Lockout Policies
- NTFS and Share Permissions
- Role-Based Access Control (RBAC)
- Security Group Administration
- Mapped Network Drive Configuration
- Troubleshooting DHCP, DNS, and APIPA Issues
- VirtualBox Network Configuration
- Basic Enterprise Network Architecture

## Network Topology
<img src="screenshots/topology.png" width="700">

## Architecture Overview

The environment consists of a Windows Server 2019 Domain Controller configured with Active Directory Domain Services (AD DS), DNS, DHCP, and RRAS/NAT. A Windows 10 client machine was domain joined through an internal 172.16.0.0/24 VirtualBox network and configured to receive addressing dynamically from the DHCP scope.

## Project Objectives

- Deploy a Windows Server 2019 Active Directory environment
- Configure DNS, DHCP, and RRAS/NAT services
- Join Windows 10 clients to the domain
- Implement Organizational Units and Group Policy Objects
- Configure delegated administration and RDP access
- Apply password policies and account lockout policies
- Configure NTFS/share permissions and mapped network drives

## Lab Environment

- Hypervisor: VirtualBox
- Server: Windows Server 2019
- Client: Windows 10 Pro
- Domain: maindomain.com
- Internal Network: 172.16.0.0/24
- Domain Controller IP: 172.16.0.1
- DHCP Scope: 172.16.0.100–172.16.0.200

## Infrastructure Setup

### Server Network Configuration

Two network adapters were configured on the Windows Server 2019 virtual machine:
- NAT adapter for internet connectivity
- Internal adapter for domain communication between the server and client systems

#### Internet Adapter (NAT)
<img src="screenshots/NAT_Adapter.png" width="450">

#### Internal Adapter
<img src="screenshots/Internal_Adapter.png" width="450">

### Static Internal IP Configuration
A static internal IP address was configured on the Domain Controller to ensure reliable DNS and DHCP functionality throughout the environment.

<img src="screenshots/Static_IP.png" width="350">

### Active Directory Domain Services (AD DS)
Installed the Active Directory Domain Services role using Server Manager and promoted the server to a Domain Controller for the domain:

#### AD DS Installation
<img src="screenshots/AD-DS-Installation.png" width="450">

#### Promoting the Server to Domain Controller
<img src="screenshots/Server-Promotion.png" width="450">

### RRAS / NAT Configuration
Configured RRAS (Routing and Remote Access Services) with NAT to allow internal domain clients to access the internet through the Domain Controller.

<img src="screenshots/RRAS.png" width="350">


### DHCP Configuration
Configured DHCP services to dynamically assign IP addresses to domain clients on the internal 172.16.0.0/24 network.

#### DHCP Scope Configuration
<img src="screenshots/DHCP-Scope.png" width="350">

#### Verifying DHCP Address Assignment
<img src="screenshots/DHCP-Verification.png" width="450">

#### DHCP Address Lease Verification
<img src="screenshots/DHCP-Lease.png" width="450">

### Domain Join
Joined the Windows 10 client workstation to the Active Directory domain.

<img src="screenshots/Domain-join.png" width="450">

### Verifying Domain Join Through ADUC
<img src="screenshots/Domain-Join-Verification.png" width="450">



## Active Directory Administration

### Organizational Units (OUs)
Created department-based Organizational Units to organize users and apply policies based on departmental roles.

Departments created:

- IT
- Marketing
- Management
- Finance

<img src="screenshots/OU's.png" width="350">

### PowerShell User Provisioning
Used PowerShell automation to bulk-create domain users and improve administrative efficiency.

### PowerShell User Creation Script
<img src="screenshots/Powershell-User-Creation.png" width="450">

#### The following PowerShell script was used to automate bulk Active Directory user creation and provisioning:
```powershell
Import-Module ActiveDirectory

$users = @(
    "John.Smith",
    "Sarah.Jones"
)
```
[bulk-user-creation.ps1](scripts/bulk-user-creation.ps1)


### Verifying User Creation in ADUC
<img src="screenshots/Verifying-User-Creation.png" width="450">


## Delegated Administration & Remote Desktop
### Delegation of Control
Delegated password reset permissions to a designated IT user account within the IT Organizational Unit.

<img src="screenshots/Implementing-Delegation.png" width="450">

### Remote Desktop Configuration
Enabled Remote Desktop access on the server and created an RDP-specific security group to control remote administrative access.

#### Enabling Remote Desktop
<img src="screenshots/Enable-RDP.png" width="450">

#### RDP Security Group Configuration
<img src="screenshots/RDP-Users.png" width="450">

#### RDP Access Configuration Command
<img src="screenshots/RDP-Access-prompt.png" width="450">

#### Logging into the Server via RDP
<img src="screenshots/RDP-Login.png" width="450">

### Password Reset Verification
Verified delegated administrative permissions by resetting a user password through PowerShell while logged into the delegated account.

#### PowerShell Password Reset
<img src="screenshots/Password-reset.png" width="450">

#### Successful Login After Password Reset
<img src="screenshots/login-after-reset.png" width="450">

### Group Policy
#### Control Panel Restriction Policy
Configured a Group Policy Object to restrict Control Panel access for users in the Marketing, Management, and Finance Organizational Units while allowing access for the IT department.

#### GPO Configuration
<img src="screenshots/GPO.png" width="450">
<img src="screenshots/Control-Panel.png" width="450">

#### Linked Organizational Units
<img src="screenshots/Linked-OUs.png" width="450">

#### Verifying Policy Enforcement
<img src="screenshots/Policy-Verification.png" width="450">

### Password Policy & Lockout
#### Password Complexity Policy
Configured domain-wide password policies through Group Policy Management to enforce stronger authentication controls.

#### Password Policy Configuration
<img src="screenshots/Password-Policy.png" width="450">
<img src="screenshots/Password-Lockout.png" width="450">

#### Updating Group Policy
<img src="screenshots/gpupdate.png" width="450">

#### Password Complexity Enforcement
<img src="screenshots/complexity-verify.png" width="450">

#### Account Lockout Policy
Configured an account lockout threshold that disabled accounts after three failed login attempts.

#### Account Lockout Verification
<img src="screenshots/lockout-verify.png" width="450">

#### Locked Account Confirmation in ADUC
<img src="screenshots/aduc-lockout.png" width="450">

### Shared Folder Permissions
#### Finance Security Group
Created a Finance_Group security group to manage access permissions for department-specific shared resources.

<img src="screenshots/finance-group.png" width="450">

#### Share & NTFS Permissions
Configured both Share and NTFS permissions on the FinanceShare folder to implement role-based access control.


#### Share Permissions
<img src="screenshots/shareperms.png" width="450">

#### NTFS Permissions
<img src="screenshots/NTFSperms.png" width="450">

#### Permission Model
The effective permissions applied to users are determined by the most restrictive combination between Share permissions and NTFS permissions.

#### Access Verification
Verified successful access to the shared folder using a user account that was a member of Finance_Group.

#### Finance User Access
<img src="screenshots/financeshare-mmc.png" width="450">

#### Successful Folder Access
<img src="screenshots/financeshare-access.png" width="450">

#### Mapped Network Drive
Mapped the FinanceShare network folder to a drive letter on the client workstation.

<img src="screenshots/map-drive.png" width="450">
<img src="screenshots/map-network-drive.png" width="450">

#### Unauthorized Access Testing
Verified that users outside of Finance_Group were denied access to the shared resource.

<img src="screenshots/denied-access.png" width="450">


### Troubleshooting

During the deployment process, several networking and domain connectivity issues were encountered and resolved, including:

- APIPA address assignment caused by DHCP configuration issues
- DHCP binding and scope verification
- DNS resolution issues preventing domain joins
- VirtualBox internal networking configuration problems
- Domain authentication troubleshooting

Troubleshooting steps included:

- Verifying DHCP scope assignments
- Reviewing server bindings and adapter configurations
- Testing connectivity with ping and nslookup
- Confirming DNS server assignments
- Validating domain communication between the server and client




# Hybrid Identity Extension: Microsoft Entra ID Integration
## After successfully deploying and configuring the on-premises Active Directory environment, the project was extended by integrating Active Directory Domain Services with Microsoft Entra ID using Microsoft Entra Connect Sync. This allowed domain users and groups to be synchronized to the cloud, creating a hybrid identity environment commonly used in modern enterprise networks.

#### Downloading Microsoft Entra Connect
Microsoft Entra Connect was downloaded from Microsoft's official download center. This tool enables synchronization between on-premises Active Directory and Microsoft Entra ID.
<img src="screenshots/Entra Download.png" width="450">

#### Microsoft Entra Connect Sync
The Microsoft Entra "Download Connect Sync Agent" option was selected to configure directory synchronization between the local Active Directory environment and Microsoft Entra ID.
<img src="screenshots/Download Sync.png" width="450">

#### Creating Administrative Account
Before configuring synchronization, a dedicated Microsoft Entra administrative account was created to manage cloud identity services.
<img src="screenshots/Admin Account.png" width="450">

#### Assigning Global Administrator Role
The account was assigned the Global Administrator role, providing the permissions required to configure and manage synchronization services.
<img src="screenshots/Assign Admin.png" width="450">

#### Signing in with Administrator Account
The newly created administrator account was used to authenticate and configure Microsoft Entra Connect, and will be used to migrate.
<img src="screenshots/AD DS Login.png" width="450">

#### Successful Synchronization
Synchronization completed successfully, establishing a connection between Active Directory Domain Services and Microsoft Entra ID.
<img src="screenshots/Success Connection.png" width="450">

#### Verifying Synchronized Users
User accounts from the on-premises Active Directory environment were successfully synchronized and appeared within Microsoft Entra ID.
<img src="screenshots/Verifying User Sync.png" width="450">

#### Creating IT Department Group
An IT Department group was created within Microsoft Entra ID to organize administrative users and prepare for future cloud-based access control and security policies.
<img src="screenshots/Creating IT group.png" width="450">













