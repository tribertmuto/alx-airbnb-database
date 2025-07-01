## Partitioning the Booking Table

## ✅ Purpose

The `Booking` table contains a large volume of data, which caused performance issues when filtering by `start_date`. To address this, we implemented **range-based table partitioning** to improve query efficiency, reduce scan time, and optimize resource usage.

---

##  Partitioning Implementation

We created a new table `Booking_partitioned` and applied `RANGE` partitioning on the `start_date` column:
