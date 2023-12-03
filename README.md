<!-- # Society Car Parking System

## Overview

This project implements a Society Car Parking System with the following features:

- **Reserved Parking Entry/Exit:** Allows residents to enter or exit the parking area with a flat number and password verification.
- **Guest Parking Entry/Exit:** Manages guest parking slots, allowing entry and exit.

## Prerequisites

Before running the application, make sure you have the following installed:

- [Python](https://www.python.org/downloads/)
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
  Checks and updates slot availability for parking lot exits. -->

# Smart Parking System

The Smart Parking System is a hardware-software integrated solution designed for managing parking spaces within residential complexes. Leveraging a combination of hardware description language (HDL) and Python scripting, this system provides an efficient and user-friendly way to handle parking operations.

## Features

### Initialization

1. The system begins by prompting the user to input the total number of flats and the number of guest parking slots.

2. A VHDL file, `number_of_slots.v`, is dynamically generated to define the parking and guest slots based on user input.

### Guest Parking Database

1. A guest parking database file (`DB_guest.txt`) is created to store binary representations of guest parking slots.

2. The user specifies the number of guest parking slots, and the corresponding binary data is written to the file.

### Parking Operations

1. The system offers multiple parking operations, including:
    - Reserved Parking Entry (0)
    - Reserved Parking Exit (1)
    - Guest Parking Entry (2)
    - Guest Parking Exit (3)

2. User input triggers the execution of the corresponding operation from the `py_modules` module.

### Reserved Parking Management

1. The system manages reserved parking entries and exits based on user input.

2. Password verification and slot availability are checked before allowing entry.

### Guest Parking Management

1. Guest parking entries and exits are handled separately.

2. Binary manipulation of guest parking data is performed to track entries and exits.

### Session Management

1. Users have the option to end the session or refresh the system for the next set of operations.

### Simulation and Execution

1. VHDL modules, such as `clear_slots.v`, `guest_parking_entry.v`, etc., are compiled and executed using Icarus Verilog (`iverilog`) and VVP (`vvp`).

2. The Python script (`py_main.py`) orchestrates the overall system, providing a seamless user experience.

## Getting Started

1. Clone the repository: `git clone https://github.com/sanjeevani-25/society-car-parking-system.git`

2. Navigate to the project directory: `cd society-car-parking-system`

3. Run the system: `python py_main.py`

## Dependencies

- `iverilog`: Open-source Verilog simulator.
- `Python`: Python scripts orchestrate the parking system.