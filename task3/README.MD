# Task 3 – Database Normalisation  
College Club Membership Database

**Softwarica College of IT & E-Commerce**  
in collaboration with **Coventry University**

**B.Sc. (Hons) Foundation of Computer Science**

**Submitted by:** Subodh Pandey, Student ID: 250608  
**Submission Date:** 3rd March 2026

---

## Purpose of Task 3

This task demonstrates the process of transforming a poorly structured, redundant flat table into a normalised relational database schema using standard normalisation rules (1NF → 2NF → 3NF).

The scenario uses a **college club membership system** with the following issues in the original design:

- Data redundancy (student and club details repeated)
- Insertion, update, and deletion anomalies
- Lack of proper primary/foreign keys

The goal is to eliminate these problems while preserving all information and relationships.

---

## Normalisation Stages Covered

1. **Unnormalised Form**  
   Single flat table with repeating groups and redundancy  
   → `01_ClubMembership_Unnormalised.sql`

2. **First Normal Form (1NF)**  
   Atomic values + composite primary key `(StudentID, ClubName)`  
   → `02_ClubMembership_1NF.sql`

3. **Second Normal Form (2NF)**  
   Remove partial dependencies → split into three tables  
   - `Student_2NF`  
   - `Club_2NF`  
   - `Membership_2NF`  
   → files `03_2NF_Student.sql`, `04_2NF_Club.sql`, `05_2NF_Membership.sql`

4. **Third Normal Form (3NF)**  
   Remove transitive dependencies + introduce stable surrogate key `ClubID`  
   - `Club_3NF` (PK: ClubID)  
   - `Membership_3NF` (FK: ClubID)  
   → files `06_3NF_Club.sql`, `07_3NF_Membership.sql`

5. **Final Reconstructed View**  
   JOIN query to display meaningful data without redundancy  
   → `08_Final_JOIN_Query.sql`

---
```
## Files and Materials in this Folder
Database_Normalisation_Scripts/
├── README.md                           # ← This file
├── 01_ClubMembership_Unnormalised.sql
├── 02_ClubMembership_1NF.sql
├── 03_2NF_Student.sql
├── 04_2NF_Club.sql
├── 05_2NF_Membership.sql
├── 06_3NF_Club.sql
├── 07_3NF_Membership.sql
├── 08_Final_JOIN_Query.sql
└── screenshots/                        # phpMyAdmin / Workbench table views
```

## Execution Order (Recommended)

Run the scripts sequentially:
01 → 02 → 03 → 04 → 05 → 06 → 07 → 08
textEach file includes `DROP TABLE IF EXISTS` for safe re-execution.

---

## Key Improvements Achieved

- Elimination of redundancy  
- Removal of all three types of anomalies (insertion, update, deletion)  
- Proper primary and foreign key constraints  
- Stable surrogate key for clubs (`ClubID`)  
- Clean many-to-many relationship resolved via junction table (`Membership`)

---

## Related Report Section

Refer to **Section 4** of the main report for:  
- Original flat table (Figure 8)  
- 1NF composite key (Figure 9)  
- 2NF decomposed tables (Figure 10)  
- 3NF schema with ER diagram (Figure 12)  
- SQL INSERT examples and final JOIN query (pages 19–21)

Prepared as part of the coursework submission  
Subodh Pandey – Student ID 250608  
March 2026
