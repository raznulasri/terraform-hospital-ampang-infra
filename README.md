# AWS Infrastructure Replication – Hospital Ampang 

## Summary

This repository contains the **Infrastructure as Code (IaC)** implementation using **Terraform** to replicate the core infrastructure architecture of **Hospital Ampang** in an Amazon Web Services (AWS) cloud environment. 

The primary objective of this project is to serve as a **Proof-of-Concept (PoC)** and foundational model, demonstrating the automated deployment, network segmentation, and resource provisioning based on the approved **Ministry of Health (MOH) / Kementerian Kesihatan Malaysia (KKM)** final System Design Document (SDD).


-------
# Infrastructure Servers - Hospital Ampang

Below is the complete list of infrastructure servers for Hospital Ampang, fully approved by the Ministry of Health (MOH) for implementation.

## Infra (IF) Server's
- **01.** AMP-IFDC01 | 10.39.101.1 - Primary Domain Controller
- **02.** AMP-IFDC02 | 10.39.101.2 - Secondary Domain Controller
- **03.** AMP-IFDC03 | 10.39.101.3 - Tertiary Domain Controller
- **04.** AMP-IFEM01 | 10.39.101.4 - Email server
- **05.** AMP-IFEM02 | 10.39.101.5 - Email server (OWA)
- **06.** AMP-IFAV01 | 10.39.101.10 - Antivirus Server
- **07.** AMP-IFFS01 | 10.39.101.9 - Fileserver
- **08.** AMP-IFPB01 | 10.39.101.6 - Print/Backup Server 1
- **09.** AMP-IFPB02 | 10.49.101.7 - Print/Backup Server 2
- **10.** AMP-IFMO01 | 10.39.101.13 - System Monitoring Server
- **11.** AMP-IFNM01 | 10.39.101.14 - Network Monitoring Server
- **12.** AMP-IFFO01 | 10.39.101.16 - Failover Server 1
- **13.** AMP-IFFO02 | 10.39.101.17 - Failover Server 2
- **14.** AMP-IFSU01 | 10.39.101.15 - Windows SUS Server
- **15.** AMP-IFUX01 | 10.39.101.11 - Intranet Server 1
- **16.** AMP-IFUX02 | 10.39.101.12 - Intranet Server 2
- **17.** AMP-IFPX01 | 10.39.101.8 - Internet Proxy/ISA Server



## Report Servers
- **18.** AMP-BERP01 | 10.39.101.26
- **19.** AMP-BERP02 | 10.39.101.27
- **20.** AMP-BERP03 | 10.39.101.28
- **21.** AMP-BERP04 | 10.39.101.29

## Non-Clinical (Haemo/CSSD/HR/Diet)
- **22.** AMP-NCHD01 | 10.39.101.50
- **23.** AMP-NCDT01 | 10.39.101.51
- **24.** AMP-NCCS01 | 10.39.101.52
- **25.** AMP-NCDW01 | 10.39.101.53

## Training/Testing
- **26.** AMP-TRLB01 | 10.39.101.46
- **27.** AMP-TRLB02 | 10.39.101.47
- **28.** AMP-TRRP01 | 10.39.101.44
- **29.** AMP-TRRP02 | 10.39.101.45

## Lab/Bil/HL7
- **30.** AMP-BELP01 | 10.39.101.30
- **31.** AMP-BEBP01 | 10.39.101.31
- **32.** AMP-BEHG01 | 10.39.101.32
- **33.** AMP-BEHG02 | 10.39.101.33
- **34.** AMP-BEHG03 | 10.39.101.34

## Storage HP SAN Storage
- **35.** AMP-IFST01 | 10.39.102.1
