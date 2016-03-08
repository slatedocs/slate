# Using the HPE RESTful Interface Tool

TODO - fill in this section

#Troubleshooting

## Resetting the RESTful API

**Symptom**

ProLiant Gen9 servers could possibly experience a RESTful API error during system boot that results in inability to configure the BIOS settings using the RESTful API. In addition, the following persistent error message might display during system boot (POST) and is logged to the Integrated Management Log:

    335 RESTful API Error- RESTful API PUT request failed (HTTP: Status Code = 404)

With iLO firmware v2.20 or later, you can reset the REST API. You do this through the RESTful API using any 3rd party REST web client, the **RESTful Interface Tool**, or from the HPE Embedded UEFI shell restclient command.

### With a REST client

1.	Execute a POST operation to the resource at URI `<ilo-ip>/rest/v1/managers/1` with the following JSON in the request body.

    {"Action":"ClearRestApiState", "Target":"/Oem/Hp"}


2.	Restart the server.


### With the RESTful Interface Tool

1.	Download and install the **RESTful interface Tool**. For more information on using this tool, refer to [http://www.hpe.com/info/resttool](http://www.hpe.com/info/resttool).
2.	Copy and paste the following JSON into a text file and save it as
hprest_tool_clear_api.json.

    {
    	"path": "/rest/v1/managers/1",
    	"body": {
    		"Action": "ClearRestApiState",
    		"Target": "/Oem/Hp"
    	}
    }

3.	Start the hprest tool.

    hprest

4.	Log in to iLO.

    hprest> login <ilo-ip>

5.	Run the following command, pointing to the hprest_tool_clear_api.json file.

    hprest> rawpost hprest_tool_clear_api.json

6.	Restart the server.


### With the UEFI Shell

1.	Enter the Embedded UEFI Shell. For more information, refer to the UEFI Shell User Guide
at [http://www.hpe.com/servers/proliant/uefi](http://www.hpe.com/servers/proliant/uefi).
2.	Copy and paste the following JSON into an ASCII text file save it as clear_api.json on FAT formatted USB media.


    {
    "Action":"ClearRestApiState", "Target":"/Oem/Hp"
    }
    

3.	Attach the USB media to the server.
4.	Turn on the server and boot to the Embedded UEFI Shell.
5.	At the UEFI shell prompt, use the partitions command to find the file system that corresponds to the USB media. For example, FS0, FS1, and so on.
6.	To switch to the file system, type the file system name (for example, shell>FS0: ).
7.	Execute the following command:

    Fs0:> restclient –m POST –uri “/rest/v1/managers/1” –i clear_api.json

8.	Restart the server.


### With the iLO SSH CLI

1.	Open an SSH connection with iLO, log in using an account with administrator privileges. For more information, see the HPE iLO 4 Scripting and Command Line Guide at [http:// www.hpe.com/info/iLO](http://www.hpe.com/info/iLO).
2.	At the CLI prompt, execute the command `oemhp_clearRESTAPIstate`. Note that this command might take a few seconds to complete.
3.	Restart the server.


