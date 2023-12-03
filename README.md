# Society Car Parking System

## Overview

This project implements a Society Car Parking System with the following features:

- **Reserved Parking Entry/Exit:** Allows residents to enter or exit the parking area with a flat number and password verification.
- **Guest Parking Entry/Exit:** Manages guest parking slots, allowing entry and exit.

## Prerequisites

Before running the application, make sure you have the following installed:

- [Python](https://www.python.org/downloads/)
- [Streamlit](https://streamlit.io/)
- [Verilog](https://en.wikipedia.org/wiki/Verilog) (for hardware description language)

## Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/sanjeevani-25/society-car-parking-system.git
    cd your_repository
    ```

2. Install the required Python packages:

    ```bash
    pip install -r requirements.txt
    ```

3. Install Verilog tools if not already installed:

    - Example for [iverilog](http://iverilog.icarus.com/):

        ```bash
        sudo apt-get install iverilog
        ```

## Usage

1. Run the Streamlit application:

    ```bash
    streamlit run py_main.py
    ```

2. Follow the on-screen instructions to interact with the parking system.

## Verilog Modules

- **`clear_parking_slots` Module:**
  Clears all parking slots in the system.

- **`guest_parking_entry` Module:**
  Manages entry for guest parking, updating the guest database.

- **`guest_parking_exit` Module:**
  Manages exit for guest parking, updating the guest database.

- **`main` Module:**
  Main module integrating password management and slot availability checks.

- **`reserved_parking_entry` Module:**
  Manages entry for reserved parking, updating the reserved parking database.

- **`slot_availability_exit` Module:**
  Checks and updates slot availability for parking lot exits.
