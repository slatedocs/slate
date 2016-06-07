# NOR Flash Storage APIs
################################
The ProMotion board features an on-chip NOR flash recorder with 128 Mbits of memory. Here are the APIs associated with this subsystem.

### eraseStorage()
This function erases the on-chip NOR flash recorder. The function call can be performed in two ways: Quick Erase, and Mass Erase. The Quick Erase scans the NOR flash and erases the non-empty parts, while the Mass Erase is performed over the whole flash. The Quick Erase could take between 1 second to 3 minutes depending on the amount of data that is present in the flash. The Mass Erase takes always around 3 minutes to complete. It is always recommended to issue a Quick Erase instead of Mass Erase for faster operation.

### sessionRecord()
This function commands Neblina to either start a new recording session, or close the currently open one. The NOR flash recorder can record up to 65536 recording sessions.

### sessionPlayback()
This function commands Neblina to either open a previously recorded session for playback or close the one that is currently open and being played. The session number should be provided as an input argument for this function call. If no session number is provided, the playback will be performed over the last recorded session.

### getSessionCount()
This function asks Neblina about how many recorded sessions exist in the NOR flash. After getting a response, the total number of recorded sessions is returned.

### getSessionInfo()
This function asks Neblina about the length of a Session ID recorded in the NOR flash. The Session ID should be provided as an input argument for this function call. The function will then return the length of the session in terms of number of bytes and packets present in the session.


