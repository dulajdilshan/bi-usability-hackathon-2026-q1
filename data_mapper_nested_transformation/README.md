# Data Mapper Nested Transformation

## Overview
A Ballerina sample demonstrating nested data transformation patterns using the data mapper. Shows how to transform hierarchical data with lookups from multiple data sources.

## Key Capabilities Demonstrated
- XML parsing and type binding
- Nested structure flattening (Legs → Events → flat events list)
- Multi-source data enrichment:
  - CSV lookup (port details)
  - JSON lookup (code mappings)
- Outer joins for data correlation
- Computed fields (route key generation)

## Project Structure
| File | Purpose |
|------|---------|
| types.bal | Source and target type definitions |
| data_mappings.bal | Transformation mapping logic |
| functions.bal | Helper/utility functions |
| automation.bal | Entry point / orchestration |

## Prerequisites
- Ballerina 2201.13.1

## How to Run
```bash
bal run
```

## Data Flow
```
XML Input → Parse → Transform + Lookups → Output Record
```
