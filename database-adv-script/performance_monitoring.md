# SQL Query Performance Optimization Report

## Overview

This document explains how we monitored, diagnosed, and optimized the performance of frequently used SQL queries in our system using tools like `EXPLAIN ANALYZE` and `SHOW PROFILE`.

---

## Tools Used

- `EXPLAIN ANALYZE` (PostgreSQL / MySQL 8+): Shows query plan and actual execution time.
- `SHOW PROFILE` (MySQL <8): Displays timing for each phase of query execution.
- Indexing and schema tuning to address identified bottlenecks.