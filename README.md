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

### Server 2019 adapter setup:
### Internet (NAT):
<img width="975" height="446" alt="image" src="https://github.com/user-attachments/assets/62ed928a-70a6-47bb-8cda-8591688c5d24" />
### Internal:
<img width="975" height="467" alt="image" src="https://github.com/user-attachments/assets/70f22a4c-2c40-496e-9a25-813e28c8d6c6" />

### Static Internal IP Configuration:
<img width="702" height="867" alt="image" src="https://github.com/user-attachments/assets/718eff9d-e2f5-4365-9017-34650d533bda" />

### AD Domain Service Installation:
<img width="975" height="597" alt="image" src="https://github.com/user-attachments/assets/fb4d2ce3-b8f2-419b-8452-9a70931a8c30" />

### Promoting the Server to DC:
<img width="975" height="582" alt="image" src="https://github.com/user-attachments/assets/f575380d-55f7-459b-a3b8-3f16f157170c" />

## DHCP Setup & Domain Join:
### Scope:
<img width="975" height="851" alt="image" src="https://github.com/user-attachments/assets/6e6fa761-9854-413f-8a1a-360ed7b6e892" />

### Confirming client is receiving a DHCP from our scope:
<img width="975" height="638" alt="image" src="https://github.com/user-attachments/assets/fdeb985c-415f-488d-a83f-74f1364b5aaf" />

### Client's computer shown in our address leases:
<img width="975" height="443" alt="image" src="https://github.com/user-attachments/assets/f6e09f8b-848e-4b0c-bb35-d018d3a4067d" />

### Domain Join:
<img width="833" height="709" alt="image" src="https://github.com/user-attachments/assets/e7fd7ae4-5362-49a1-85af-21652599c9b4" />

### Double checking client join through AD UC Computers:
<img width="833" height="709" alt="image" src="https://github.com/user-attachments/assets/6366ed5a-e399-45b3-9a28-731523c29847" />


# Active Directory Administration

### Created four Organizational Units (IT, Marketing, Management, Finance):
<img width="383" height="489" alt="image" src="https://github.com/user-attachments/assets/3ceee93d-2caf-4b26-97c1-84efb4a32e96" />

## Powershell user creation automation:
### Created department-based OUs and used PowerShell to automate the creation of 10 domain users.
<img width="927" height="639" alt="image" src="https://github.com/user-attachments/assets/6acd4a98-85d0-4e95-9e82-01ad48467da8" />


### Confirming user creation:
<img width="716" height="586" alt="image" src="https://github.com/user-attachments/assets/92f75aec-052d-4f77-89fb-5b4833c25313" />\


## Delegation + RDP
### Delegated a user and gave reset password premissions:
<img width="795" height="631" alt="image" src="https://github.com/user-attachments/assets/c46c42e0-9b11-4310-b726-061b82e80c62" />

### Enable "Allow remote connections to this computer" through System Properties -> Remote:
<img width="628" height="714" alt="image" src="https://github.com/user-attachments/assets/6fb792b0-12af-46ee-bd69-945f2536bd77" />

### Create a security group insisde the IT department OU and name it "RDP_Users", added Mike Brown, the delegated user, into the Security Group:
<img width="949" height="595" alt="image" src="https://github.com/user-attachments/assets/a7a4fe7a-c88a-4fd8-a9e0-609925205eee" />

### Used this command to enable remote desktop access for RDP_Users:
<img width="975" height="124" alt="image" src="https://github.com/user-attachments/assets/d65b5baf-e5fe-4e5d-aad8-7f03e9863f8e" />

### Logging into RDP with Mike Brown's Credentials:
<img width="714" height="777" alt="image" src="https://github.com/user-attachments/assets/249952f7-f14d-46e9-9726-00ba64bc7ea2" />

### Run Powershell inside the RDP, and run this command to check if Mike has the delegated premissions to reset a password:
<img width="975" height="275" alt="image" src="https://github.com/user-attachments/assets/7e61d480-4a92-4df1-855e-9bbe85f12a53" />

### Log into Emily's account via windows 10 client to check password reset:
<img width="975" height="650" alt="image" src="https://github.com/user-attachments/assets/494efd7b-4db2-48bd-a0cd-daf8460fa915" />

## Group Policy
### Creating the Control Panel Policy to deny access to control panel except the IT department:
<img width="623" height="295" alt="image" src="https://github.com/user-attachments/assets/b3eb23ed-90f0-43ac-bf84-bac4c495ee67" />
<img width="975" height="442" alt="image" src="https://github.com/user-attachments/assets/b64f98b0-eb42-46f4-9990-9aa4f3e52605" />

### Added the GPO to the following Organizational Units:
<img width="975" height="350" alt="image" src="https://github.com/user-attachments/assets/bde5a13b-ce11-4bd9-9e34-d6a8c97ffd84" />

### Checked if control panel was accessible with an account inside the Marketing OU:
<img width="975" height="473" alt="image" src="https://github.com/user-attachments/assets/a5638887-345d-4d6b-9666-0af5a5869738" />

## Password Policy and Lockout
### Updated Password Policy:
<img width="861" height="328" alt="image" src="https://github.com/user-attachments/assets/fa872477-4d93-4bf7-a01a-d610e3c39cb3" />
<img width="917" height="213" alt="image" src="https://github.com/user-attachments/assets/49b35c68-8649-4ece-8b4d-383073f316e9" />

### We will update our group policy with the following command:
<img width="800" height="136" alt="image" src="https://github.com/user-attachments/assets/4215d280-1a1e-4cfa-830f-a52bd0c0c67a" />

### When I tried resetting a password with generic letters, I got this error:
<img width="627" height="302" alt="image" src="https://github.com/user-attachments/assets/17d74423-f6ba-4880-be1c-6407ca11c80a" />

### While testing Account Lockout Policy, account was disabled after three failed attempts, as expected:
<img width="653" height="585" alt="image" src="https://github.com/user-attachments/assets/e2cb03ec-9676-40a8-861a-0927cc577fd6" />

### We can also see that the account shows as locked when trying to reset the password in AD UC:
<img width="608" height="406" alt="image" src="https://github.com/user-attachments/assets/bb181603-a470-4800-ad3f-c6d22af8ef02" />

## Shared Folder Premissions
### We have created a Finance_Group, which is a security group inside the Finance OU, we will use this to configure permissions to the folders only available to the users inside this group:
<img width="975" height="546" alt="image" src="https://github.com/user-attachments/assets/7bce3314-bce5-46cc-a618-af6519cbc32f" />

### We will now add the Finance_Group to the Share premissions of the file "FinanceShare", which was created in This PC -> Finance -> FinanceShare:
<img width="563" height="719" alt="image" src="https://github.com/user-attachments/assets/e5bce811-e079-4a0c-8c17-6cf184552158" />

### We will also add Finance_Group to the NTFS Permissions:
<img width="598" height="736" alt="image" src="https://github.com/user-attachments/assets/351af12c-b05b-4287-a7bc-43bfd8505b46" />

### Note: Both permissions will always pick the least privilege, if NTFS has Read and Share has Full Control, it will automatically configure to Read

### We will now check access to the folder on the Omar.Phil account using our client account:
<img width="691" height="333" alt="image" src="https://github.com/user-attachments/assets/492e7c9f-a568-41bb-b067-4dd454150b78" />

### We successfully gained premission:
<img width="975" height="474" alt="image" src="https://github.com/user-attachments/assets/9e835ce9-df21-49ef-9107-946b143b1c0f" />

### We will also map the folder by right clicking this PC -> Map Network Drive:
<img width="963" height="700" alt="image" src="https://github.com/user-attachments/assets/f038244e-07b8-4cb2-b6d3-3f596549b6d3" />
<img width="528" height="161" alt="image" src="https://github.com/user-attachments/assets/2cfb17f3-6f26-4363-9979-59e94915ae6b" />

### If we tried to access the folder using a different account, we are hit with this error:
<img width="975" height="740" alt="image" src="https://github.com/user-attachments/assets/87ae02fa-776a-47a6-ba83-97f7c85c513d" />


## Troubleshooting

During the lab, I ran into DHCP and APIPA issues where the Windows 10 client was not receiving an address from the DHCP scope. I resolved this by reviewing the VirtualBox network adapters, DHCP scope configuration, and server bindings. I also verified DNS resolution and domain connectivity before joining the client to the domain.

## Skills Demonstrated

- Active Directory Domain Services
- DNS and DHCP configuration
- RRAS/NAT routing
- Windows Server administration
- Domain joining Windows clients
- Organizational Units and security groups
- PowerShell user provisioning
- Delegation of Control
- Group Policy Objects
- Password and account lockout policies
- NTFS and share permissions
- Network troubleshooting





















