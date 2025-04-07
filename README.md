# ✈️ Prolog Flight Planner

This is a logic programming project developed using **Prolog** to model and search airline flight routes. The application supports flight scheduling, querying direct and multi-stop connections, and validating travel routes based on timing.

---

## 📌 Project Overview

This project was created for the **Logic Programming** course at **Fordham University**. It features:

- A flight database using professor-provided data
- Queries for destinations, origins, arrival/departure times
- Recursive route-finding logic with support for **multiple stopovers**
- Cycle prevention and layover time validation
- Screenshot documentation of answers to 6 required questions

---

## 📁 Files

- `project3.pl` – Prolog source file containing facts and logic
- `Prolog Queries` – Folder containing screenshots of terminal output
- `README.md` – This documentation file

---

## ✈️ Flight Data Format

Each flight is stored in the following format:
```prolog
flight(FlightNumber, Origin, Destination, DepartureTime, ArrivalTime).
