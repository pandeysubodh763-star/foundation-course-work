# Task 1 – Encoding Formats and Secure Data Exchange

**Softwarica College of IT & E-Commerce**  
in collaboration with **Coventry University**

**B.Sc. (Hons) Foundation of Computer Science**

**Submitted by:** Subodh Pandey, Student ID: 250608  
**Submission Date:** 3rd March 2026

---

## Purpose of Task 1

This section investigates how different encoding methods are used to represent and transmit data reliably across networks, and how they support secure communication protocols.

The main focus is on:

- Understanding the purpose and mechanism of common encoding formats  
- Analyzing their role in real-world systems (web, email, APIs, security protocols)  
- Identifying security implications when these encodings are misused

---

## Topics Covered

- **ASCII and hexadecimal encoding**  
- **Base64 encoding** (standard and Base64url variant)  
- **URL / Percent encoding**  
- Integration with secure protocols:  
  - HTTPS / TLS certificate handling  
  - MIME email attachments  
  - REST APIs and OAuth / JWT usage  
- Security considerations:  
  - Obfuscation techniques used in attacks  
  - Canonicalisation and input validation defences

```
## Files and Materials in this Folder
Task1_Encoding_Security/
├── README.md                           # ← This file
├── diagrams/
│   ├── base64-encoding-process.png
│   ├── mime-base64-email-structure.png
│   ├── tls-handshake-certificate.png
│   └── url-encoding-before-after.png
├── examples/
│   └── encoding_comparison_table.md
└── references.md                       # Academic sources & standards (RFCs, OWASP, etc.)

```

## Key Takeaways

- Encoding is about **data representation and compatibility**, not confidentiality  
- Base64, URL encoding, and hex are essential for transporting binary data through text-based systems  
- These formats become part of secure systems only when combined with encryption (TLS) and proper validation  
- Misuse of encoding (double-encoding, nested encoding) is a common technique in web attacks

---

## Related Report Section

Refer to **Section 2** of the main report for:  
- Detailed explanations and comparisons  
- Visual diagrams (Base64 flow, MIME structure, TLS handshake)  
- Discussion of legitimate use cases vs. attack patterns

Prepared as part of the coursework submission  
Subodh Pandey – Student ID 250608  
March 2026
