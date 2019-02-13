using System;
using System.Collections.Generic;
using System.Linq;

namespace TSheets.CodeGenTool.CodeGen
{
    internal class PythonCodeGen : CodeGenerator
    {
        internal PythonCodeGen(string endpoint)
            : base(endpoint)
        {
        }

        internal override string GenGetCode(List<KeyValuePair<string, string>> parameters)
        {
            string paramString = null;
            string paramStringParam = null;
            if (parameters != null)
            {
                paramString = "querystring = {" + NewLine() + "  "
                    + string.Join("," + NewLine() + "  ", parameters.Select(kvp => $"\"{kvp.Key}\":\"{kvp.Value}\"").ToList()) + NewLine()
                    + "}" + NewLine(2);

                paramStringParam = ", params=querystring";
            }

            string code1 = $"import requests" + NewLine(2)

                         + $"url = \"{BaseUrl}/{this.Endpoint}\"" + NewLine(2);

            string code2 = $"payload = \"\"" + NewLine()
                         + $"headers = {{" + NewLine()
                         + $"    'Authorization': \"Bearer <TOKEN>\"" + NewLine()
                         + $"    }}" + NewLine(2)

                         + $"response = requests.request(\"GET\", url, data=payload, headers=headers{paramStringParam})" + NewLine(2)

                         + $"print(response.text)";

            return code1 + paramString + code2;
        }

        internal override string GenPutCode()
        {
            return $"import requests" + NewLine(2)

                 + $"url = \"{BaseUrl}/{this.Endpoint}\"" + NewLine(2)

                 + $"payload = \"<REQUEST BODY>\"" + NewLine()
                 + $"headers = {{" + NewLine()
                 + $"    'Authorization': \"Bearer <TOKEN>\"," + NewLine()
                 + $"    'Content-Type': \"application/json\"" + NewLine()
                 + $"    }}" + NewLine(2)

                 + $"response = requests.request(\"PUT\", url, data=payload, headers=headers)" + NewLine(2)

                 + $"print(response.text)";
        }

        internal override string GetDeleteCode()
        {
            throw new NotImplementedException();
        }

        internal override string GenPostCode()
        {
            return $"import requests" + NewLine(2)

                 + $"url = \"{BaseUrl}/{this.Endpoint}\"" + NewLine(2)

                 + $"payload = \"<REQUEST BODY>\"" + NewLine()
                 + $"headers = {{" + NewLine()
                 + $"    'Authorization': \"Bearer <TOKEN>\"," + NewLine()
                 + $"    'Content-Type': \"application/json\"" + NewLine()
                 + $"    }}" + NewLine(2)

                 + $"response = requests.request(\"POST\", url, data=payload, headers=headers)" + NewLine(2)

                 + $"print(response.text)";
        }
    }
}
