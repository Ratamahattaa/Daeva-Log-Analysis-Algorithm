<div align="center">

# Daeva
</div>

<table>
<tr>
<td width="60%">

## Project Description

**daeva** is a log analysis algorithm for system and application text files (`.log`, `.txt`).  
Its primary purpose is to filter diagnostically relevant entries and display their time context in a clear and structured way.  

The tool simplifies troubleshooting by highlighting errors, exceptions, warnings, and certificate-related issues, while ignoring irrelevant metadata. It supports multiple log files at once, making it suitable for larger environments and log collections.

## Features

- **Two analysis modes**:
  - **error** → detects `error`, `exception`, `warning`.  
  - **cert** → detects `certificate`-related issues.  
- **Noise filtering** → removes lines with metadata (`level`, `appID`, `environment`).  
- **Multi-file support** → scans all `.log` and `.txt` files in a chosen directory.  
- **Time context extraction** → displays the last detected timestamp from the file alongside each result.  
- **Colored output** → highlights key elements for better readability.  

## Technologies

- **Bash** — core logic and filtering.  
- **grep / regex** — pattern detection and extraction.  
- **ANSI colors** — improved readability in terminal output.  

## How to Use

1. Place your `.log` and `.txt` files in the configured directory.  
2. Run the script:  

   ```bash
   ./daeva.sh
</td>
<td>

<img src="0fHSbGS.jpg" alt="Daeva Preview" width="100%">


</td>
</tr>
</table>


