### SSH keys

SSH keys can be assigned on instance creation to provide SSH access.

#### List SSH keys

```shell
curl -H "MC-Api-Key: your_api_key" \
    "https://api.your.cloudmc/v1/services/compute-os/devel/sshkeys"
```
```json
{
	"data": [
		{
			"name": "SSHKeyA",
			"fingerprint": "17:43:84:aa:a1:ed:6b:aa:10:be:73:1f:63:d0:53:16",
			"publicKey": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDlf6/L7kuWWyo8y718JXeKKJa5kdT5QT0GcJUVvuLGNAf/Xjwhc9ThaQk+5mBs49hECTTYlOP0J5lb69kpU2fCmRzroazMD8isOh33o7HdNT9F2CWEKCHJ4Qhd40bXf3b4twz43HIo/pkPyJZ7OVC1v39UNvSkh+iNdUkCVZAO9ijAeW4n+F6WSKG1GqZrdElGSMpTM/DMmNo393N3xOcW4Z9qjG7PGdPIgtxqM/wmyyv0id5eV/QkciOaVEgJ7jzQ/iQA1rdEPI7EojLFgaNTIRjp/fQ/BPQ47ZKimwRzns1csupr2BENDpAXqAqHTgSpEyeG/5OvD4oA521fLoiv Generated-by-Nova"
		},
		{
			"name": "SSHKeyB",
			"fingerprint": "2b:36:6b:f7:98:ef:6a:32:bf:c8:19:94:80:c1:44:60",
			"publicKey": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCnZh9CoR97SY2gA7/JhShzNcxt0VVEi0QMOH/IJZWdu5mtSdJrIvZVTMVVKdae6PUQaYsVt5IImeOZLYiHkUNvvkm291BnKwuymjV9J/CftRs0ZM0X/VhftmROAT5G89Fw57VU6L6bjV4ex7fvAAhr44KJZsgViswOcxJSuwoGmQX15GJAxsSOQ4GthHWJWoifBG0la7+rtAPRUS/qAcCcVuaLNqTalSUtrAytD8J4tswd6UzzPf3MUJWMW36aExwhJW22oHQxvOSot2e36ZFhtHXj1PJs4ZG9mE9JMMz/Y9eIdHMg30vb/YQ5ftsJUs9xjjDD5+fjQxttB1QqqyCp Generated-by-Nova"
		}
	],
	"metadata": {
		"recordCount": 2
	}
}
```

<code>GET /services/<a href="#service-connections">:service_code</a>/<a href="#environments">:environment_name</a>/sshkeys</code>

Retrieve a list of SSH keys in an OpenStack domain.

 Attributes                         | Description                         
 ---------------------------------- | -----------------------------------
 `name`<br/>*string*                | The SSH key's name which is the unique identifier for the entity                    
 `fingerprint`<br/>*string*         | A short sequence of bytes used to identify the SSH key                  
 `publicKey`<br/>*string*           | The SSH public key   

#### Retrieve a SSH key

```shell
curl -H "MC-Api-Key: your_api_key" \
    "https://api.your.cloudmc/v1/services/compute-os/devel/sshkeys/SSHKeyA"
```
```json
{
	"data": {
		"name": "SSHKeyA",
		"fingerprint": "17:43:84:aa:a1:ed:6b:aa:10:be:73:1f:63:d0:53:16",
		"createDate": "2017-06-13T15:26:27.000Z",
		"publicKey": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDlf6/L7kuWWyo8y718JXeKKJa5kdT5QT0GcJUVvuLGNAf/Xjwhc9ThaQk+5mBs49hECTTYlOP0J5lb69kpU2fCmRzroazMD8isOh33o7HdNT9F2CWEKCHJ4Qhd40bXf3b4twz43HIo/pkPyJZ7OVC1v39UNvSkh+iNdUkCVZAO9ijAeW4n+F6WSKG1GqZrdElGSMpTM/DMmNo393N3xOcW4Z9qjG7PGdPIgtxqM/wmyyv0id5eV/QkciOaVEgJ7jzQ/iQA1rdEPI7EojLFgaNTIRjp/fQ/BPQ47ZKimwRzns1csupr2BENDpAXqAqHTgSpEyeG/5OvD4oA521fLoiv Generated-by-Nova"
	}
}
```

<code>GET /services/<a href="#service-connections">:service_code</a>/<a href="#environments">:environment_name</a>/sshkeys/:name</code>

Retrieve a single SSH key in an OpenStack domain.

Attributes                         | Description                         
---------------------------------- | -----------------------------------
`name`<br/>*string*                | The SSH key's name which is the unique identifier for the entity                     
`fingerprint`<br/>*string*         | A short sequence of bytes used to identify the SSH key
`createDate` <br/> *date*          | The date the SSH key was created                 
`publicKey`<br/>*string*           | The SSH public key   

#### Create a SSH key

```shell
curl -X POST \
    -H "MC-Api-Key: your_api_key" \
    -H "Content-Type: application/json" \
    -d "request_body" \
    "https://api.your.cloudmc/v1/services/compute-os/devel/sshkeys"
# Request should look like this:
```
```json
{
    "name": "SSHKeyC",
    "publicKey": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDlf6/L7kuWWyo8y718JXeKKJa5kdT5QT0GcJUVvuLGNAf/Xjwhc9ThaQk+5mBs49hECTTYlOP0J5lb69kpU2fCmRzroazMD8isOh33o7HdNT9F2CWEKCHJ4Qhd40bXf3b4twz43HIo/pkPyJZ7OVC1v39UNvSkh+iNdUkCVZAO9ijAeW4n+F6WSKG1GqZrdElGSMpTM/DMmNo393N3xOcW4Z9qjG7PGdPIgtxqM/wmyyv0id5eV/QkciOaVEgJ7jzQ/iQA1rdEPI7EojLFgaNTIRjp/fQ/BPQ47ZKimwRzns1csupr2BENDpAXqAqHTgSpEyeG/5OvD4oA521fLoiv Generated-by-Nova"
}
```

<code>POST /services/<a href="#service-connections">:service_code</a>/<a href="#environments">:environment_name</a>/sshkeys</code>

Create a SSH key.

Required attributes                | Description                         
---------------------------------- | -----------------------------------
`name`<br/>*string*                | The SSH key's name which is the unique identifier for the entity                              
`publicKey`<br/>*string*           | A public SSH key in RSA format

#### Delete a SSH key

```shell
curl -X DELETE \
    -H "MC-Api-Key: your_api_key" \
    "https://api.your.cloudmc/v1/services/compute-os/devel/sshkeys/SSHKeyC"
```

<code>DELETE /services/<a href="#service-connections">:service_code</a>/<a href="#environments">:environment_name</a>/sshkeys/:name</code>

Delete a SSH key.
