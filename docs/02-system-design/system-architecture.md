# System Architecture

## System Boundary

Which functions belong to the system and which do not?

## Block Diagram

```mermaid
flowchart LR
    POWER[Power Supply]
    CONTROL[Controller]
    INTERFACE[Interface]
    LOAD[Load or Sensor]

    POWER --> CONTROL
    POWER --> LOAD
    LOAD --> CONTROL
    CONTROL --> INTERFACE
```

## Interfaces

| Interface | Type | Direction | Voltage | Protocol |
| --------- | ---- | --------- | ------- | -------- |
| IF-001    | TBD  | TBD       | TBD     | TBD      |

## Main Components

| Component  | Function       | Selection status |
| ---------- | -------------- | ---------------- |
| Controller | System control | open             |

## Main Risks

| Risk                    | Impact        | Mitigation             |
| ----------------------- | ------------- | ---------------------- |
| Component not available | Project delay | Define a second source |
