import os
import re

from settings import ENDPOINTS_DIR

DOCUMENTATION_DIR = os.path.join(os.path.dirname(__file__), "../source/includes")

def get_all_endpoints():
    endpoints = []
    for root, dirs, files in os.walk(ENDPOINTS_DIR):
        for file in files:
            with open(os.path.join(root, file), 'r') as f:
                if re.search(r"public bool \$api_disabled = true;", f.read()):
                    continue

            endpoints.append(root.split(ENDPOINTS_DIR)[1] + "/" + file[:-4])

    endpoints.sort()
    return endpoints

def get_all_documented_endpoints():
    endpoints = []

    for file in os.listdir(DOCUMENTATION_DIR):
        file_cat = file[1:-3]
        with open(os.path.join(DOCUMENTATION_DIR, file), 'r') as f:
            for line in f.readlines():
                match = re.match(r"curl https:\/\/api\.simplyprint\.io\/\{id\}(.*?)(\?| \\).*$", line)

                if not match:
                    continue

                endpoints.append(match.group(1))

    endpoints.sort()
    return endpoints

if __name__ == "__main__":
    endpoints = get_all_endpoints()
    documented_endpoints = get_all_documented_endpoints()

    # Show endpoints that are not documented and endpoints that have been removed
    print("Undocumented endpoints:")
    for endpoint in endpoints:
        if endpoint not in documented_endpoints and not endpoint.startswith("/status/"):
            print(f"  - {endpoint}")

    print("Removed endpoints:")
    for endpoint in documented_endpoints:
        if endpoint not in endpoints:
            print(f"  - {endpoint}")
