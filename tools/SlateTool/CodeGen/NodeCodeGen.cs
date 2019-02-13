using System;
using System.Collections.Generic;
using System.Linq;

namespace TSheets.CodeGenTool.CodeGen
{
    internal class NodeCodeGen : CodeGenerator
    {
        internal NodeCodeGen(string endpoint)
            : base(endpoint)
        {
        }

        internal override string GenGetCode(List<KeyValuePair<string, string>> parameters)
        {
            string paramString = null;
            if (parameters != null)
            {
                paramString = "  qs: { "
                    + string.Join("," + NewLine() + new string(' ', 8), parameters.Select(kvp => $"{kvp.Key}: '{kvp.Value}'").ToList()) + NewLine()
                    + "  }," + NewLine();
            }

            string code1 = $"var request = require(\"request\");" + NewLine(2)

                         + $"var options = {{ method: 'GET'," + NewLine()
                         + $"  url: '{BaseUrl}/{this.Endpoint}'," + NewLine();

            string code2 = $"  headers: " + NewLine()
                         + $"   {{ Authorization: 'Bearer <TOKEN>' }} }};" + NewLine(2)

                         + $"request(options, function (error, response, body) {{" + NewLine()
                         + $"  if (error) throw new Error(error);" + NewLine(2)
                         + $"  console.log(body);" + NewLine()
                         + $"}});";

            return code1 + paramString + code2;
        }

        internal override string GenPutCode()
        {
            return $"var request = require(\"request\");" + NewLine(2)

                 + $"var options = {{ method: 'PUT'," + NewLine()
                 + $"  url: '{BaseUrl}/{this.Endpoint}'," + NewLine()
                 + $"  headers: " + NewLine()
                 + $"   {{ 'Content-Type': 'application/json'," + NewLine()
                 + $"      Authorization: 'Bearer <TOKEN>' }}," + NewLine()
                 + $"  body: '<REQUEST BODY>'," + NewLine()
                 + $"  json: true }};" + NewLine(2)

                 + $"request(options, function (error, response, body) {{" + NewLine()
                 + $"  if (error) throw new Error(error);" + NewLine(2)

                 + $"  console.log(body);" + NewLine()
                 + $"}});";
        }

        internal override string GetDeleteCode()
        {
            throw new NotImplementedException();
        }

        internal override string GenPostCode()
        {
            return $"var request = require(\"request\");" + NewLine(2)

                 + $"var options = {{ method: 'POST'," + NewLine()
                 + $"  url: '{BaseUrl}/{this.Endpoint}'," + NewLine()
                 + $"  headers: " + NewLine()
                 + $"   {{ 'Content-Type': 'application/json'," + NewLine()
                 + $"     Authorization: 'Bearer <TOKEN>' }}," + NewLine()
                 + $"  body: '<REQUEST BODY>'," + NewLine()
                 + $"  json: true }};" + NewLine(2)

                 + $"request(options, function (error, response, body) {{" + NewLine()
                 + $"  if (error) throw new Error(error);" + NewLine(2)

                 + $"  console.log(body);" + NewLine()
                 + $"}});";
        }
    }
}
