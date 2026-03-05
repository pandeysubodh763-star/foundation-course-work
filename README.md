# Investigation and Analysis of Computing Data for Data Management

**Softwarica College of IT & E-Commerce**  
in collaboration with **Coventry University**

**B.Sc. (Hons) Foundation of Computer Science**  
**Module Code:** ST4015CMD

**Submission Date:** 3rd March 2026  
**Submitted by:** Subodh Pandey, Student ID: 250608  
**Submitted to:** Sir

---

## Project Overview

This repository contains the complete academic submission for the module **ST4015CMD**.  
The work demonstrates foundational concepts in computing through three main practical investigations:

1. **Encoding formats and secure data transmission**  
   (ASCII, Hex, Base64, URL encoding, TLS/HTTPS, MIME, security implications)

2. **Computational complexity – P vs NP**  
   (Illustrated using a real-world classroom seating constraint problem)

3. **Relational database normalisation**  
   (From unnormalised flat table → 1NF → 2NF → 3NF using college club membership scenario)

All practical work (especially database scripts and screenshots) is organised in clearly named folders.

---

## Repository Structure
.
```
├── README.md                                 # ← This file (you are reading it)
├── Report/                                   # Final written report document
│   └── ST4015CMD_Report_Subodh_Pandey_250608.pdf
├── Task1_Encoding_Security/                  # Task 1 materials
│   ├── diagrams/                             # Base64, MIME, TLS flowcharts
│   └── references.md                         # Key sources & notes
├── Task2_P_vs_NP/                            # Task 2 materials
│   ├── seating_problem_explanation.md
│   └── diagrams/                             # P vs NP comparison visuals
└── Task3_Database_Normalisation/             # Task 3 – Main practical work
├── Database_Normalisation_Scripts/       # All SQL files
│   ├── 01_ClubMembership_Unnormalised.sql
│   ├── 02_ClubMembership_1NF.sql
│   ├── 03_2NF_Student.sql
│   ├── 04_2NF_Club.sql
│   ├── 05_2NF_Membership.sql
│   ├── 06_3NF_Club.sql
│   ├── 07_3NF_Membership.sql
│   ├── 08_Final_JOIN_Query.sql
│   └── README.md                         # Task 3 specific readme
├── screenshots/                          # phpMyAdmin / MySQL Workbench captures
└── ERD_3NF.png                           # Final 3NF Entity-Relationship Diagram

```
## How to Explore the Project

1. **Read the full report**  
   → Open `Report/ST4015CMD_Report_Subodh_Pandey_250608.pdf`

2. **View normalisation process (Task 3)**  
   → Go to `Task3_Database_Normalisation/Database_Normalisation_Scripts/`  
   → Run SQL files in order: 01 → 08  
   → See screenshots in `screenshots/` folder for visual proof of each stage

3. **Understand encoding & security (Task 1)**  
   → Check diagrams and notes in `Task1_Encoding_Security/`

4. **Learn about P vs NP (Task 2)**  
   → Read explanation and view diagrams in `Task2_P_vs_NP/`

---

## Technologies & Tools Used

- **Database:** MySQL / MariaDB  
- **Interface:** phpMyAdmin, MySQL Workbench  
- **Documentation:** Microsoft Word / Google Docs  
- **Version Control:** Git & GitHub

---

## License

This repository is submitted as part of an academic assignment.  
All content is the original work of Subodh Pandey unless otherwise cited in the report.

Prepared & submitted: **March 2026**  
Subodh Pandey – Student ID 250608  
Softwarica College of IT & E-Commerce
