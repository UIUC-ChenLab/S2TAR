# S2TAR

## Overview
S2TAR stands for Shared Secure Trusted Accelerators with Reconfiguration. This repository hosts the code and documentation for our research project. We proposed a secure and reconfigurable Tensor Processing Unit (TPU) designed for multi-tenant cloud environments with Trusted Execution Environment. Our work addresses the growing demand for hardware accelerators in Machine Learning (ML) workloads while ensuring dynamic scalability, data privacy, and confidentiality.

Key highlights of our project include:

- Reconfigurable TPU Design: A novel TPU architecture based on switchbox-enabled systolic arrays for rapid dynamic partitioning.
- Confidential Computing Integration: Trusted Execution Environment (TEE) support for enhanced security and data privacy on TPU-like accelerators in shared environments.
- Remote Attestation Protocol: Fine-grained trust establishment for sub-device partitions without compromising security guarantees.

# Documentation
## Repository Structure
- `hw/`: core design code (mainly in Vitis/Vivado)
- `src/`: application code (will be updated after cleaning up)

Additional files, including scripts for running example applications, are currently under cleaning up. Stay tuned for updates.

## Getting Started
We are currently working on the instruction of building, running and using AccShield. Stay tuned for updates as we enhance the documentation. If you encounter any issues, bugs, or have suggestions for improvements, please don’t hesitate to reach out. We will work hard to fix them.

# Publication
Please refer to our IEEE CLOUD 2024 paper for more detailed information. If you are using S2TAR in your research, the following reference is provided.

- W. Ren, S. Koteshwara, M. Ye, H. Franke and D. Chen, "S2TAR: Shared Secure Trusted Accelerators with Reconfiguration for Machine Learning in the Cloud," in in IEEE Cloud'2024, doi: 10.1109/CLOUD62652.2024.00038.

    ```tex
    @INPROCEEDINGS {ren2024s2tar,
        author = { Ren, Wei and Koteshwara, Sandhya and Ye, Mengmei and Franke, Hubertus and Chen, Deming },
        booktitle = { 2024 IEEE 17th International Conference on Cloud Computing (CLOUD) },
        title = {{ S2TAR: Shared Secure Trusted Accelerators with Reconfiguration for Machine Learning in the Cloud }},
        year = {2024},
        volume = {},
        ISSN = {},
        pages = {267-278},
        keywords = {Cloud computing;Protocols;Tensors;Shape;Machine learning;Switches;Systolic arrays},
        doi = {10.1109/CLOUD62652.2024.00038},
        url = {https://doi.ieeecomputersociety.org/10.1109/CLOUD62652.2024.00038},
        publisher = {IEEE Computer Society},
        address = {Los Alamitos, CA, USA},
        month = Jul
    }
    ```
