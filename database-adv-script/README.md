# SQL Join Queries - Bookings Database

This project contains sample SQL Server queries demonstrating the use of different types of SQL JOINs.

# Queries Included

# 1. INNER JOIN
Retrieves all bookings along with the users who made those bookings.

sql
FROM Bookings b
INNER JOIN Users u ON b.UserID = u.UserID
