# File that generates template markdown from endpoints folder

import os
import re
from settings import ENDPOINTS_DIR

OUTPUT_DIR = "./output"

# Template
TEMPLATE = """
## {endpoint}

```shell
curl https://api.simplyprint.io/{{id}}{full_endpoint} \\
  -X ? \\
  -H 'accept: application/json' \\
  -H 'X-API-KEY: {{API_KEY}}'
```

> Success response

```json
{{
    "TODO": "TODO"
}}
```

### Request

`? /{{id}}{full_endpoint}`

TODO
"""


# Get all level folders in endpoints
folders = [f for f in os.listdir(ENDPOINTS_DIR) if os.path.isdir(
    os.path.join(ENDPOINTS_DIR, f))]

includes = []

# Walk through each folder
for folder in folders:
    out = f"# {folder.title()}\n"

    # Use os.walk to get all php source
    for root, dirs, files in os.walk(os.path.join(ENDPOINTS_DIR, folder)):
        for file in files:
            # Readfd
            with open(os.path.join(root, file), "r") as f:
                if re.search(r"public bool \$api_disabled = true;", f.read()):
                    #print("Skipping disabled endpoint: " + file[:-4])
                    continue

            # Write template
            endpoint_path = root.split(ENDPOINTS_DIR)[1]
            endpoint_dir = root.split("/")[-1]
            endpoint = file[:-4]

            if endpoint_dir != folder:
                endpoint = endpoint_dir + "/" + file[:-4]

            out += TEMPLATE.format(endpoint=endpoint,
                                   full_endpoint=endpoint_path + "/" + file[:-4])

    if len(out.splitlines()) == 1:
        print("Skipping empty folder: " + folder)
        continue

    # Write to file
    with open(os.path.join(OUTPUT_DIR, f"_{folder}.md"), "w") as fd:
        fd.write(out)
    includes.append(folder)

# Generate yaml includes:
print("Yaml includes:")
print("\n".join([f"  - {f}" for f in includes]))
