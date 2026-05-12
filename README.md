![Windows Server](https://img.shields.io/badge/Windows_Server-2019-blue)
![Active Directory](https://img.shields.io/badge/Active_Directory-Lab-green)
![PowerShell](https://img.shields.io/badge/PowerShell-Automation-blue)

# Active Directory Infrastructure & PowerShell Administration Lab
This project documents the setup of a Windows Server 2019 Active Directory lab in VirtualBox. The environment includes a domain controller, DNS, DHCP, RRAS/NAT, a domain-joined Windows 10 client, Group Policy, delegated administration, PowerShell user provisioning, and shared folder permissions.

## Network Topology
<img width="676" height="530" alt="Active Directory Topology" src="https://github.com/user-attachments/assets/d0c41d97-ce43-4431-a5ef-1276e00b4dd8" />

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
<img width="500" height="350" alt="image" src="https://github.com/user-attachments/assets/62ed928a-70a6-47bb-8cda-8591688c5d24" />

#### Internal Adapter
<img width="500" height="350" alt="image" src="https://github.com/user-attachments/assets/70f22a4c-2c40-496e-9a25-813e28c8d6c6" />

### Static Internal IP Configuration
A static internal IP address was configured on the Domain Controller to ensure reliable DNS and DHCP functionality throughout the environment.

<img width="300" height="400" alt="image" src="https://github.com/user-attachments/assets/718eff9d-e2f5-4365-9017-34650d533bda" />

### Active Directory Domain Services (AD DS)
Installed the Active Directory Domain Services role using Server Manager and promoted the server to a Domain Controller for the domain:

#### AD DS Installation
<img width="500" height="300" alt="image" src="https://github.com/user-attachments/assets/fb4d2ce3-b8f2-419b-8452-9a70931a8c30" />

#### Promoting the Server to Domain Controller
<img width="400" height="300" alt="image" src="https://github.com/user-attachments/assets/f575380d-55f7-459b-a3b8-3f16f157170c" />

### RRAS / NAT Configuration
Configured RRAS (Routing and Remote Access Services) with NAT to allow internal domain clients to access the internet through the Domain Controller.

<img width="500" height="425" alt="image" src="https://github.com/user-attachments/assets/0ec6c6d6-0283-4a08-8a09-2655b3a9b4a2" />


### DHCP Configuration
Configured DHCP services to dynamically assign IP addresses to domain clients on the internal 172.16.0.0/24 network.

#### DHCP Scope Configuration
<img width="400" height="400" alt="image" src="https://github.com/user-attachments/assets/6e6fa761-9854-413f-8a1a-360ed7b6e892" />

#### Verifying DHCP Address Assignment
<img width="550" height="400" alt="image" src="https://github.com/user-attachments/assets/fdeb985c-415f-488d-a83f-74f1364b5aaf" />

#### DHCP Address Lease Verification
<img width="500" height="300" alt="image" src="https://github.com/user-attachments/assets/f6e09f8b-848e-4b0c-bb35-d018d3a4067d" />

### Domain Join
Joined the Windows 10 client workstation to the Active Directory domain.

<img width="500" height="450" alt="image" src="https://github.com/user-attachments/assets/e7fd7ae4-5362-49a1-85af-21652599c9b4" />

### Verifying Domain Join Through ADUC
<img width="475" height="545" alt="image" src="https://github.com/user-attachments/assets/6366ed5a-e399-45b3-9a28-731523c29847" />


## Active Directory Administration

### Organizational Units (OUs)
Created department-based Organizational Units to organize users and apply policies based on departmental roles.

Departments created:

- IT
- Marketing
- Management
- Finance

<img width="200" height="300" alt="image" src="https://github.com/user-attachments/assets/3ceee93d-2caf-4b26-97c1-84efb4a32e96" />

### PowerShell User Provisioning
Used PowerShell automation to bulk-create domain users and improve administrative efficiency.

### PowerShell User Creation Script
<img width="500" height="300" alt="image" src="https://github.com/user-attachments/assets/6acd4a98-85d0-4e95-9e82-01ad48467da8" />

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
<img width="500" height="350" alt="image" src="https://github.com/user-attachments/assets/92f75aec-052d-4f77-89fb-5b4833c25313" />\


## Delegated Administration & Remote Desktop
### Delegation of Control
Delegated password reset permissions to a designated IT user account within the IT Organizational Unit.

<img width="500" height="450" alt="image" src="https://github.com/user-attachments/assets/c46c42e0-9b11-4310-b726-061b82e80c62" />

### Remote Desktop Configuration
Enabled Remote Desktop access on the server and created an RDP-specific security group to control remote administrative access.

#### Enabling Remote Desktop
<img width="375" height="420" alt="image" src="https://github.com/user-attachments/assets/6fb792b0-12af-46ee-bd69-945f2536bd77" />

#### RDP Security Group Configuration
<img width="500" height="350" alt="image" src="https://github.com/user-attachments/assets/a7a4fe7a-c88a-4fd8-a9e0-609925205eee" />

#### RDP Access Configuration Command
<img width="800" height="100" alt="image" src="https://github.com/user-attachments/assets/d65b5baf-e5fe-4e5d-aad8-7f03e9863f8e" />

#### Logging into the Server via RDP
<img width="375" height="425" alt="image" src="https://github.com/user-attachments/assets/249952f7-f14d-46e9-9726-00ba64bc7ea2" />

### Password Reset Verification
Verified delegated administrative permissions by resetting a user password through PowerShell while logged into the delegated account.

#### PowerShell Password Reset
<img width="600" height="250" alt="image" src="https://github.com/user-attachments/assets/7e61d480-4a92-4df1-855e-9bbe85f12a53" />

#### Successful Login After Password Reset
<img width="550" height="350" alt="image" src="https://github.com/user-attachments/assets/494efd7b-4db2-48bd-a0cd-daf8460fa915" />

### Group Policy
#### Control Panel Restriction Policy
Configured a Group Policy Object to restrict Control Panel access for users in the Marketing, Management, and Finance Organizational Units while allowing access for the IT department.

#### GPO Configuration
<img width="400" height="200" alt="image" src="https://github.com/user-attachments/assets/b3eb23ed-90f0-43ac-bf84-bac4c495ee67" />
<img width="650" height="400" alt="image" src="https://github.com/user-attachments/assets/b64f98b0-eb42-46f4-9990-9aa4f3e52605" />

#### Linked Organizational Units
<img width="650" height="275" alt="image" src="https://github.com/user-attachments/assets/bde5a13b-ce11-4bd9-9e34-d6a8c97ffd84" />

#### Verifying Policy Enforcement
<img width="650" height="400" alt="image" src="https://github.com/user-attachments/assets/a5638887-345d-4d6b-9666-0af5a5869738" />

### Password Policy & Lockout
#### Password Complexity Policy
Configured domain-wide password policies through Group Policy Management to enforce stronger authentication controls.

#### Password Policy Configuration
<img width="600" height="275" alt="image" src="https://github.com/user-attachments/assets/fa872477-4d93-4bf7-a01a-d610e3c39cb3" />
<img width="600" height="200" alt="image" src="https://github.com/user-attachments/assets/49b35c68-8649-4ece-8b4d-383073f316e9" />

#### Updating Group Policy
<img width="450" height="100" alt="image" src="https://github.com/user-attachments/assets/4215d280-1a1e-4cfa-830f-a52bd0c0c67a" />

#### Password Complexity Enforcement
<img width="450" height="275" alt="image" src="https://github.com/user-attachments/assets/17d74423-f6ba-4880-be1c-6407ca11c80a" />

#### Account Lockout Policy
Configured an account lockout threshold that disabled accounts after three failed login attempts.

#### Account Lockout Verification
<img width="450" height="450" alt="image" src="https://github.com/user-attachments/assets/e2cb03ec-9676-40a8-861a-0927cc577fd6" />

#### Locked Account Confirmation in ADUC
<img width="400" height="300" alt="image" src="https://github.com/user-attachments/assets/bb181603-a470-4800-ad3f-c6d22af8ef02" />

### Shared Folder Permissions
#### Finance Security Group
Created a Finance_Group security group to manage access permissions for department-specific shared resources.

<img width="450" height="300" alt="image" src="https://github.com/user-attachments/assets/7bce3314-bce5-46cc-a618-af6519cbc32f" />

#### Share & NTFS Permissions
Configured both Share and NTFS permissions on the FinanceShare folder to implement role-based access control.


#### Share Permissions
<img width="350" height="550" alt="image" src="https://github.com/user-attachments/assets/e5bce811-e079-4a0c-8c17-6cf184552158" />

#### NTFS Permissions
<img width="375" height="500" alt="image" src="https://github.com/user-attachments/assets/351af12c-b05b-4287-a7bc-43bfd8505b46" />

#### Permission Model
The effective permissions applied to users are determined by the most restrictive combination between Share permissions and NTFS permissions.

#### Access Verification
Verified successful access to the shared folder using a user account that was a member of Finance_Group.

#### Finance User Access
<img width="450" height="275" alt="image" src="https://github.com/user-attachments/assets/492e7c9f-a568-41bb-b067-4dd454150b78" />

#### Successful Folder Access
<img width="500" height="275" alt="image" src="https://github.com/user-attachments/assets/9e835ce9-df21-49ef-9107-946b143b1c0f" />

#### Mapped Network Drive
Mapped the FinanceShare network folder to a drive letter on the client workstation.

<img width="650" height="475" alt="image" src="https://github.com/user-attachments/assets/f038244e-07b8-4cb2-b6d3-3f596549b6d3" />
<img width="375" height="120" alt="image" src="https://github.com/user-attachments/assets/2cfb17f3-6f26-4363-9979-59e94915ae6b" />

#### Unauthorized Access Testing
Verified that users outside of Finance_Group were denied access to the shared resource.

<img width="600" height="475" alt="image" src="https://github.com/user-attachments/assets/87ae02fa-776a-47a6-ba83-97f7c85c513d" />


### Troubleshooting

During the deployment process, several networking and domain connectivity issues were encountered and resolved, including:

APIPA address assignment caused by DHCP configuration issues
DHCP binding and scope verification
DNS resolution issues preventing domain joins
VirtualBox internal networking configuration problems
Domain authentication troubleshooting

Troubleshooting steps included:

Verifying DHCP scope assignments
Reviewing server bindings and adapter configurations
Testing connectivity with ping and nslookup
Confirming DNS server assignments
Validating domain communication between the server and client

### Skills Demonstrated

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





















